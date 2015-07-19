// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;


// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal, CordovaWebView

class this._cls0
    implements Runnable
{

    final SplashScreenInternal this$0;

    public void run()
    {
        webView.postMessage("splashscreen", "show");
    }

    ()
    {
        this$0 = SplashScreenInternal.this;
        super();
    }
}
