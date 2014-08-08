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
//            OfflinePageSaver, BookmarksFragment

class val.item
    implements android.view.ckListener
{

    final eshPages this$1;
    private final Map val$item;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        OfflinePageSaver.deletePage((File)val$item.get("file"));
        refreshPages();
        return true;
    }

    l.savedPages()
    {
        this$1 = final_savedpages;
        val$item = Map.this;
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
            final android.widget.AdapterView.AdapterContextMenuInfo menuInfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            Map map = (Map)savedPages.getItemAtPosition(menuInfo.position);
            contextmenu.setHeaderTitle((String)map.get("title"));
            contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(new BookmarksFragment._cls1._cls1());
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(map. new BookmarksFragment._cls1._cls2());
        }


            
            {
                this$0 = final_bookmarksfragment;
                savedPages = ListView.this;
                super();
            }

        // Unreferenced inner class com/isaacwaller/wikipedia/BookmarksFragment$1$1

/* anonymous class */
        class BookmarksFragment._cls1._cls1
            implements android.view.MenuItem.OnMenuItemClickListener
        {

            final BookmarksFragment._cls1 this$1;
            private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                onItemClick(mSavedPages, menuInfo.targetView, menuInfo.position, menuInfo.id);
                return true;
            }

                    
                    {
                        this$1 = BookmarksFragment._cls1.this;
                        menuInfo = adaptercontextmenuinfo;
                        super();
                    }
        }

    }

}
