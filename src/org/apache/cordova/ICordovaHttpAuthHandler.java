// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.cordova;


public interface ICordovaHttpAuthHandler
{

    public abstract void cancel();

    public abstract void proceed(String s, String s1);
}
