// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.ProgressDialog;
import android.content.DialogInterface;

// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal, CordovaWebView

class val.message
    implements Runnable
{

    final SplashScreenInternal this$0;
    final String val$message;
    final String val$title;

    public void run()
    {
        SplashScreenInternal.access$300(SplashScreenInternal.this);
        ProgressDialog _tmp = SplashScreenInternal.access$402(ProgressDialog.show(webView.getContext(), val$title, val$message, true, true, new android.content.DialogInterface.OnCancelListener() {

            final SplashScreenInternal._cls6 this$1;

            public void onCancel(DialogInterface dialoginterface)
            {
                ProgressDialog _tmp = SplashScreenInternal.access$402(null);
            }

            
            {
                this$1 = SplashScreenInternal._cls6.this;
                super();
            }
        }));
    }

    _cls1.this._cls1()
    {
        this$0 = final_splashscreeninternal;
        val$title = s;
        val$message = String.this;
        super();
    }
}
