var publicAssets    = "./public/assets",
    sourceFiles     = "./gulp/assets",
    railsAssetFile  = "./app/assets/javascripts/application.js";

module.exports = {
  publicAssets: publicAssets,
  railsAssetFile: railsAssetFile,
  sass: {
    src: sourceFiles + "/stylesheets/**/*.{sass,scss}",
    dest: publicAssets + "/stylesheets",
    settings: {}
  },
  fonts: {
    src: sourceFiles + "/fonts/**",
    dest: publicAssets + "/fonts"
  },
  browserify: {
    bundleConfigs: [{
      entries: sourceFiles + '/javascripts/ReactComponents.coffee',
      dest: publicAssets + "/javascripts",
      outputName: 'reactComponents.js',
      extensions: ['.coffee', '.cjsx']
    }]
  }
};
