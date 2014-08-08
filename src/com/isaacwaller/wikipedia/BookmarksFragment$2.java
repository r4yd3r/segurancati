// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.database.Cursor;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarksFragment, BookmarksDBAdapter

class val.bookmarks
    implements android.view.MenuListener
{

    final BookmarksFragment this$0;
    private final ListView val$bookmarks;

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.enuInfo enuinfo)
    {
        final android.widget.ontextMenuInfo menuInfo = (android.widget.ontextMenuInfo)enuinfo;
        final Cursor c = (Cursor)val$bookmarks.getItemAtPosition(menuInfo.position);
        contextmenu.setHeaderTitle(c.getString(c.getColumnIndex("title")));
        contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final BookmarksFragment._cls2 this$1;
            private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                onItemClick(mBookmarks, menuInfo.targetView, menuInfo.position, menuInfo.id);
                return true;
            }

            
            {
                this$1 = BookmarksFragment._cls2.this;
                menuInfo = adaptercontextmenuinfo;
                super();
            }
        });
        contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final BookmarksFragment._cls2 this$1;
            private final Cursor val$c;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                mAdapter.deleteBookmark(c.getLong(c.getColumnIndex("_id")));
                c.requery();
                return true;
            }

            
            {
                this$1 = BookmarksFragment._cls2.this;
                c = cursor;
                super();
            }
        });
    }


    _cls2.val.c()
    {
        this$0 = final_bookmarksfragment;
        val$bookmarks = ListView.this;
        super();
    }
}
