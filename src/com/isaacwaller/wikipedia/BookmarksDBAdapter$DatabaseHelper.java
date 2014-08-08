// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarksDBAdapter

private static class A extends SQLiteOpenHelper
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

    A(Context context)
    {
        super(context, "data", null, 1);
    }
}
