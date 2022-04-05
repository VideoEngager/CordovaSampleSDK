var exec = require('cordova/exec');

module.exports = {
    
    toast : function (arg0) {
        exec(null, null, 'smartvideo', 'toast', [arg0]);
    },

    videoCall : function (arg0) {
        exec(null, null, 'smartvideo', 'videoCall', [arg0]);
    },

    audioCall : function (arg0) {
        exec(null, null, 'smartvideo', 'audioCall', [arg0]);
    }

}