// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.Activity;
import android.app.Dialog;
import android.os.Handler;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;

// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal, CordovaInterface, CordovaWebView, CordovaPreferences

class this._cls1
    implements Runnable
{

    final is._cls0 this$1;

    public void run()
    {
        SplashScreenInternal.access$200(_fld0);
    }

    l.splashscreenTime()
    {
        this$1 = this._cls1.this;
        super();
    }

    // Unreferenced inner class org/apache/cordova/SplashScreenInternal$5

/* anonymous class */
    class SplashScreenInternal._cls5
        implements Runnable
    {

        final SplashScreenInternal this$0;
        final int val$drawableId;
        final boolean val$hideAfterDelay;
        final int val$splashscreenTime;

        public void run()
        {
            Display display = cordova.getActivity().getWindowManager().getDefaultDisplay();
            android.content.Context context = webView.getContext();
            LinearLayout linearlayout = new LinearLayout(context);
            linearlayout.setMinimumHeight(display.getHeight());
            linearlayout.setMinimumWidth(display.getWidth());
            linearlayout.setOrientation(1);
            linearlayout.setBackgroundColor(preferences.getInteger("backgroundColor", 0xff000000));
            linearlayout.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1, 0.0F));
            linearlayout.setBackgroundResource(drawableId);
            Dialog _tmp = SplashScreenInternal.access$102(new Dialog(context, 0x1030010));
            if ((cordova.getActivity().getWindow().getAttributes().flags & 0x400) == 1024)
            {
                SplashScreenInternal.access$100().getWindow().setFlags(1024, 1024);
            }
            SplashScreenInternal.access$100().setContentView(linearlayout);
            SplashScreenInternal.access$100().setCancelable(false);
            SplashScreenInternal.access$100().show();
            if (hideAfterDelay)
            {
                (new Handler()).postDelayed(new SplashScreenInternal._cls5._cls1(), splashscreenTime);
            }
        }

            
            {
                this$0 = final_splashscreeninternal;
                drawableId = i;
                hideAfterDelay = flag;
                splashscreenTime = I.this;
                super();
            }
    }

}
