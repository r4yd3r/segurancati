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

class val.list
    implements android.view.textMenuListener
{

    final QueueFragment this$0;
    private final ListView val$list;

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.extMenuInfo extmenuinfo)
    {
        final android.widget.terContextMenuInfo menuInfo = (android.widget.terContextMenuInfo)extmenuinfo;
        String s = QueueFragment.access$0(QueueFragment.this).optString(-1 + menuInfo.position);
        contextmenu.setHeaderTitle(HomeScreenShortcutActivity.getArticleNameFromURL(getActivity(), Uri.parse(s)));
        contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final QueueFragment._cls1 this$1;
            private final ListView val$list;
            private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                onListItemClick(list, menuInfo.targetView, menuInfo.position, menuInfo.id);
                return true;
            }

            
            {
                this$1 = QueueFragment._cls1.this;
                list = listview;
                menuInfo = adaptercontextmenuinfo;
                super();
            }
        });
        contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

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
        });
    }


    _cls2.val.menuInfo()
    {
        this$0 = final_queuefragment;
        val$list = ListView.this;
        super();
    }
}
