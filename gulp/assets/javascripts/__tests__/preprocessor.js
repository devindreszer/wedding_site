var coffee = require('coffee-react');

module.exports = {
  process: function(src, path) {
    if (path.match(/\.cjsx$/)) {
      return coffee.compile(src, {bare: true});
    }
    return src;
  }
};
