// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.pageparser;

import android.content.Context;
import android.content.res.AssetManager;
import com.isaacwaller.wikipedia.ProManager;
import com.isaacwaller.wikipedia.Utils;
import com.isaacwaller.wikipedia.newloader.Page;
import com.isaacwaller.wikipedia.newloader.Wiki;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.isaacwaller.wikipedia.pageparser:
//            AdPrinter

public class PagePrinter
{

    private static final Pattern HEADER_FINDER = Pattern.compile("<h2(.*)<span class=\"mw-headline\" [^>]*>(.+)</span></h2>");

    public PagePrinter()
    {
    }

    private static String addHeaderButtons(Context context, String s)
    {
        Matcher matcher = HEADER_FINDER.matcher(s);
        StringBuffer stringbuffer = new StringBuffer();
        int i = 0;
        String s1 = context.getString(0x7f0b0051);
        String s2 = context.getString(0x7f0b0052);
        do
        {
            if (!matcher.find())
            {
                matcher.appendTail(stringbuffer);
                return stringbuffer.toString();
            }
            String s3 = matcher.group(2);
            String s4;
            if (i > 0)
            {
                s4 = "</div>";
            } else
            {
                s4 = "";
            }
            matcher.appendReplacement(stringbuffer, (new StringBuilder(String.valueOf(s4))).append(generateHeaderCode(s1, s2, s3, i)).toString());
            i++;
        } while (true);
    }

    private static String generateHeaderCode(String s, String s1, String s2, int i)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append((new StringBuilder("<h2 class='section_heading' id='section_")).append(i).append("'>").toString());
        stringbuilder.append((new StringBuilder("<button class='section_toggle show' section_id='")).append(i).append("'>").append(s).append("</button>").toString());
        stringbuilder.append((new StringBuilder("<button class='section_toggle hide' section_id='")).append(i).append("'>").append(s1).append("</button>").toString());
        stringbuilder.append((new StringBuilder("<span>")).append(s2).append("</span></h2><div class='content_block' id='content_").append(i).append("'>").toString());
        return stringbuilder.toString();
    }

    public static String pageToHtml(Context context, Page page)
        throws IOException
    {
        String s = Utils.slurp(context.getAssets().open("wikipagetemplate.html")).replace("PAGE_HTML_GOES_HERE", page.getText()).replace("PAGE_TITLE_GOES_HERE", page.getDisplayTitle()).replace("PAGE_RIGHTS_GOES_HERE", page.getWiki().getRights());
        String s1;
        if (ProManager.isPro(context))
        {
            s1 = "";
        } else
        {
            s1 = AdPrinter.generateAd();
        }
        return addHeaderButtons(context, s.replace("AD_GOES_HERE", s1).replace("INITIAL_SCALE", "1"));
    }

}
