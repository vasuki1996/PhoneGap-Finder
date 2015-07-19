// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.Dialog;

// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal

class this._cls0
    implements Runnable
{

    final SplashScreenInternal this$0;

    public void run()
    {
        if (SplashScreenInternal.access$100() != null && SplashScreenInternal.access$100().isShowing())
        {
            SplashScreenInternal.access$100().dismiss();
            Dialog _tmp = SplashScreenInternal.access$102(null);
        }
    }

    ()
    {
        this$0 = SplashScreenInternal.this;
        super();
    }
}
