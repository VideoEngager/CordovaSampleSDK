cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "cordova-plugin-callkit.VoIPPushNotification",
      "file": "plugins/cordova-plugin-callkit/www/VoIPPushNotification.js",
      "pluginId": "cordova-plugin-callkit",
      "clobbers": [
        "VoIPPushNotification"
      ]
    },
    {
      "id": "cordova-plugin-callkit.CordovaCall",
      "file": "plugins/cordova-plugin-callkit/www/CordovaCall.js",
      "pluginId": "cordova-plugin-callkit",
      "clobbers": [
        "cordova.plugins.CordovaCall"
      ]
    },
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
    "cordova-plugin-add-swift-support": "2.0.2",
    "cordova-plugin-ios-camera-permissions": "1.2.0",
    "cordova-plugin-callkit": "1.0.0",
    "cordova.ve.smartvideo": "1.1.0"
  };
});