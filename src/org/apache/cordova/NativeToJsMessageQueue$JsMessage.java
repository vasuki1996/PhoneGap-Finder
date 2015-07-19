// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;


// Referenced classes of package org.apache.cordova:
//            NativeToJsMessageQueue, PluginResult

private static class pluginResult
{

    final String jsPayloadOrCallbackId;
    final PluginResult pluginResult;

    static int calculateEncodedLengthHelper(PluginResult pluginresult)
    {
        pluginresult.getMessageType();
        JVM INSTR tableswitch 1 8: default 52
    //                   1 74
    //                   2 52
    //                   3 64
    //                   4 62
    //                   5 62
    //                   6 94
    //                   7 84
    //                   8 104;
           goto _L1 _L2 _L1 _L3 _L4 _L4 _L5 _L6 _L7
_L1:
        int k = pluginresult.getMessage().length();
_L9:
        return k;
_L4:
        return 1;
_L3:
        return pluginresult.getMessage().length() + 1;
_L2:
        return pluginresult.getStrMessage().length() + 1;
_L6:
        return pluginresult.getMessage().length() + 1;
_L5:
        return pluginresult.getMessage().length() + 1;
_L7:
        int i = 1;
        int j = 0;
        do
        {
            k = i;
            if (j >= pluginresult.getMultipartMessagesSize())
            {
                continue;
            }
            k = calculateEncodedLengthHelper(pluginresult.getMultipartMessage(j));
            i += String.valueOf(k).length() + 1 + k;
            j++;
        } while (true);
        if (true) goto _L9; else goto _L8
_L8:
    }

    static void encodeAsMessageHelper(StringBuilder stringbuilder, PluginResult pluginresult)
    {
        pluginresult.getMessageType();
        JVM INSTR tableswitch 1 8: default 52
    //                   1 99
    //                   2 52
    //                   3 84
    //                   4 62
    //                   5 76
    //                   6 133
    //                   7 116
    //                   8 150;
           goto _L1 _L2 _L1 _L3 _L4 _L5 _L6 _L7 _L8
_L1:
        stringbuilder.append(pluginresult.getMessage());
_L10:
        return;
_L4:
        stringbuilder.append(pluginresult.getMessage().charAt(0));
        return;
_L5:
        stringbuilder.append('N');
        return;
_L3:
        stringbuilder.append('n').append(pluginresult.getMessage());
        return;
_L2:
        stringbuilder.append('s');
        stringbuilder.append(pluginresult.getStrMessage());
        return;
_L7:
        stringbuilder.append('S');
        stringbuilder.append(pluginresult.getMessage());
        return;
_L6:
        stringbuilder.append('A');
        stringbuilder.append(pluginresult.getMessage());
        return;
_L8:
        stringbuilder.append('M');
        int i = 0;
        while (i < pluginresult.getMultipartMessagesSize()) 
        {
            PluginResult pluginresult1 = pluginresult.getMultipartMessage(i);
            stringbuilder.append(String.valueOf(calculateEncodedLengthHelper(pluginresult1)));
            stringbuilder.append(' ');
            encodeAsMessageHelper(stringbuilder, pluginresult1);
            i++;
        }
        if (true) goto _L10; else goto _L9
_L9:
    }

    int calculateEncodedLength()
    {
        if (pluginResult == null)
        {
            return jsPayloadOrCallbackId.length() + 1;
        } else
        {
            int i = String.valueOf(pluginResult.getStatus()).length();
            int j = jsPayloadOrCallbackId.length();
            return calculateEncodedLengthHelper(pluginResult) + (i + 2 + 1 + j + 1);
        }
    }

    void encodeAsJsMessage(StringBuilder stringbuilder)
    {
        if (pluginResult == null)
        {
            stringbuilder.append(jsPayloadOrCallbackId);
            return;
        }
        int i = pluginResult.getStatus();
        boolean flag;
        if (i == pluginResult.pluginResult() || i == pluginResult.pluginResult())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        stringbuilder.append("cordova.callbackFromNative('").append(jsPayloadOrCallbackId).append("',").append(flag).append(",").append(i).append(",[");
        pluginResult.getMessageType();
        JVM INSTR tableswitch 6 7: default 112
    //                   6 177
    //                   7 152;
           goto _L1 _L2 _L3
_L1:
        stringbuilder.append(pluginResult.getMessage());
_L5:
        stringbuilder.append("],").append(pluginResult.getKeepCallback()).append(");");
        return;
_L3:
        stringbuilder.append("atob('").append(pluginResult.getMessage()).append("')");
        continue; /* Loop/switch isn't completed */
_L2:
        stringbuilder.append("cordova.require('cordova/base64').toArrayBuffer('").append(pluginResult.getMessage()).append("')");
        if (true) goto _L5; else goto _L4
_L4:
    }

    void encodeAsMessage(StringBuilder stringbuilder)
    {
        if (pluginResult == null)
        {
            stringbuilder.append('J').append(jsPayloadOrCallbackId);
            return;
        }
        int i = pluginResult.getStatus();
        char c;
        StringBuilder stringbuilder1;
        boolean flag;
        boolean flag1;
        boolean flag2;
        if (i == pluginResult.pluginResult())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (i == pluginResult.pluginResult())
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        flag2 = pluginResult.getKeepCallback();
        if (flag || flag1)
        {
            c = 'S';
        } else
        {
            c = 'F';
        }
        stringbuilder1 = stringbuilder.append(c);
        if (flag2)
        {
            c = '1';
        } else
        {
            c = '0';
        }
        stringbuilder1.append(c).append(i).append(' ').append(jsPayloadOrCallbackId).append(' ');
        encodeAsMessageHelper(stringbuilder, pluginResult);
    }

    _cls9(String s)
    {
        if (s == null)
        {
            throw new NullPointerException();
        } else
        {
            jsPayloadOrCallbackId = s;
            pluginResult = null;
            return;
        }
    }

    pluginResult(PluginResult pluginresult, String s)
    {
        if (s == null || pluginresult == null)
        {
            throw new NullPointerException();
        } else
        {
            jsPayloadOrCallbackId = s;
            pluginResult = pluginresult;
            return;
        }
    }
}
