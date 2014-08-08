// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.database.Cursor;
import android.os.Environment;
import android.util.Log;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarksDBAdapter

public class BookmarkExporter
{
    public static class Bookmark
    {

        String name;
        String url;

        public Bookmark(String s, String s1)
        {
            name = s;
            url = s1;
        }
    }


    private static final String FOOTER = "</DL><p></DL>";
    private static final String HEADER = "<!DOCTYPE NETSCAPE-Bookmark-file-1>\n<!-- This is an automatically generated file.\n     It will be read and overwritten.\n     DO NOT EDIT! -->\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n<TITLE>Bookmarks</TITLE>\n<H1>Bookmarks</H1>\n<DL><DT><H3 FOLDED>Wikidroid Bookmarks</H3><DL><p>\n";

    public BookmarkExporter()
    {
    }

    private static String createBookmarksFile(List list)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("<!DOCTYPE NETSCAPE-Bookmark-file-1>\n<!-- This is an automatically generated file.\n     It will be read and overwritten.\n     DO NOT EDIT! -->\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n<TITLE>Bookmarks</TITLE>\n<H1>Bookmarks</H1>\n<DL><DT><H3 FOLDED>Wikidroid Bookmarks</H3><DL><p>\n");
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                stringbuilder.append("</DL><p></DL>");
                return stringbuilder.toString();
            }
            Bookmark bookmark = (Bookmark)iterator.next();
            stringbuilder.append((new StringBuilder("<DT><A HREF=\"")).append(bookmark.url).append("\">").append(bookmark.name).append("</A>\n").toString());
        } while (true);
    }

    public static void saveBookmarks(Context context)
        throws IOException
    {
        String s = (new StringBuilder(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()))).append(File.separator).append("WikidroidBookmarks.html").toString();
        Log.i("BookmarkExporter", (new StringBuilder("Creating ")).append(s).toString());
        (new File(s)).createNewFile();
        ArrayList arraylist = new ArrayList();
        BookmarksDBAdapter bookmarksdbadapter = (new BookmarksDBAdapter(context)).open();
        Cursor cursor = bookmarksdbadapter.fetchBookmarks();
        cursor.moveToFirst();
        do
        {
            if (cursor.isAfterLast())
            {
                cursor.close();
                bookmarksdbadapter.close();
                BufferedWriter bufferedwriter = new BufferedWriter(new FileWriter(s));
                bufferedwriter.write(createBookmarksFile(arraylist));
                bufferedwriter.close();
                return;
            }
            arraylist.add(new Bookmark(cursor.getString(cursor.getColumnIndex("title")), cursor.getString(cursor.getColumnIndex("url"))));
            cursor.moveToNext();
        } while (true);
    }
}
