// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;


// Referenced classes of package org.apache.cordova:
//            SplashScreenInternal

class val.message
    implements Runnable
{

    final SplashScreenInternal this$0;
    final String val$message;
    final String val$title;

    public void run()
    {
        SplashScreenInternal.access$000(SplashScreenInternal.this, val$title, val$message);
    }

    ()
    {
        this$0 = final_splashscreeninternal;
        val$title = s;
        val$message = String.this;
        super();
    }
}
