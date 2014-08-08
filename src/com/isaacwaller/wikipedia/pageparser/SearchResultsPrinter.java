// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.pageparser;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import com.isaacwaller.wikipedia.Utils;
import com.isaacwaller.wikipedia.newloader.Wiki;
import java.io.IOException;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class SearchResultsPrinter
{

    public SearchResultsPrinter()
    {
    }

    public static String doFullTextSearch(Context context, String s, Wiki wiki)
        throws IOException, JSONException
    {
        JSONArray jsonarray = (new JSONObject(new JSONTokener(Utils.slurp((new URL((new StringBuilder()).append(wiki.getUrlOfAPIPage()).append("?action=query&list=search&srsearch=").append(Uri.encode(s)).append("&format=json").toString())).openStream())))).getJSONObject("query").getJSONArray("search");
        StringBuilder stringbuilder = new StringBuilder();
        int i = 0;
        do
        {
            if (i >= jsonarray.length())
            {
                return Utils.slurp(context.getAssets().open("searchresultstemplate.html")).replace("QUERY_GOES_HERE", s).replace("SEARCH_RESULTS_GO_HERE", stringbuilder.toString());
            }
            JSONObject jsonobject = jsonarray.getJSONObject(i);
            String s1 = jsonobject.getString("title");
            stringbuilder.append("<a href='/wiki/");
            stringbuilder.append(Uri.encode(s1));
            stringbuilder.append("' class='searchresult'><div>");
            stringbuilder.append((new StringBuilder("<h2>")).append(s1).append("</h2>").toString());
            stringbuilder.append(jsonobject.getString("snippet"));
            stringbuilder.append("</div></a>");
            i++;
        } while (true);
    }
}
