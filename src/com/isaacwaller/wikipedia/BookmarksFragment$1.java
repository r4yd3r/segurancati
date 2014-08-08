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

class val.savedPages
    implements android.view.MenuListener
{

    final BookmarksFragment this$0;
    private final ListView val$savedPages;

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.enuInfo enuinfo)
    {
        final android.widget.ontextMenuInfo menuInfo = (android.widget.ontextMenuInfo)enuinfo;
        final Map item = (Map)val$savedPages.getItemAtPosition(menuInfo.position);
        contextmenu.setHeaderTitle((String)item.get("title"));
        contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

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
        });
        contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

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
        });
    }


    _cls2.val.item()
    {
        this$0 = final_bookmarksfragment;
        val$savedPages = ListView.this;
        super();
    }
}
