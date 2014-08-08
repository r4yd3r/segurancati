// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.pageparser;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import com.isaacwaller.wikipedia.ProManager;
import com.isaacwaller.wikipedia.Utils;
import com.isaacwaller.wikipedia.newloader.Wiki;
import java.io.IOException;
import java.io.PrintStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia.pageparser:
//            AdPrinter

public class HomePagePrinter
{

    private static final Map dailyFeatureTemplates = new HashMap() {

            
            {
                put("en", "Wikipedia:Today's featured article/{{#time:F j, Y}}");
                put("de", "Wikipedia:Hauptseite/Artikel des Tages/{{LOCALDAYNAME}}");
                put("it", "Pagina principale/2011/Vetrina");
                put("fr", "Lumi\350re sur/Aujourd'hui");
                put("ja", "\u79C0\u9038\u30D4\u30C3\u30AF\u30A2\u30C3\u30D7");
            }
    };
    private static final Map didYouKnowTemplates = new HashMap() {

            
            {
                put("en", "Did you know");
                put("de", "Wikipedia:Hauptseite/Schon gewusst/{{LOCALDAYNAME}}");
                put("it", "Pagina principale/Sapevi/{{LOCALDAY}}");
                put("fr", "Wikip\351dia:Le saviez-vous ?");
            }
    };
    private static final Map inTheNewsTemplates = new HashMap() {

            
            {
                put("en", "In the news");
                put("de", "Wikipedia:Hauptseite/Aktuelles");
                put("it", "Pagina principale/Notizie");
                put("fr", "Accueil actualit\351");
            }
    };

    public HomePagePrinter()
    {
    }

    private static String generate(Context context, Wiki wiki, Map map)
        throws JSONException, IOException
    {
        if (map.containsKey(wiki.getLanguagePart()))
        {
            System.out.println((new StringBuilder("Language part: ")).append(wiki.getLanguagePart()).toString());
            return parseWithWiki(wiki, (new StringBuilder("{{")).append((String)map.get(wiki.getLanguagePart())).append("}}").toString());
        } else
        {
            System.out.println((new StringBuilder("Language part: ")).append(wiki.getLanguagePart()).toString());
            return notAvailableOnThisWiki(context);
        }
    }

    public static final String makeHomePage(Wiki wiki, Context context)
        throws IOException, JSONException
    {
        String s = Utils.slurp(context.getAssets().open("homepagetemplate.html")).replace("DAILY_FEATURE_GOES_HERE", generate(context, wiki, dailyFeatureTemplates)).replace("IN_THE_NEWS_GOES_HERE", generate(context, wiki, inTheNewsTemplates)).replace("DID_YOU_KNOW_GOES_HERE", generate(context, wiki, didYouKnowTemplates));
        String s1;
        String s2;
        String s3;
        if (ProManager.isPro(context))
        {
            s1 = "1.0";
        } else
        {
            s1 = "0.4";
        }
        s2 = s.replace("SAVED_PAGES_ICON_OPACITY", s1);
        if (ProManager.isPro(context))
        {
            s3 = "";
        } else
        {
            s3 = AdPrinter.generateAd();
        }
        return s2.replace("AD_GOES_HERE", s3).replace("INITIAL_SCALE", "1");
    }

    private static String notAvailableOnThisWiki(Context context)
    {
        return context.getString(0x7f0b0057);
    }

    private static String parseWithWiki(Wiki wiki, String s)
        throws JSONException, IOException
    {
        return (new JSONObject(new JSONTokener(Utils.slurp((new URL((new StringBuilder()).append(wiki.getUrlOfAPIPage()).append("?action=parse&text=").append(Uri.encode(s)).append("&format=json").toString())).openStream())))).getJSONObject("parse").getJSONObject("text").getString("*");
    }

}
