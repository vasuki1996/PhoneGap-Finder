// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Handler;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import org.json.JSONArray;
import org.json.JSONException;

// Referenced classes of package org.apache.cordova:
//            CordovaPlugin, CordovaWebView, CordovaPreferences, CordovaInterface, 
//            CallbackContext

public class SplashScreenInternal extends CordovaPlugin
{

    private static final String LOG_TAG = "SplashScreenInternal";
    private static boolean firstShow = true;
    private static ProgressDialog spinnerDialog;
    private static Dialog splashDialog;

    public SplashScreenInternal()
    {
    }

    private void loadSpinner()
    {
        String s;
        if (webView.canGoBack())
        {
            s = preferences.getString("LoadingDialog", null);
        } else
        {
            s = preferences.getString("LoadingPageDialog", null);
        }
        if (s != null)
        {
            String s2 = "";
            String s1 = "Loading Application...";
            if (s.length() > 0)
            {
                int i = s.indexOf(',');
                if (i > 0)
                {
                    s2 = s.substring(0, i);
                    s1 = s.substring(i + 1);
                } else
                {
                    s2 = "";
                    s1 = s;
                }
            }
            spinnerStart(s2, s1);
        }
    }

    private void removeSplashScreen()
    {
        cordova.getActivity().runOnUiThread(new Runnable() {

            final SplashScreenInternal this$0;

            public void run()
            {
                if (SplashScreenInternal.splashDialog != null && SplashScreenInternal.splashDialog.isShowing())
                {
                    SplashScreenInternal.splashDialog.dismiss();
                    SplashScreenInternal.splashDialog = null;
                }
            }

            
            {
                this$0 = SplashScreenInternal.this;
                super();
            }
        });
    }

