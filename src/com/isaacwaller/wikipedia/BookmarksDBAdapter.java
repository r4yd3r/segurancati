// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class BookmarksDBAdapter
{
    private static class DatabaseHelper extends SQLiteOpenHelper
    {

        public void onCreate(SQLiteDatabase sqlitedatabase)
        {
            sqlitedatabase.execSQL("create table bookmarks (_id integer primary key autoincrement, title text not null, url text not null);");
        }

        public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
        {
            Log.w("BookmarksDBAdapter", (new StringBuilder("Upgrading database from version ")).append(i).append(" to ").append(j).append(", which will destroy all old data").toString());
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS bookmarks");
            onCreate(sqlitedatabase);
        }

        DatabaseHelper(Context context)
        {
            super(context, "data", null, 1);
        }
    }


    private static final String DATABASE_CREATE = "create table bookmarks (_id integer primary key autoincrement, title text not null, url text not null);";
    private static final String DATABASE_NAME = "data";
    private static final String DATABASE_TABLE = "bookmarks";
    private static final int DATABASE_VERSION = 1;
    public static final String KEY_ROWID = "_id";
    public static final String KEY_TITLE = "title";
    public static final String KEY_URL = "url";
    private static final String TAG = "BookmarksDBAdapter";
    private final Context mCtx;
    private SQLiteDatabase mDb;
    private DatabaseHelper mDbHelper;

    public BookmarksDBAdapter(Context context)
    {
        mCtx = context;
    }

    public long addBookmark(Context context, String s, String s1)
    {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("title", s1);
        contentvalues.put("url", s);
        return mDb.insert("bookmarks", null, contentvalues);
    }

    public void close()
    {
        mDbHelper.close();
    }

    public boolean deleteBookmark(long l)
    {
        return mDb.delete("bookmarks", (new StringBuilder("_id=")).append(l).toString(), null) > 0;
    }

    public Cursor fetchBookmark(long l)
        throws SQLException
    {
        Cursor cursor = mDb.query(true, "bookmarks", new String[] {
            "_id", "title", "url"
        }, (new StringBuilder("_id=")).append(l).toString(), null, null, null, null, null);
        if (cursor != null)
        {
            cursor.moveToFirst();
        }
        return cursor;
    }

    public Cursor fetchBookmarks()
    {
        return mDb.query("bookmarks", new String[] {
            "_id", "title", "url"
        }, null, null, null, null, null);
    }

    public BookmarksDBAdapter open()
        throws SQLException
    {
        mDbHelper = new DatabaseHelper(mCtx);
        mDb = mDbHelper.getWritableDatabase();
        return this;
    }
}
