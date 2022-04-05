cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "cordova.ve.smartvideo.smartvideo",
      "file": "plugins/cordova.ve.smartvideo/www/smartvideo.js",
      "pluginId": "cordova.ve.smartvideo",
      "clobbers": [
        "cordova.plugins.smartvideo"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova.ve.smartvideo": "1.0.0"
  };
});