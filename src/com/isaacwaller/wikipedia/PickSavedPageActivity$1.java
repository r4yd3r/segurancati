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
//            PickSavedPageActivity, OfflinePageSaver

class this._cls0
    implements android.view.Listener
{

    final PickSavedPageActivity this$0;

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.nfo nfo)
    {
        android.widget.xtMenuInfo xtmenuinfo = (android.widget.xtMenuInfo)nfo;
        final Map c = (Map)getListView().getItemAtPosition(xtmenuinfo.position);
        contextmenu.setHeaderTitle((String)c.get("title"));
        contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(new android.view.MenuItem.OnMenuItemClickListener() {

            final PickSavedPageActivity._cls1 this$1;
            private final Map val$c;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
                OfflinePageSaver.deletePage((File)c.get("file"));
                runOnUiThread(new Runnable() {

                    final _cls1 this$2;

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
                this$2 = _cls1.this;
                super();
            }
                });
                return true;
            }


            
            {
                this$1 = PickSavedPageActivity._cls1.this;
                c = map;
                super();
            }
        });
    }


    _cls1.val.c()
    {
        this$0 = PickSavedPageActivity.this;
        super();
    }
}
