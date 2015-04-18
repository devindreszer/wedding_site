var gulp         = require('gulp');
var gulpSequence = require('gulp-sequence');

gulp.task('build', function(cb) {
  var tasks = ['clean', ['fonts'], ['sass', 'browserify']],
      railsEnv = process.env.RAILS_ENV;
  if (railsEnv === 'production' || railsEnv === 'staging') {
    tasks.push('rev-assets');
    tasks.push('rev');
    tasks.push('rev-app-js');
  }
  tasks.push(cb);
  gulpSequence.apply(this, tasks);
});
