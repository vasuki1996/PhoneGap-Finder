// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.ProgressDialog;

// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal

class this._cls0
    implements Runnable
{

    final SplashScreenInternal this$0;

    public void run()
    {
        if (SplashScreenInternal.access$400() != null && SplashScreenInternal.access$400().isShowing())
        {
            SplashScreenInternal.access$400().dismiss();
            ProgressDialog _tmp = SplashScreenInternal.access$402(null);
        }
    }

    ()
    {
        this$0 = SplashScreenInternal.this;
        super();
    }
}
