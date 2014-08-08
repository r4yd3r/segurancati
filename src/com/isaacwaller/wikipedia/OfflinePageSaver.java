// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.text.Html;
import android.text.Spanned;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.commons.lang3.StringEscapeUtils;
import org.json.JSONException;
import org.xml.sax.SAXException;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PageReference

public class OfflinePageSaver
{
    public static class BadPageTypeException extends IllegalArgumentException
    {

        private static final long serialVersionUID = 1L;

        BadPageTypeException()
        {
        }
    }

    public static class OfflinePage
    {

        File file;
        String title;
        Uri uri;

        public OfflinePage()
        {
        }
    }

    public static class PageAlreadyExistsException extends Exception
    {

        private static final long serialVersionUID = 1L;

        PageAlreadyExistsException()
        {
        }
    }


    private static final String ABSOLUTE_REPLACEMENT_END = "/_res/$2\"$3";
    private static final String ABSOLUTE_URL_PATTERN = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']http://(.*?)[\\\"\\'](.*?>)";
    private static final String DOUBLERELATIVE_REPLACEMENT_END = "/_res/$2\"$3";
    private static final String DOUBLERELATIVE_URL_PATTERN = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']//(.*?)[\\\"\\'](.*?>)";
    private static final String RELATIVE_REPLACEMENT_END = "/_res/en.m.wikipedia.org/$2\"$3";
    private static final String RELATIVE_URL_PATTERN = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']/[^/](.*?)[\\\"\\'](.*?>)";
    private static final String REPLACEMENT_START = "$1=\"content://com.isaacwaller.wikidroid.offlinepages/";
    public static final String SAVE_DIR = (new StringBuilder(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()))).append("/Wikidroid Saved Pages/").toString();

    public OfflinePageSaver()
    {
    }

    private static void delete(File file)
    {
        if (!file.isDirectory()) goto _L2; else goto _L1
_L1:
        String as[];
        int i;
        int j;
        as = file.list();
        i = as.length;
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        file.delete();
        return;
_L3:
        delete(new File(file, as[j]));
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public static void deletePage(File file)
    {
        delete(new File((new StringBuilder(String.valueOf(file.getAbsolutePath()))).append("/_res").toString()));
        delete(new File((new StringBuilder(String.valueOf(file.getAbsolutePath()))).append("/page.html").toString()));
    }

    private static List findResourcesToSave(String s, String s1, boolean flag)
    {
        Matcher matcher;
        ArrayList arraylist;
        matcher = Pattern.compile(s1).matcher(s);
        arraylist = new ArrayList();
_L2:
        String s2;
        String s3;
        if (!matcher.find())
        {
            return arraylist;
        }
        s2 = matcher.group(2);
        if (!flag)
        {
            break; /* Loop/switch isn't completed */
        }
        s3 = (new StringBuilder("http://")).append(s2).toString();
_L3:
        arraylist.add(s3);
        if (true) goto _L2; else goto _L1
_L1:
        if (s2.startsWith("/"))
        {
            s3 = (new StringBuilder("http:/")).append(s2).toString();
        } else
        {
            s3 = (new StringBuilder("http://en.m.wikipedia.org/")).append(s2).toString();
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    private static String getFilePath(String s, Uri uri)
    {
        return Uri.decode((new StringBuilder(String.valueOf(s))).append("/_res/").append(uri.getAuthority()).append("/").append(uri.getPath()).toString());
    }

    private static String getPagePath(Uri uri)
    {
        return Uri.decode((new StringBuilder(String.valueOf(SAVE_DIR))).append("/").append(uri.getAuthority()).append("/").append(uri.getPath()).toString());
    }

    public static List getSavedPages()
        throws FileNotFoundException
    {
        ArrayList arraylist = new ArrayList();
        File file = new File(SAVE_DIR);
        file.mkdirs();
        searchDir(file, arraylist);
        return arraylist;
    }

    private static void saveFile(File file, Uri uri)
        throws MalformedURLException, ParserConfigurationException, FactoryConfigurationError, SAXException, IOException
    {
        File file1 = new File(getFilePath(file.getAbsolutePath(), uri));
        InputStream inputstream = (new URL(uri.toString())).openStream();
        file1.mkdirs();
        File file2 = new File((new StringBuilder()).append(file1.getAbsoluteFile()).append("/file").toString());
        Log.i("OfflinePageSaver", (new StringBuilder("Saving file: ")).append(uri).append(" to ").append(file2).toString());
        file2.getParentFile().mkdirs();
        file2.createNewFile();
        FileOutputStream fileoutputstream = new FileOutputStream(file2);
        byte abyte0[] = new byte[1024];
        do
        {
            int i = inputstream.read(abyte0);
            if (i <= 0)
            {
                inputstream.close();
                fileoutputstream.close();
                return;
            }
            fileoutputstream.write(abyte0, 0, i);
        } while (true);
    }

    public static void savePage(Context context, PageReference pagereference)
        throws MalformedURLException, ParserConfigurationException, FactoryConfigurationError, SAXException, IOException, PageAlreadyExistsException, JSONException
    {
        Uri uri;
        String s;
        File file;
        File file1;
        Iterator iterator;
        if (pagereference.getType() != PageReference.PageType.WIKI_PAGE)
        {
            throw new BadPageTypeException();
        }
        uri = Uri.parse(pagereference.toUrl());
        s = pagereference.loadPage(context).html;
        file = new File(getPagePath(uri));
        file1 = new File((new StringBuilder()).append(file.getAbsoluteFile()).append("/page.html").toString());
        if (file1.exists())
        {
            throw new PageAlreadyExistsException();
        }
        Log.i("OfflinePageSaver", (new StringBuilder("Saving page: ")).append(uri).toString());
        List list = findResourcesToSave(s, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']http://(.*?)[\\\"\\'](.*?>)", true);
        list.addAll(findResourcesToSave(s, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']/[^/](.*?)[\\\"\\'](.*?>)", false));
        list.addAll(findResourcesToSave(s, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']//(.*?)[\\\"\\'](.*?>)", true));
        Log.i("OfflinePageSaver", (new StringBuilder("Saving resources ")).append(list).toString());
        iterator = list.iterator();
_L3:
        if (iterator.hasNext()) goto _L2; else goto _L1
_L1:
        FileOutputStream fileoutputstream;
        byte abyte0[];
        int i;
        StringBuilder stringbuilder = new StringBuilder("$1=\"content://com.isaacwaller.wikidroid.offlinepages/");
        StringBuilder stringbuilder1 = new StringBuilder(String.valueOf(uri.getAuthority()));
        String s1;
        String s2;
        ByteArrayInputStream bytearrayinputstream;
        String s3;
        Exception exception;
        if ("".equals(uri.getPath()))
        {
            s1 = "";
        } else
        {
            s1 = (new StringBuilder("/")).append(uri.getPath()).toString();
        }
        s2 = stringbuilder.append(Uri.decode(stringbuilder1.append(s1).toString()).replace("$", "\\$")).toString();
        bytearrayinputstream = new ByteArrayInputStream(s.replaceAll("(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']http://(.*?)[\\\"\\'](.*?>)", (new StringBuilder(String.valueOf(s2))).append("/_res/$2\"$3").toString()).replaceAll("(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']/[^/](.*?)[\\\"\\'](.*?>)", (new StringBuilder(String.valueOf(s2))).append("/_res/en.m.wikipedia.org/$2\"$3").toString()).replaceAll("(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\']//(.*?)[\\\"\\'](.*?>)", (new StringBuilder(String.valueOf(s2))).append("/_res/$2\"$3").toString()).getBytes());
        file.mkdirs();
        file1.createNewFile();
        fileoutputstream = new FileOutputStream(file1);
        abyte0 = new byte[1024];
_L4:
        i = bytearrayinputstream.read(abyte0);
        if (i <= 0)
        {
            bytearrayinputstream.close();
            fileoutputstream.close();
            return;
        }
        break MISSING_BLOCK_LABEL_510;
_L2:
        s3 = (String)iterator.next();
        try
        {
            saveFile(file, Uri.parse(s3));
        }
        // Misplaced declaration of an exception variable
        catch (Exception exception)
        {
            exception.printStackTrace();
            Log.e("OfflinePageSaver", (new StringBuilder("Could not save ")).append(s3).append(". Will continue anyway...").toString());
        }
          goto _L3
        fileoutputstream.write(abyte0, 0, i);
          goto _L4
    }

    private static void searchDir(File file, List list)
        throws FileNotFoundException
    {
        String as[] = file.list();
        if (as != null)
        {
            int i = as.length;
            int j = 0;
            while (j < i) 
            {
                String s = as[j];
                File file1 = new File(file, s);
                if (file1.isDirectory())
                {
                    searchDir(file1, list);
                } else
                if (s.equals("page.html"))
                {
                    OfflinePage offlinepage = new OfflinePage();
                    offlinepage.file = file;
                    offlinepage.uri = Uri.parse((new StringBuilder("http://")).append(file.getAbsolutePath().replace(SAVE_DIR, "")).toString());
                    offlinepage.title = StringEscapeUtils.unescapeHtml4((new Scanner(file1)).findWithinHorizon("<title>(.*)</title>", 0));
                    offlinepage.title = Html.fromHtml(offlinepage.title.substring(7, -8 + offlinepage.title.length())).toString();
                    list.add(offlinepage);
                }
                j++;
            }
        }
    }

}
