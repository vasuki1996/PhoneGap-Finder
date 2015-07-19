// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.Activity;
import android.os.Message;
import android.util.Log;
import android.webkit.WebView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package org.apache.cordova:
//            PluginResult, CordovaInterface, CordovaWebView

public class NativeToJsMessageQueue
{
    private abstract class BridgeMode
    {

        final NativeToJsMessageQueue this$0;

        void notifyOfFlush(boolean flag)
        {
        }

        abstract void onNativeToJsMessageAvailable();

        void reset()
        {
        }

        private BridgeMode()
        {
            this$0 = NativeToJsMessageQueue.this;
            super();
        }

    }

    private static class JsMessage
    {

        final String jsPayloadOrCallbackId;
        final PluginResult pluginResult;

        static int calculateEncodedLengthHelper(PluginResult pluginresult)
        {
            pluginresult.getMessageType();
            JVM INSTR tableswitch 1 8: default 52
        //                       1 74
        //                       2 52
        //                       3 64
        //                       4 62
        //                       5 62
        //                       6 94
        //                       7 84
        //                       8 104;
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
        //                       1 99
        //                       2 52
        //                       3 84
        //                       4 62
        //                       5 76
        //                       6 133
        //                       7 116
        //                       8 150;
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
            if (i == PluginResult.Status.OK.ordinal() || i == PluginResult.Status.NO_RESULT.ordinal())
            {
                flag = true;
            } else
            {
                flag = false;
            }
            stringbuilder.append("cordova.callbackFromNative('").append(jsPayloadOrCallbackId).append("',").append(flag).append(",").append(i).append(",[");
            pluginResult.getMessageType();
            JVM INSTR tableswitch 6 7: default 112
        //                       6 177
        //                       7 152;
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
            if (i == PluginResult.Status.NO_RESULT.ordinal())
            {
                flag = true;
            } else
            {
                flag = false;
            }
            if (i == PluginResult.Status.OK.ordinal())
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

        JsMessage(String s)
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

        JsMessage(PluginResult pluginresult, String s)
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

    private class LoadUrlBridgeMode extends BridgeMode
    {

        final Runnable runnable;
        final NativeToJsMessageQueue this$0;

        void onNativeToJsMessageAvailable()
        {
            cordova.getActivity().runOnUiThread(runnable);
        }

        private LoadUrlBridgeMode()
        {
            this$0 = NativeToJsMessageQueue.this;
            super();
            runnable = new _cls1();
        }

    }

    private class OnlineEventsBridgeMode extends BridgeMode
    {

        private boolean ignoreNextFlush;
        private boolean online;
        final Runnable resetNetworkRunnable;
        final NativeToJsMessageQueue this$0;
        final Runnable toggleNetworkRunnable;

        void notifyOfFlush(boolean flag)
        {
            if (flag && !ignoreNextFlush)
            {
                if (!online)
                {
                    flag = true;
                } else
                {
                    flag = false;
                }
                online = flag;
            }
        }

        void onNativeToJsMessageAvailable()
        {
            cordova.getActivity().runOnUiThread(toggleNetworkRunnable);
        }

        void reset()
        {
            cordova.getActivity().runOnUiThread(resetNetworkRunnable);
        }



/*
        static boolean access$1002(OnlineEventsBridgeMode onlineeventsbridgemode, boolean flag)
        {
            onlineeventsbridgemode.online = flag;
            return flag;
        }

*/


/*
        static boolean access$902(OnlineEventsBridgeMode onlineeventsbridgemode, boolean flag)
        {
            onlineeventsbridgemode.ignoreNextFlush = flag;
            return flag;
        }

*/

        private OnlineEventsBridgeMode()
        {
            this$0 = NativeToJsMessageQueue.this;
            super();
            toggleNetworkRunnable = new _cls1();
            resetNetworkRunnable = new _cls2();
        }

    }

    private class PollingBridgeMode extends BridgeMode
    {

        final NativeToJsMessageQueue this$0;

        void onNativeToJsMessageAvailable()
        {
        }

        private PollingBridgeMode()
        {
            this$0 = NativeToJsMessageQueue.this;
            super();
        }

    }

    private class PrivateApiBridgeMode extends BridgeMode
    {

        private static final int EXECUTE_JS = 194;
        boolean initFailed;
        Method sendMessageMethod;
        final NativeToJsMessageQueue this$0;
        Object webViewCore;

        private void initReflection()
        {
            Object obj;
            Object obj1;
            Object obj2;
            obj1 = webView;
            obj2 = android/webkit/WebView;
            obj = obj1;
            Object obj3 = android/webkit/WebView.getDeclaredField("mProvider");
            obj = obj1;
            ((Field) (obj3)).setAccessible(true);
            obj = obj1;
            obj1 = ((Field) (obj3)).get(webView);
            obj = obj1;
            obj3 = obj1.getClass();
            obj2 = obj3;
            obj = obj1;
_L2:
            try
            {
                Field field = ((Class) (obj2)).getDeclaredField("mWebViewCore");
                field.setAccessible(true);
                webViewCore = field.get(obj);
                if (webViewCore != null)
                {
                    sendMessageMethod = webViewCore.getClass().getDeclaredMethod("sendMessage", new Class[] {
                        android/os/Message
                    });
                    sendMessageMethod.setAccessible(true);
                }
                return;
            }
            catch (Throwable throwable)
            {
                initFailed = true;
                Log.e("JsMessageQueue", "PrivateApiBridgeMode failed to find the expected APIs.", throwable);
                return;
            }
            Throwable throwable1;
            throwable1;
            if (true) goto _L2; else goto _L1
_L1:
        }

        void onNativeToJsMessageAvailable()
        {
            Message message;
            if (sendMessageMethod == null && !initFailed)
            {
                initReflection();
            }
            if (sendMessageMethod == null)
            {
                break MISSING_BLOCK_LABEL_60;
            }
            message = Message.obtain(null, 194, popAndEncodeAsJs());
            sendMessageMethod.invoke(webViewCore, new Object[] {
                message
            });
            return;
            Throwable throwable;
            throwable;
            Log.e("JsMessageQueue", "Reflection message bridge failed.", throwable);
            return;
        }

        private PrivateApiBridgeMode()
        {
            this$0 = NativeToJsMessageQueue.this;
            super();
        }

    }


    static final boolean DISABLE_EXEC_CHAINING = false;
    private static final boolean FORCE_ENCODE_USING_EVAL = false;
    private static final String LOG_TAG = "JsMessageQueue";
    private static int MAX_PAYLOAD_SIZE = 0x1f400000;
    private BridgeMode activeBridgeMode;
    private final CordovaInterface cordova;
    private boolean paused;
    private final LinkedList queue = new LinkedList();
    private final BridgeMode registeredListeners[] = new BridgeMode[4];
    private final CordovaWebView webView;

    public NativeToJsMessageQueue(CordovaWebView cordovawebview, CordovaInterface cordovainterface)
    {
        cordova = cordovainterface;
        webView = cordovawebview;
        registeredListeners[0] = new PollingBridgeMode();
        registeredListeners[1] = new LoadUrlBridgeMode();
        registeredListeners[2] = new OnlineEventsBridgeMode();
        registeredListeners[3] = new PrivateApiBridgeMode();
        reset();
    }

    private int calculatePackedMessageLength(JsMessage jsmessage)
    {
        int i = jsmessage.calculateEncodedLength();
        return String.valueOf(i).length() + i + 1;
    }

    private void enqueueMessage(JsMessage jsmessage)
    {
        this;
        JVM INSTR monitorenter ;
        if (activeBridgeMode != null)
        {
            break MISSING_BLOCK_LABEL_20;
        }
        Log.d("JsMessageQueue", "Dropping Native->JS message due to disabled bridge");
        this;
        JVM INSTR monitorexit ;
        return;
        queue.add(jsmessage);
        if (!paused)
        {
            activeBridgeMode.onNativeToJsMessageAvailable();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        jsmessage;
        this;
        JVM INSTR monitorexit ;
        throw jsmessage;
    }

    private void packMessage(JsMessage jsmessage, StringBuilder stringbuilder)
    {
        stringbuilder.append(jsmessage.calculateEncodedLength()).append(' ');
        jsmessage.encodeAsMessage(stringbuilder);
    }

    private String popAndEncodeAsJs()
    {
        this;
        JVM INSTR monitorenter ;
        if (queue.size() != 0)
        {
            break MISSING_BLOCK_LABEL_16;
        }
        this;
        JVM INSTR monitorexit ;
        return null;
        int i;
        int j;
        i = 0;
        j = 0;
        Iterator iterator = queue.iterator();
_L12:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        int k = ((JsMessage)iterator.next()).calculateEncodedLength() + 50;
        if (j <= 0) goto _L4; else goto _L3
_L3:
        if (i + k <= MAX_PAYLOAD_SIZE || MAX_PAYLOAD_SIZE <= 0) goto _L4; else goto _L2
_L2:
        Object obj;
        JsMessage jsmessage;
        int l;
        if (j == queue.size())
        {
            k = 1;
        } else
        {
            k = 0;
        }
        if (k != 0)
        {
            l = 0;
        } else
        {
            l = 100;
        }
        obj = new StringBuilder(l + i);
        i = 0;
_L11:
        if (i >= j) goto _L6; else goto _L5
_L5:
        jsmessage = (JsMessage)queue.removeFirst();
        if (k == 0 || i + 1 != j) goto _L8; else goto _L7
_L7:
        jsmessage.encodeAsJsMessage(((StringBuilder) (obj)));
          goto _L9
_L8:
        ((StringBuilder) (obj)).append("try{");
        jsmessage.encodeAsJsMessage(((StringBuilder) (obj)));
        ((StringBuilder) (obj)).append("}finally{");
          goto _L9
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
_L6:
        if (k != 0)
        {
            break MISSING_BLOCK_LABEL_256;
        }
        ((StringBuilder) (obj)).append("window.setTimeout(function(){cordova.require('cordova/plugin/android/polling').pollOnce();},0);");
        break MISSING_BLOCK_LABEL_256;
_L10:
        if (i >= j)
        {
            break MISSING_BLOCK_LABEL_213;
        }
        ((StringBuilder) (obj)).append('}');
        i++;
          goto _L10
        obj = ((StringBuilder) (obj)).toString();
        this;
        JVM INSTR monitorexit ;
        return ((String) (obj));
_L9:
        i++;
          goto _L11
_L4:
        i += k;
        j++;
          goto _L12
        if (k != 0)
        {
            i = 1;
        } else
        {
            i = 0;
        }
          goto _L10
    }

    public void addJavaScript(String s)
    {
        enqueueMessage(new JsMessage(s));
    }

    public void addPluginResult(PluginResult pluginresult, String s)
    {
        if (s == null)
        {
            Log.e("JsMessageQueue", "Got plugin result with no callbackId", new Throwable());
        } else
        {
            boolean flag;
            boolean flag1;
            if (pluginresult.getStatus() == PluginResult.Status.NO_RESULT.ordinal())
            {
                flag = true;
            } else
            {
                flag = false;
            }
            flag1 = pluginresult.getKeepCallback();
            if (!flag || !flag1)
            {
                enqueueMessage(new JsMessage(pluginresult, s));
                return;
            }
        }
    }

    public boolean isBridgeEnabled()
    {
        return activeBridgeMode != null;
    }

    public String popAndEncode(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (activeBridgeMode != null)
        {
            break MISSING_BLOCK_LABEL_13;
        }
        this;
        JVM INSTR monitorexit ;
        return null;
        activeBridgeMode.notifyOfFlush(flag);
        if (!queue.isEmpty())
        {
            break MISSING_BLOCK_LABEL_40;
        }
        this;
        JVM INSTR monitorexit ;
        return null;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        int i;
        int j;
        j = 0;
        i = 0;
        Object obj = queue.iterator();
_L5:
        if (!((Iterator) (obj)).hasNext()) goto _L2; else goto _L1
_L1:
        int k = calculatePackedMessageLength((JsMessage)((Iterator) (obj)).next());
        if (i <= 0)
        {
            break MISSING_BLOCK_LABEL_167;
        }
        if (j + k <= MAX_PAYLOAD_SIZE || MAX_PAYLOAD_SIZE <= 0)
        {
            break MISSING_BLOCK_LABEL_167;
        }
_L2:
        obj = new StringBuilder(j);
        j = 0;
_L4:
        if (j >= i)
        {
            break; /* Loop/switch isn't completed */
        }
        packMessage((JsMessage)queue.removeFirst(), ((StringBuilder) (obj)));
        j++;
        if (true) goto _L4; else goto _L3
_L3:
        if (!queue.isEmpty())
        {
            ((StringBuilder) (obj)).append('*');
        }
        obj = ((StringBuilder) (obj)).toString();
        this;
        JVM INSTR monitorexit ;
        return ((String) (obj));
        j += k;
        i++;
          goto _L5
    }

    public void reset()
    {
        this;
        JVM INSTR monitorenter ;
        queue.clear();
        setBridgeMode(-1);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setBridgeMode(int i)
    {
        if (i >= -1 && i < registeredListeners.length) goto _L2; else goto _L1
_L1:
        Log.d("JsMessageQueue", (new StringBuilder()).append("Invalid NativeToJsBridgeMode: ").append(i).toString());
_L4:
        return;
_L2:
        Object obj;
        if (i < 0)
        {
            obj = null;
        } else
        {
            obj = registeredListeners[i];
        }
        if (obj == activeBridgeMode) goto _L4; else goto _L3
_L3:
        StringBuilder stringbuilder = (new StringBuilder()).append("Set native->JS mode to ");
        String s;
        if (obj == null)
        {
            s = "null";
        } else
        {
            s = obj.getClass().getSimpleName();
        }
        Log.d("JsMessageQueue", stringbuilder.append(s).toString());
        this;
        JVM INSTR monitorenter ;
        activeBridgeMode = ((BridgeMode) (obj));
        if (obj == null)
        {
            break MISSING_BLOCK_LABEL_126;
        }
        ((BridgeMode) (obj)).reset();
        if (!paused && !queue.isEmpty())
        {
            ((BridgeMode) (obj)).onNativeToJsMessageAvailable();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        obj;
        this;
        JVM INSTR monitorexit ;
        throw obj;
    }

    public void setPaused(boolean flag)
    {
        if (paused && flag)
        {
            Log.e("JsMessageQueue", "nested call to setPaused detected.", new Throwable());
        }
        paused = flag;
        if (flag)
        {
            break MISSING_BLOCK_LABEL_70;
        }
        this;
        JVM INSTR monitorenter ;
        if (!queue.isEmpty() && activeBridgeMode != null)
        {
            activeBridgeMode.onNativeToJsMessageAvailable();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }






    // Unreferenced inner class org/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode$1

/* anonymous class */
    class LoadUrlBridgeMode._cls1
        implements Runnable
    {

        final LoadUrlBridgeMode this$1;

        public void run()
        {
            String s = popAndEncodeAsJs();
            if (s != null)
            {
                webView.loadUrlNow((new StringBuilder()).append("javascript:").append(s).toString());
            }
        }

            
            {
                this$1 = LoadUrlBridgeMode.this;
                super();
            }
    }


    // Unreferenced inner class org/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1

/* anonymous class */
    class OnlineEventsBridgeMode._cls1
        implements Runnable
    {

        final OnlineEventsBridgeMode this$1;

        public void run()
        {
            if (!queue.isEmpty())
            {
                ignoreNextFlush = false;
                webView.setNetworkAvailable(online);
            }
        }

            
            {
                this$1 = OnlineEventsBridgeMode.this;
                super();
            }
    }


    // Unreferenced inner class org/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2

/* anonymous class */
    class OnlineEventsBridgeMode._cls2
        implements Runnable
    {

        final OnlineEventsBridgeMode this$1;

        public void run()
        {
            online = false;
            ignoreNextFlush = true;
            webView.setNetworkAvailable(true);
        }

            
            {
                this$1 = OnlineEventsBridgeMode.this;
                super();
            }
    }

}
