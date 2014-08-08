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
//            PickBookmarkActivity, BookmarksDBAdapter

class val.c
    implements android.view.istener
{

    final val.c this$1;
    private final Cursor val$c;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        mAdapter.deleteBookmark(val$c.getLong(val$c.getColumnIndex("_id")));
        val$c.requery();
        return true;
    }

    is._cls0()
    {
        this$1 = final__pcls0;
        val$c = Cursor.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/PickBookmarkActivity$1

/* anonymous class */
    class PickBookmarkActivity._cls1
        implements android.view.View.OnCreateContextMenuListener
    {

        final PickBookmarkActivity this$0;

        public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
        {
            android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            Cursor cursor = (Cursor)getListView().getItemAtPosition(adaptercontextmenuinfo.position);
            contextmenu.setHeaderTitle(cursor.getString(cursor.getColumnIndex("title")));
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(cursor. new PickBookmarkActivity._cls1._cls1());
        }


            
            {
                this$0 = PickBookmarkActivity.this;
                super();
            }
    }

}
