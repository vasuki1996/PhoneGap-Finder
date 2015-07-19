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

class val.splashscreenTime
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
        linearlayout.setLayoutParams(new android.widget.ms(-1, -1, 0.0F));
        linearlayout.setBackgroundResource(val$drawableId);
        Dialog _tmp = SplashScreenInternal.access$102(new Dialog(context, 0x1030010));
        if ((cordova.getActivity().getWindow().getAttributes().flags & 0x400) == 1024)
        {
            SplashScreenInternal.access$100().getWindow().setFlags(1024, 1024);
        }
        SplashScreenInternal.access$100().setContentView(linearlayout);
        SplashScreenInternal.access$100().setCancelable(false);
        SplashScreenInternal.access$100().show();
        if (val$hideAfterDelay)
        {
            (new Handler()).postDelayed(new Runnable() {

                final SplashScreenInternal._cls5 this$1;

                public void run()
                {
                    SplashScreenInternal.access$200(this$0);
                }

            
            {
                this$1 = SplashScreenInternal._cls5.this;
                super();
            }
            }, val$splashscreenTime);
        }
    }

    _cls1.this._cls1()
    {
        this$0 = final_splashscreeninternal;
        val$drawableId = i;
        val$hideAfterDelay = flag;
        val$splashscreenTime = I.this;
        super();
    }
}
