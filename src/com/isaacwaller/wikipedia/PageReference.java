// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.net.Uri;
import com.isaacwaller.wikipedia.newloader.Page;
import com.isaacwaller.wikipedia.newloader.PageLoader;
import com.isaacwaller.wikipedia.newloader.Wiki;
import com.isaacwaller.wikipedia.newloader.WikiManager;
import com.isaacwaller.wikipedia.pageparser.HomePagePrinter;
import com.isaacwaller.wikipedia.pageparser.PagePrinter;
import com.isaacwaller.wikipedia.pageparser.SearchResultsPrinter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Map;
import org.json.JSONException;

// Referenced classes of package com.isaacwaller.wikipedia:
//            Utils

public class PageReference
    implements Serializable
{
    public static class LoadResult
        implements Serializable
    {

        private static final long serialVersionUID = 1L;
        public String html;
        public Map langlinks;

        private LoadResult()
        {
        }

        LoadResult(LoadResult loadresult)
        {
            this();
        }
    }

    public static final class PageType extends Enum
    {

        private static final PageType ENUM$VALUES[];
        public static final PageType HOME_PAGE;
        public static final PageType OFFLINE_PAGE;
        public static final PageType SEARCH_RESULTS;
        public static final PageType WIKI_PAGE;

        public static PageType valueOf(String s)
        {
            return (PageType)Enum.valueOf(com/isaacwaller/wikipedia/PageReference$PageType, s);
        }

        public static PageType[] values()
        {
            PageType apagetype[] = ENUM$VALUES;
            int i = apagetype.length;
            PageType apagetype1[] = new PageType[i];
            System.arraycopy(apagetype, 0, apagetype1, 0, i);
            return apagetype1;
        }

        static 
        {
            HOME_PAGE = new PageType("HOME_PAGE", 0);
            SEARCH_RESULTS = new PageType("SEARCH_RESULTS", 1);
            WIKI_PAGE = new PageType("WIKI_PAGE", 2);
            OFFLINE_PAGE = new PageType("OFFLINE_PAGE", 3);
            PageType apagetype[] = new PageType[4];
            apagetype[0] = HOME_PAGE;
            apagetype[1] = SEARCH_RESULTS;
            apagetype[2] = WIKI_PAGE;
            apagetype[3] = OFFLINE_PAGE;
            ENUM$VALUES = apagetype;
        }

        private PageType(String s, int i)
        {
            super(s, i);
        }
    }


    private static int $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType[];
    String mData;
    PageType mType;
    Wiki mWiki;

    static int[] $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()
    {
        int ai[] = $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType;
        if (ai != null)
        {
            return ai;
        }
        int ai1[] = new int[PageType.values().length];
        try
        {
            ai1[PageType.HOME_PAGE.ordinal()] = 1;
        }
        catch (NoSuchFieldError nosuchfielderror) { }
        try
        {
            ai1[PageType.OFFLINE_PAGE.ordinal()] = 4;
        }
        catch (NoSuchFieldError nosuchfielderror1) { }
        try
        {
            ai1[PageType.SEARCH_RESULTS.ordinal()] = 2;
        }
        catch (NoSuchFieldError nosuchfielderror2) { }
        try
        {
            ai1[PageType.WIKI_PAGE.ordinal()] = 3;
        }
        catch (NoSuchFieldError nosuchfielderror3) { }
        $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType = ai1;
        return ai1;
    }

    public PageReference(PageType pagetype, Wiki wiki, String s)
    {
        mType = pagetype;
        mWiki = wiki;
        mData = s;
    }

    public static final PageReference fromUrl(Context context, Uri uri)
    {
        if ("file".equals(uri.getScheme()))
        {
            return new PageReference(PageType.OFFLINE_PAGE, null, uri.toString());
        }
        List list = uri.getPathSegments();
        Wiki wiki = WikiManager.createWikipedia(uri.getAuthority().split("\\.")[0]);
        if (list.size() == 0)
        {
            return new PageReference(PageType.HOME_PAGE, wiki, null);
        } else
        {
            String s = (String)list.get(-1 + list.size());
            return new PageReference(PageType.WIKI_PAGE, wiki, s);
        }
    }

    public static final PageReference fromUrl(Context context, String s)
    {
        return fromUrl(context, Uri.parse(s));
    }

    public String getData()
    {
        return mData;
    }

    public PageType getType()
    {
        return mType;
    }

    public Wiki getWiki()
    {
        return mWiki;
    }

    public LoadResult loadPage(Context context)
        throws MalformedURLException, IOException, JSONException
    {
        LoadResult loadresult = new LoadResult(null);
        switch ($SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()[mType.ordinal()])
        {
        default:
            return loadresult;

        case 1: // '\001'
            loadresult.html = HomePagePrinter.makeHomePage(mWiki, context);
            return loadresult;

        case 2: // '\002'
            loadresult.html = SearchResultsPrinter.doFullTextSearch(context, mData, mWiki);
            return loadresult;

        case 3: // '\003'
            Page page = PageLoader.loadPage(mData, mWiki);
            loadresult.html = PagePrinter.pageToHtml(context, page);
            loadresult.langlinks = page.getLanglinks();
            return loadresult;

        case 4: // '\004'
            loadresult.html = Utils.slurp(new FileInputStream(new File(Uri.parse(mData).getPath())));
            break;
        }
        return loadresult;
    }

    public String toString()
    {
        return (new StringBuilder(String.valueOf(getClass().getName()))).append(":").append(mWiki).append("/").append(mType).append("/").append(mData).toString();
    }

    public String toUrl()
    {
        switch ($SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()[mType.ordinal()])
        {
        case 2: // '\002'
        default:
            return null;

        case 3: // '\003'
            return Uri.parse(mWiki.getServer()).buildUpon().path("wiki").appendPath(mData).toString();

        case 1: // '\001'
            return mWiki.getServer();
        }
    }
}
