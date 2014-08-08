// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.net.Uri;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import org.json.JSONArray;

// Referenced classes of package com.isaacwaller.wikipedia:
//            QueueFragment, HomeScreenShortcutActivity

class uInfo
    implements android.view.mClickListener
{

    final uInfo.id this$1;
    private final ListView val$list;
    private final android.widget.rContextMenuInfo val$menuInfo;

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        onListItemClick(val$list, val$menuInfo.targetView, val$menuInfo.position, val$menuInfo.id);
        return true;
    }

    uInfo()
    {
        this$1 = final_uinfo;
        val$list = listview;
        val$menuInfo = android.widget.rContextMenuInfo.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/QueueFragment$1

/* anonymous class */
    class QueueFragment._cls1
        implements android.view.View.OnCreateContextMenuListener
    {

        final QueueFragment this$0;
        private final ListView val$list;

        public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
        {
            final android.widget.AdapterView.AdapterContextMenuInfo menuInfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            String s = QueueFragment.access$0(QueueFragment.this).optString(-1 + menuInfo.position);
            contextmenu.setHeaderTitle(HomeScreenShortcutActivity.getArticleNameFromURL(getActivity(), Uri.parse(s)));
            contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(menuInfo. new QueueFragment._cls1._cls1());
            contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new QueueFragment._cls1._cls2());
        }


            
            {
                this$0 = final_queuefragment;
                list = ListView.this;
                super();
            }

        // Unreferenced inner class com/isaacwaller/wikipedia/QueueFragment$1$2

/* anonymous class */
        class QueueFragment._cls1._cls2
            implements android.view.MenuItem.OnMenuItemClickListener
        {

            final QueueFragment._cls1 this$1;
            private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                QueueFragment.access$1(this$0, -1 + menuInfo.position);
                QueueFragment.access$2(this$0);
                return true;
            }

                    
                    {
                        this$1 = QueueFragment._cls1.this;
                        menuInfo = adaptercontextmenuinfo;
                        super();
                    }
        }

    }

}
