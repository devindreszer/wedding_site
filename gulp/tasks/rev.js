var config        = require('../config');
var gulp          = require('gulp');
var rev           = require('gulp-rev');
var revCollector  = require('gulp-rev-collector');
var fs            = require('fs');
var path          = require('path');
var through       = require('through2');
var gutil         = require('gulp-util');
var log           = gutil.log;
var colors        = gutil.colors;
var debug         = require('gulp-debug');

var rmOrig = function() {
  return through.obj(function(file, enc, cb) {
    this.push(file); // We'll just pass this file along
    if (!file.revOrigPath) {
      return cb(); // Nothing to remove :)
    }

    log(colors.red('DELETING'), file.revOrigPath);
    fs.unlink(file.revOrigPath, function(err) {
      // TODO: emit an error if err
      cb();
    });
  });
};

var requireInAssetPipeline = function() {
  fs.readFile(config.railsAssetFile, 'utf8', function (err,data) {
    if (err) {
      return console.log(err);
    }
    var manifestPath = config.publicAssets + '/rev-manifest.json';
    var manifest = JSON.parse(fs.readFileSync(manifestPath), 'utf8');
    var assetPath = manifest['javascripts/reactComponents.js']
    var assetName = path.basename(assetPath, '.js');
    log('assetPath:' + assetPath)
    log('assetName:' + assetName)
    var result = data.replace(/reactComponents/g, assetName);

    fs.writeFile(config.railsAssetFile, result, 'utf8', function (err) {
      if (err) return console.log(err);
    });
  });
};

// Add md5 hashes to assets
gulp.task('rev-assets', function(){
  var task = gulp.src(config.publicAssets + '/**/!(*.{css,js})')
  .pipe(rev())
  .pipe(gulp.dest(config.publicAssets))
  .pipe(rev.manifest())
  .pipe(gulp.dest(config.publicAssets));
  return task;
});

// Replace asset references in compiled css and js files
gulp.task('rev', function(){
  var task = gulp.src([config.publicAssets + '/rev-manifest.json', config.publicAssets + '/**/*.{css,js}'])
  .pipe(revCollector())
  .pipe(gulp.dest(config.publicAssets));
  return task;
});

gulp.task('rev-app-js', function(cb){
  requireInAssetPipeline();
});
