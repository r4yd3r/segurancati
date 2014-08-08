// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import java.io.File;
import java.util.Map;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarksFragment, OfflinePageSaver

class o
    implements android.view.ckListener
{

    final o.id this$1;
    private final android.widget.textMenuInfo val$menuInfo;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        onItemClick(mSavedPages, val$menuInfo.targetView, val$menuInfo.position, val$menuInfo.id);
        return true;
    }

    o()
    {
        this$1 = final_o;
        val$menuInfo = android.widget.textMenuInfo.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$1

/* anonymous class */
    class BookmarksFragment._cls1
        implements android.view.View.OnCreateContextMenuListener
    {

        final BookmarksFragment this$0;
        private final ListView val$savedPages;

        public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
        {
            android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            final Map item = (Map)savedPages.getItemAtPosition(adaptercontextmenuinfo.position);
            contextmenu.setHeaderTitle((String)item.get("title"));
            contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(adaptercontextmenuinfo. new BookmarksFragment._cls1._cls1());
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new BookmarksFragment._cls1._cls2());
        }


            
            {
                this$0 = final_bookmarksfragment;
                savedPages = ListView.this;
                super();
            }

        // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$1$2

/* anonymous class */
        class BookmarksFragment._cls1._cls2
            implements android.view.MenuItem.OnMenuItemClickListener
        {

            final BookmarksFragment._cls1 this$1;
            private final Map val$item;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                OfflinePageSaver.deletePage((File)item.get("file"));
                refreshPages();
                return true;
            }

                    
                    {
                        this$1 = BookmarksFragment._cls1.this;
                        item = map;
                        super();
                    }
        }

    }

}
