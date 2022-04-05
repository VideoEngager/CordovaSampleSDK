package cordova.ve.smartvideo;

import android.util.Log;
import android.widget.Toast;

import com.google.gson.Gson;
import com.videoengager.sdk.VideoEngager;
import com.videoengager.sdk.model.*;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class smartvideo extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
             
        if (action.equals("toast")) {
            Toast.makeText(this.cordova.getActivity(), args.getString(0),Toast.LENGTH_SHORT).show();
            return true;
        }
        if (action.equals("videoCall")) {
           // Settings settings = new Gson().fromJson(args.getString(0),Settings.class);
            Settings settings = new Settings(
                    "c4b553c3-ee42-4846-aeb1-f0da3d85058e",
                    "973f8326-c601-40c6-82ce-b87e6dafef1c",
                    "https://videome.videoengager.com",
                    "hbvvUTaZxCVLikpB",
                    "https://api.mypurecloud.com",
                    "MobileDev",
                    "mobiledev",
                    "Mobile Tester",
                    "Mobile Demo Tester",
                    "",
                    "test@test.com","",
                    VideoEngager.Language.ENGLISH,null,null,null,null,
                    null,true,null,null,
                    null,false,true,30,null,120
            );
            VideoEngager ve = new VideoEngager(this.cordova.getActivity(),settings, VideoEngager.Engine.genesys );
            ve.Connect(VideoEngager.CallType.video);
            return true;
        }
        if (action.equals("audioCall")) {
            // Settings settings = new Gson().fromJson(args.getString(0),Settings.class);
            Settings settings = new Settings(
                    "c4b553c3-ee42-4846-aeb1-f0da3d85058e",
                    "973f8326-c601-40c6-82ce-b87e6dafef1c",
                    "https://videome.videoengager.com",
                    "hbvvUTaZxCVLikpB",
                    "https://api.mypurecloud.com",
                    "MobileDev",
                    "mobiledev",
                    "Mobile Tester",
                    "Mobile Demo Tester",
                    "",
                    "test@test.com","",
                    VideoEngager.Language.ENGLISH,null,null,null,null,
                    null,false,null,null,
                    null,true,false,30,null,120
            );
            VideoEngager ve = new VideoEngager(this.cordova.getActivity(),settings, VideoEngager.Engine.genesys );
            ve.Connect(VideoEngager.CallType.audio);
            return true;
        }
        return false;
    }

}
