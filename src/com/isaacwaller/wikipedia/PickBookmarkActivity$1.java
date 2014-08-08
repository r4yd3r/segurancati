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

class this._cls0
    implements android.view.uListener
{

    final PickBookmarkActivity this$0;

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.Info info)
    {
        android.widget.extMenuInfo extmenuinfo = (android.widget.extMenuInfo)info;
        final Cursor c = (Cursor)getListView().getItemAtPosition(extmenuinfo.position);
        contextmenu.setHeaderTitle(c.getString(c.getColumnIndex("title")));
        contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final PickBookmarkActivity._cls1 this$1;
            private final Cursor val$c;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                mAdapter.deleteBookmark(c.getLong(c.getColumnIndex("_id")));
                c.requery();
                return true;
            }

            
            {
                this$1 = PickBookmarkActivity._cls1.this;
                c = cursor;
                super();
            }
        });
    }


    _cls1.val.c()
    {
        this$0 = PickBookmarkActivity.this;
        super();
    }
}
