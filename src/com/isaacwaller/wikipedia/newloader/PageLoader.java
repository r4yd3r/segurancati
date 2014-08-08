// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.newloader;

import android.net.Uri;
import com.isaacwaller.wikipedia.Utils;
import java.io.IOException;
import java.io.PrintStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia.newloader:
//            Wiki, Page

public class PageLoader
{

    public PageLoader()
    {
    }

    public static final Page loadPage(String s, Wiki wiki)
        throws JSONException, MalformedURLException, IOException
    {
        String s1 = wiki.getUrlOfAPIPage().buildUpon().appendQueryParameter("format", "json").appendQueryParameter("page", s).appendQueryParameter("action", "parse").appendQueryParameter("redirects", "true").toString();
        long l = System.currentTimeMillis();
        URL url = new URL(s1);
        java.io.InputStream inputstream = url.openStream();
        long l1 = System.currentTimeMillis();
        String s2 = Utils.slurp(inputstream);
        long l2 = System.currentTimeMillis();
        JSONTokener jsontokener = new JSONTokener(s2);
        JSONObject jsonobject = new JSONObject(jsontokener);
        long l3 = System.currentTimeMillis();
        System.out.println((new StringBuilder("Open stream: ")).append(l1 - l).toString());
        System.out.println((new StringBuilder("Slurp: ")).append(l2 - l1).toString());
        System.out.println((new StringBuilder("Parse: ")).append(l3 - l2).toString());
        JSONObject jsonobject1 = jsonobject.getJSONObject("parse");
        Page page = new Page();
        page.text = jsonobject1.getJSONObject("text").getString("*");
        page.displayTitle = jsonobject1.getString("displaytitle");
        page.wiki = wiki;
        JSONArray jsonarray = jsonobject1.getJSONArray("langlinks");
        page.langlinks = new HashMap();
        int i = 0;
        do
        {
            if (i >= jsonarray.length())
            {
                return page;
            }
            JSONObject jsonobject2 = jsonarray.getJSONObject(i);
            page.langlinks.put(jsonobject2.getString("lang"), jsonobject2.getString("*"));
            i++;
        } while (true);
    }
}