    private void showSplashScreen(final boolean hideAfterDelay)
    {
        final int splashscreenTime = preferences.getInteger("SplashScreenDelay", 3000);
        final int drawableId;
        for (drawableId = preferences.getInteger("SplashDrawableId", 0); splashDialog != null && splashDialog.isShowing() || drawableId == 0 || splashscreenTime <= 0 && hideAfterDelay;)
        {
            return;
        }

        cordova.getActivity().runOnUiThread(new Runnable() {

            final SplashScreenInternal this$0;
            final int val$drawableId;
            final boolean val$hideAfterDelay;
            final int val$splashscreenTime;

            public void run()
            {
                Display display = cordova.getActivity().getWindowManager().getDefaultDisplay();
                android.content.Context context = webView.getContext();
                LinearLayout linearlayout = new LinearLayout(context);
                linearlayout.setMinimumHeight(display.getHeight());
                linearlayout.setMinimumWidth(display.getWidth());
                linearlayout.setOrientation(1);
                linearlayout.setBackgroundColor(preferences.getInteger("backgroundColor", 0xff000000));
                linearlayout.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1, 0.0F));
                linearlayout.setBackgroundResource(drawableId);
                SplashScreenInternal.splashDialog = new Dialog(context, 0x1030010);
                if ((cordova.getActivity().getWindow().getAttributes().flags & 0x400) == 1024)
                {
                    SplashScreenInternal.splashDialog.getWindow().setFlags(1024, 1024);
                }
                SplashScreenInternal.splashDialog.setContentView(linearlayout);
                SplashScreenInternal.splashDialog.setCancelable(false);
                SplashScreenInternal.splashDialog.show();
                if (hideAfterDelay)
                {
                    (new Handler()).postDelayed(new Runnable() {

                        final _cls5 this$1;

                        public void run()
                        {
                            removeSplashScreen();
                        }

            
            {
                this$1 = _cls5.this;
                super();
            }
                    }, splashscreenTime);
                }
            }

            
            {
                this$0 = SplashScreenInternal.this;
                drawableId = i;
                hideAfterDelay = flag;
                splashscreenTime = j;
                super();
            }
        });
    }

    private void spinnerStart(final String title, final String message)
    {
        cordova.getActivity().runOnUiThread(new Runnable() {

            final SplashScreenInternal this$0;
            final String val$message;
            final String val$title;

            public void run()
            {
                spinnerStop();
                SplashScreenInternal.spinnerDialog = ProgressDialog.show(webView.getContext(), title, message, true, true, new android.content.DialogInterface.OnCancelListener() {

                    final _cls6 this$1;

                    public void onCancel(DialogInterface dialoginterface)
                    {
                        SplashScreenInternal.spinnerDialog = null;
                    }

            
            {
                this$1 = _cls6.this;
                super();
            }
                });
            }

            
            {
                this$0 = SplashScreenInternal.this;
                title = s;
                message = s1;
                super();
            }
        });
    }

    private void spinnerStop()
    {
        cordova.getActivity().runOnUiThread(new Runnable() {

            final SplashScreenInternal this$0;

            public void run()
            {
                if (SplashScreenInternal.spinnerDialog != null && SplashScreenInternal.spinnerDialog.isShowing())
                {
                    SplashScreenInternal.spinnerDialog.dismiss();
                    SplashScreenInternal.spinnerDialog = null;
                }
            }

            
            {
                this$0 = SplashScreenInternal.this;
                super();
            }
        });
    }

    public boolean execute(final String title, final JSONArray message, CallbackContext callbackcontext)
        throws JSONException
    {
        boolean flag = false;
        if (title.equals("hide"))
        {
            cordova.getActivity().runOnUiThread(new Runnable() {

                final SplashScreenInternal this$0;

                public void run()
                {
                    webView.postMessage("splashscreen", "hide");
                }

            
            {
                this$0 = SplashScreenInternal.this;
                super();
            }
            });
        } else
        {
            if (!title.equals("show"))
            {
                continue;
            }
            cordova.getActivity().runOnUiThread(new Runnable() {

                final SplashScreenInternal this$0;

                public void run()
                {
                    webView.postMessage("splashscreen", "show");
                }

            
            {
                this$0 = SplashScreenInternal.this;
                super();
            }
            });
        }
        do
        {
            callbackcontext.success();
            flag = true;
            do
            {
                return flag;
            } while (!title.equals("spinnerStart"));
            title = message.getString(0);
            message = message.getString(1);
            cordova.getActivity().runOnUiThread(new Runnable() {

                final SplashScreenInternal this$0;
                final String val$message;
                final String val$title;

                public void run()
                {
                    spinnerStart(title, message);
                }

            
            {
                this$0 = SplashScreenInternal.this;
                title = s;
                message = s1;
                super();
            }
            });
        } while (true);
    }

    public void onDestroy()
    {
        removeSplashScreen();
        firstShow = true;
    }

    public Object onMessage(String s, Object obj)
    {
        if (!"splashscreen".equals(s)) goto _L2; else goto _L1
_L1:
        if ("hide".equals(obj.toString()))
        {
            removeSplashScreen();
        } else
        {
            showSplashScreen(false);
        }
_L4:
        return null;
_L2:
        if ("spinner".equals(s))
        {
            if ("stop".equals(obj.toString()))
            {
                spinnerStop();
                webView.setVisibility(0);
            }
        } else
        if ("onReceivedError".equals(s))
        {
            spinnerStop();
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void onPause(boolean flag)
    {
        removeSplashScreen();
    }

    protected void pluginInitialize()
    {
        if (!firstShow)
        {
            return;
        }
        webView.setVisibility(4);
        if (preferences.getInteger("SplashDrawableId", 0) == 0)
        {
            String s = preferences.getString("SplashScreen", null);
            if (s != null)
            {
                int j = cordova.getActivity().getResources().getIdentifier(s, "drawable", cordova.getActivity().getClass().getPackage().getName());
                int i = j;
                if (j == 0)
                {
                    i = cordova.getActivity().getResources().getIdentifier(s, "drawable", cordova.getActivity().getPackageName());
                }
                preferences.set("SplashDrawableId", i);
            }
        }
        firstShow = false;
        loadSpinner();
        showSplashScreen(true);
    }





/*
    static Dialog access$102(Dialog dialog)
    {
        splashDialog = dialog;
        return dialog;
    }

*/





/*
    static ProgressDialog access$402(ProgressDialog progressdialog)
    {
        spinnerDialog = progressdialog;
        return progressdialog;
    }

*/
}
