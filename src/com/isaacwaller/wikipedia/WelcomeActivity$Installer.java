// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;


// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity

public static final class _cls9 extends Enum
{

    public static final ENUM.VALUES AMAZON_APPSTORE;
    public static final ENUM.VALUES ANDROID_MARKET;
    public static final ENUM.VALUES DEVICE_BUNDLING_NO_MARKET;
    private static final ENUM.VALUES ENUM$VALUES[];

    public static final _cls9 getInstaller()
    {
        return ANDROID_MARKET;
    }

    public static ANDROID_MARKET valueOf(String s)
    {
        return (ANDROID_MARKET)Enum.valueOf(com/isaacwaller/wikipedia/WelcomeActivity$Installer, s);
    }

    public static ANDROID_MARKET[] values()
    {
        ANDROID_MARKET aandroid_market[] = ENUM$VALUES;
        int i = aandroid_market.length;
        ANDROID_MARKET aandroid_market1[] = new ENUM.VALUES[i];
        System.arraycopy(aandroid_market, 0, aandroid_market1, 0, i);
        return aandroid_market1;
    }

    static 
    {
        ANDROID_MARKET = new <init>("ANDROID_MARKET", 0);
        AMAZON_APPSTORE = new <init>("AMAZON_APPSTORE", 1);
        DEVICE_BUNDLING_NO_MARKET = new <init>("DEVICE_BUNDLING_NO_MARKET", 2);
        ENUM.VALUES avalues[] = new <init>[3];
        avalues[0] = ANDROID_MARKET;
        avalues[1] = AMAZON_APPSTORE;
        avalues[2] = DEVICE_BUNDLING_NO_MARKET;
        ENUM$VALUES = avalues;
    }

    private _cls9(String s, int i)
    {
        super(s, i);
    }
}
