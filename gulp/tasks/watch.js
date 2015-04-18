/* Notes:
   - gulp/tasks/browserify.js handles js recompiling with watchify
*/

var gulp   = require('gulp');
var config = require('../config');
var watch  = require('gulp-watch');

gulp.task('watch', ['watchify'], function(callback) {
  watch(config.sass.src, function() { gulp.start('sass'); });
  // Watchify will watch and recompile our JS, so no need to gulp.watch it
});
