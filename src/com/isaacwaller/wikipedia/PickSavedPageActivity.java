// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ListActivity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

// Referenced classes of package com.isaacwaller.wikipedia:
//            OfflinePageSaver, WelcomeActivity

public class PickSavedPageActivity extends ListActivity
{

    public PickSavedPageActivity()
    {
    }

    private void reloadData()
        throws FileNotFoundException
    {
        List list = OfflinePageSaver.getSavedPages();
        ArrayList arraylist = new ArrayList();
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                int ai[] = {
                    0x1020015, 0x1020014
                };
                setListAdapter(new SimpleAdapter(this, arraylist, 0x1090004, new String[] {
                    "uri", "title"
                }, ai));
                return;
            }
            OfflinePageSaver.OfflinePage offlinepage = (OfflinePageSaver.OfflinePage)iterator.next();
            HashMap hashmap = new HashMap();
            hashmap.put("uri", offlinepage.uri);
            hashmap.put("file", offlinepage.file);
            hashmap.put("title", offlinepage.title);
            arraylist.add(hashmap);
        } while (true);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        try
        {
            reloadData();
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            throw new RuntimeException(filenotfoundexception);
        }
        getListView().setOnCreateContextMenuListener(new android.view.View.OnCreateContextMenuListener() {

            final PickSavedPageActivity this$0;

            public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
            {
                android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
                Map map = (Map)getListView().getItemAtPosition(adaptercontextmenuinfo.position);
                contextmenu.setHeaderTitle((String)map.get("title"));
                contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(map. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls1 this$1;
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
                                    reloadData();
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
                this$1 = final__pcls1;
                c = Map.this;
                super();
            }
                });
            }


            
            {
                this$0 = PickSavedPageActivity.this;
                super();
            }
        });
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        File file = (File)((Map)getListView().getItemAtPosition(i)).get("file");
        Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        intent.setData(Uri.fromFile(new File((new StringBuilder(String.valueOf(file.getAbsolutePath()))).append("/page.html").toString())));
        if ("android.intent.action.PICK".equals(getIntent().getAction()))
        {
            setResult(-1, intent);
        } else
        {
            intent.setClass(this, com/isaacwaller/wikipedia/WelcomeActivity);
            startActivity(intent);
        }
        finish();
    }

}
