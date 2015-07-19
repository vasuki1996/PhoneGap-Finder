// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.webkit.HttpAuthHandler;

// Referenced classes of package org.apache.cordova:
//            ICordovaHttpAuthHandler

public class CordovaHttpAuthHandler
    implements ICordovaHttpAuthHandler
{

    private final HttpAuthHandler handler;

    public CordovaHttpAuthHandler(HttpAuthHandler httpauthhandler)
    {
        handler = httpauthhandler;
    }

    public void cancel()
    {
        handler.cancel();
    }

    public void proceed(String s, String s1)
    {
        handler.proceed(s, s1);
    }
}
