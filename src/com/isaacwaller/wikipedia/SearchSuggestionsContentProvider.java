// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import com.isaacwaller.wikipedia.newloader.Wiki;
import com.isaacwaller.wikipedia.newloader.WikiManager;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia:
//            Utils

public class SearchSuggestionsContentProvider extends ContentProvider
{

    public static final String AUTHORITY = "com.isaacwaller.wikipedia.search";
    public static final String CONTENT_TYPE = "vnd.android.cursor.dir/com.isaacwaller.wikipedia.search.results";
    public static final Uri CONTENT_URI = Uri.parse("content://com.isaacwaller.wikipedia.search");

    public SearchSuggestionsContentProvider()
    {
    }

    public static List getSuggestionsForQuery(Wiki wiki, String s)
        throws JSONException, IOException
    {
        JSONArray jsonarray = (new JSONArray(new JSONTokener(Utils.slurp((new URL((new StringBuilder(String.valueOf(wiki.getUrlOfAPIPage().toString()))).append("?action=opensearch&search=").append(URLEncoder.encode(s)).toString())).openStream())))).getJSONArray(1);
        ArrayList arraylist = new ArrayList();
        int i = 0;
        do
        {
            if (i >= jsonarray.length())
            {
                return arraylist;
            }
            arraylist.add(jsonarray.getString(i));
            i++;
        } while (true);
    }

    public int delete(Uri uri, String s, String as[])
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Search Provider");
    }

    public String getType(Uri uri)
    {
        List list = uri.getPathSegments();
        if (((String)list.get(0)).equals("search_suggest_query") && list.size() == 2)
        {
            return "vnd.android.cursor.dir/com.isaacwaller.wikipedia.search.results";
        } else
        {
            return null;
        }
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Search Provider");
    }

    public boolean onCreate()
    {
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        List list = uri.getPathSegments();
        Object obj;
        if (!((String)list.get(0)).equals("search_suggest_query") || list.size() != 2)
        {
            obj = null;
        } else
        {
            String s2 = (String)list.get(1);
            Wiki wiki = WikiManager.getCurrentWiki(getContext());
            List list1;
            int i;
            try
            {
                list1 = getSuggestionsForQuery(wiki, s2);
            }
            catch (Exception exception)
            {
                throw new RuntimeException(exception);
            }
            obj = new MatrixCursor(new String[] {
                "_id", "suggest_text_1", "suggest_intent_data"
            });
            i = 0;
            while (i < list1.size()) 
            {
                String s3 = (String)list1.get(i);
                Object aobj[] = new Object[3];
                aobj[0] = Integer.valueOf(i);
                aobj[1] = s3;
                aobj[2] = (new StringBuilder(String.valueOf(wiki.getServer()))).append("/wiki/").append(Uri.encode(s3)).toString();
                ((MatrixCursor) (obj)).addRow(aobj);
                i++;
            }
        }
        return ((Cursor) (obj));
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Search Provider");
    }

}
