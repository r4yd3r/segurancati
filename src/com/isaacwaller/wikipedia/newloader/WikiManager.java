// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.newloader;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.isaacwaller.wikipedia.ApplicationManager;
import com.isaacwaller.wikipedia.Utils;
import java.io.IOException;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia.newloader:
//            Wiki

public class WikiManager
{

    private static int $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application[];
    public static final String KEY_LANGUAGE = "com.isaacwaller.wikipedia.Language";
    public static final String KEY_LANGUAGE_ALT = "language2";

    static int[] $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application()
    {
        int ai[] = $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application;
        if (ai != null)
        {
            return ai;
        }
        int ai1[] = new int[com.isaacwaller.wikipedia.ApplicationManager.Application.values().length];
        try
        {
            ai1[com.isaacwaller.wikipedia.ApplicationManager.Application.MINECRAFT_WIKI.ordinal()] = 1;
        }
        catch (NoSuchFieldError nosuchfielderror) { }
        try
        {
            ai1[com.isaacwaller.wikipedia.ApplicationManager.Application.WIKIDROID.ordinal()] = 2;
        }
        catch (NoSuchFieldError nosuchfielderror1) { }
        $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application = ai1;
        return ai1;
    }

    public WikiManager()
    {
    }

    public static Wiki createMinecraftWiki()
    {
        return new Wiki(true);
    }

    public static Wiki createWikipedia(String s)
    {
        return new Wiki(s);
    }

    public static Wiki getCurrentWiki(Context context)
    {
        switch ($SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application()[ApplicationManager.getApplication(context).ordinal()])
        {
        default:
            throw new IllegalArgumentException("Bad application");

        case 2: // '\002'
            return createWikipedia(PreferenceManager.getDefaultSharedPreferences(context).getString("com.isaacwaller.wikipedia.Language", "en"));

        case 1: // '\001'
            return createMinecraftWiki();
        }
    }

    public static String queryWikiForRandomPage(Wiki wiki)
        throws IOException, JSONException
    {
        return (new JSONObject(new JSONTokener(Utils.slurp((new URL((new StringBuilder()).append(wiki.getUrlOfAPIPage()).append("?action=query&list=random&rnnamespace=0&rnlimit=1&format=json").toString())).openStream())))).getJSONObject("query").getJSONArray("random").getJSONObject(0).getString("title");
    }
}
