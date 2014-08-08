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

class val.c
    implements android.view.ckListener
{

    final val.c this$1;
    private final Cursor val$c;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        mAdapter.deleteBookmark(val$c.getLong(val$c.getColumnIndex("_id")));
        val$c.requery();
        return true;
    }

    l.bookmarks()
    {
        this$1 = final_bookmarks;
        val$c = Cursor.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$2

/* anonymous class */
    class BookmarksFragment._cls2
        implements android.view.View.OnCreateContextMenuListener
    {

        final BookmarksFragment this$0;
        private final ListView val$bookmarks;

        public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
        {
            final android.widget.AdapterView.AdapterContextMenuInfo menuInfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            Cursor cursor = (Cursor)bookmarks.getItemAtPosition(menuInfo.position);
            contextmenu.setHeaderTitle(cursor.getString(cursor.getColumnIndex("title")));
            contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(new BookmarksFragment._cls2._cls1());
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(cursor. new BookmarksFragment._cls2._cls2());
        }


            
            {
                this$0 = final_bookmarksfragment;
                bookmarks = ListView.this;
                super();
            }

        // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$2$1

/* anonymous class */
        class BookmarksFragment._cls2._cls1
            implements android.view.MenuItem.OnMenuItemClickListener
        {

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
        }

    }

}
