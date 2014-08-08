// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ListActivity;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarksDBAdapter, WelcomeActivity

public class PickBookmarkActivity extends ListActivity
{

    BookmarksDBAdapter mAdapter;

    public PickBookmarkActivity()
    {
        mAdapter = null;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mAdapter = new BookmarksDBAdapter(this);
        Cursor cursor = mAdapter.open().fetchBookmarks();
        int ai[] = {
            0x1020014, 0x1020015
        };
        setListAdapter(new SimpleCursorAdapter(this, 0x1090004, cursor, new String[] {
            "title", "url"
        }, ai));
        getListView().setOnCreateContextMenuListener(new android.view.View.OnCreateContextMenuListener() {

            final PickBookmarkActivity this$0;

            public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
            {
                android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
                Cursor cursor1 = (Cursor)getListView().getItemAtPosition(adaptercontextmenuinfo.position);
                contextmenu.setHeaderTitle(cursor1.getString(cursor1.getColumnIndex("title")));
                contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(cursor1. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls1 this$1;
                    private final Cursor val$c;

                    public boolean onMenuItemClick(MenuItem menuitem)
                    {
                        mAdapter.deleteBookmark(c.getLong(c.getColumnIndex("_id")));
                        c.requery();
                        return true;
                    }

            
            {
                this$1 = final__pcls1;
                c = Cursor.this;
                super();
            }
                });
            }


            
            {
                this$0 = PickBookmarkActivity.this;
                super();
            }
        });
    }

    public void onDestroy()
    {
        super.onDestroy();
        mAdapter.close();
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        Cursor cursor = (Cursor)listview.getItemAtPosition(i);
        String s = cursor.getString(cursor.getColumnIndex("url"));
        Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        intent.setData(Uri.parse(s));
        if ("android.intent.action.PICK".equals(getIntent().getAction()))
        {
            setResult(-1, intent);
        } else
        {
            intent.setClass(this, com/isaacwaller/wikipedia/WelcomeActivity);
            startActivity(intent);
        }
        finish();
    }
}
