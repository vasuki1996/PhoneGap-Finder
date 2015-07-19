// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.phonegap.www;

import android.os.Bundle;
import org.apache.cordova.CordovaActivity;

public class Finder extends CordovaActivity
{

    public Finder()
    {
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        super.init();
        loadUrl(launchUrl);
    }
}
