// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Map;

// Referenced classes of package com.isaacwaller.wikipedia:
//            OfflinePageSaver, PickSavedPageActivity

class val.c
    implements android.view.stener
{

    final is._cls0 this$1;
    private final Map val$c;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        OfflinePageSaver.deletePage((File)val$c.get("file"));
        runOnUiThread(new Runnable() {

            final PickSavedPageActivity._cls1._cls1 this$2;

            public void run()
            {
                try
                {
                    PickSavedPageActivity.access$0(this$0);
                    return;
                }
                catch (FileNotFoundException filenotfoundexception)
                {
                    throw new RuntimeException(filenotfoundexception);
                }
            }

            
            {
                this$2 = PickSavedPageActivity._cls1._cls1.this;
                super();
            }
        });
        return true;
    }


    is._cls0()
    {
        this$1 = final__pcls0;
        val$c = Map.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/PickSavedPageActivity$1

/* anonymous class */
    class PickSavedPageActivity._cls1
        implements android.view.View.OnCreateContextMenuListener
    {

        final PickSavedPageActivity this$0;

        public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
        {
            android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            Map map = (Map)getListView().getItemAtPosition(adaptercontextmenuinfo.position);
            contextmenu.setHeaderTitle((String)map.get("title"));
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(map. new PickSavedPageActivity._cls1._cls1());
        }


            
            {
                this$0 = PickSavedPageActivity.this;
                super();
            }
    }

}
