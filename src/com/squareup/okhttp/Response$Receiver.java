// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.squareup.okhttp;

import java.io.IOException;

// Referenced classes of package com.squareup.okhttp:
//            Response, Failure

public static interface 
{

    public abstract void onFailure(Failure failure);

    public abstract boolean onResponse(Response response)
        throws IOException;
}
