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

class o
    implements android.view.ckListener
{

    final o.id this$1;
    private final android.widget.textMenuInfo val$menuInfo;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        onItemClick(mBookmarks, val$menuInfo.targetView, val$menuInfo.position, val$menuInfo.id);
        return true;
    }

    o()
    {
        this$1 = final_o;
        val$menuInfo = android.widget.textMenuInfo.this;
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
            android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            final Cursor c = (Cursor)bookmarks.getItemAtPosition(adaptercontextmenuinfo.position);
            contextmenu.setHeaderTitle(c.getString(c.getColumnIndex("title")));
            contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(adaptercontextmenuinfo. new BookmarksFragment._cls2._cls1());
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new BookmarksFragment._cls2._cls2());
        }


            
            {
                this$0 = final_bookmarksfragment;
                bookmarks = ListView.this;
                super();
            }

        // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$2$2

/* anonymous class */
        class BookmarksFragment._cls2._cls2
            implements android.view.MenuItem.OnMenuItemClickListener
        {

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
        }

    }

}
