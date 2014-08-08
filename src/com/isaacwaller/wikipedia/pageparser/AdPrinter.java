// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.pageparser;

import java.util.Locale;
import java.util.Random;

public class AdPrinter
{

    private static String LINES[][] = {
        {
            "Take control of your Android device", "Control almost any function of your device,", "directly from the home screen."
        }, {
            "Remove ads with Wikidroid Plus", "Purchase Wikidroid Plus to remove ads", "and support the developers!"
        }, {
            "Takeoff", "Take to the skies with Takeoff,", "an arcade flight game for Android."
        }
    };
    private static String PACKAGES[] = {
        "com.siriusapplications.eclairwidgets", "com.isaacwaller.wikipedia.plus", "com.siriusapplications.takeoff.release"
    };
    private static Random RANDOM = new Random();

    public AdPrinter()
    {
    }

    public static String generateAd()
    {
        int i = RANDOM.nextInt(PACKAGES.length);
        String s = PACKAGES[i];
        String as[] = LINES[i];
        Locale locale = Locale.US;
        Object aobj[] = new Object[5];
        aobj[0] = Integer.valueOf(i + 1);
        aobj[1] = s;
        aobj[2] = as[0];
        aobj[3] = as[1];
        aobj[4] = as[2];
        return String.format(locale, "<a href='http://play.google.com/store/apps/details?id=%2$s' id='wikidroid-anchor'><div id='wikidroid-ad' class='wikidroid-ad-%1$d'><div id='wikidroid-ad-inner' class='wikidroid-ad-inner-%1$d'><span id='wikidroid-ad-text1'>%3$s</span><br /><span id='wikidroid-ad-text2'>%4$s<br />%5$s</span></div></div></a>", aobj);
    }

}
