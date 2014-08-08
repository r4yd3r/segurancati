// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.preference.PreferenceManager;

public class ProManager
{

    protected static final String KEY_PRO_ACTIVATED = "com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated";
    public static final String TAG = "ProManager";

    public ProManager()
    {
    }

    public static boolean isPro(Context context)
    {
        boolean flag;
        try
        {
            PackageManager packagemanager = context.getPackageManager();
            PackageInfo packageinfo = packagemanager.getPackageInfo("com.isaacwaller.wikipedia.plus", 64);
            PackageInfo packageinfo1 = packagemanager.getPackageInfo("com.isaacwaller.wikipedia", 64);
            flag = packageinfo.signatures[0].toCharsString().equals(packageinfo1.signatures[0].toCharsString());
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return PreferenceManager.getDefaultSharedPreferences(context).getBoolean("com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated", false);
        }
        return flag;
    }
}
