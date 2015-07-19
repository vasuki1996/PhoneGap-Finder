// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;

import android.webkit.ClientCertRequest;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;

// Referenced classes of package org.apache.cordova:
//            ICordovaClientCertRequest

public class CordovaClientCertRequest
    implements ICordovaClientCertRequest
{

    private final ClientCertRequest request;

    public CordovaClientCertRequest(ClientCertRequest clientcertrequest)
    {
        request = clientcertrequest;
    }

    public void cancel()
    {
        request.cancel();
    }

    public String getHost()
    {
        return request.getHost();
    }

    public String[] getKeyTypes()
    {
        return request.getKeyTypes();
    }

    public int getPort()
    {
        return request.getPort();
    }

    public Principal[] getPrincipals()
    {
        return request.getPrincipals();
    }

    public void ignore()
    {
        request.ignore();
    }

    public void proceed(PrivateKey privatekey, X509Certificate ax509certificate[])
    {
        request.proceed(privatekey, ax509certificate);
    }
}
