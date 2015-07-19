// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.ProgressDialog;
import android.content.DialogInterface;

// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal, CordovaWebView

class this._cls1
    implements android.content.istener
{

    final ss._cls402 this$1;

    public void onCancel(DialogInterface dialoginterface)
    {
        ProgressDialog _tmp = SplashScreenInternal.access$402(null);
    }

    l.message()
    {
        this$1 = this._cls1.this;
        super();
    }

    // Unreferenced inner class org/apache/cordova/SplashScreenInternal$6

/* anonymous class */
    class SplashScreenInternal._cls6
        implements Runnable
    {

        final SplashScreenInternal this$0;
        final String val$message;
        final String val$title;

        public void run()
        {
            SplashScreenInternal.access$300(SplashScreenInternal.this);
            ProgressDialog _tmp = SplashScreenInternal.access$402(ProgressDialog.show(webView.getContext(), title, message, true, true, new SplashScreenInternal._cls6._cls1()));
        }

            
            {
                this$0 = final_splashscreeninternal;
                title = s;
                message = String.this;
                super();
            }
    }

}
