// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.content.Intent;
import android.util.Log;
import android.webkit.ValueCallback;

// Referenced classes of package org.apache.cordova:
//            CordovaPlugin, CordovaChromeClient

class val.uploadMsg extends CordovaPlugin
{

    final CordovaChromeClient this$0;
    final ValueCallback val$uploadMsg;

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (intent == null || j != -1)
        {
            intent = null;
        } else
        {
            intent = intent.getData();
        }
        Log.d(CordovaChromeClient.access$000(CordovaChromeClient.this), (new StringBuilder()).append("Receive file chooser URL: ").append(intent).toString());
        val$uploadMsg.onReceiveValue(intent);
    }

    ()
    {
        this$0 = final_cordovachromeclient;
        val$uploadMsg = ValueCallback.this;
        super();
    }
}
