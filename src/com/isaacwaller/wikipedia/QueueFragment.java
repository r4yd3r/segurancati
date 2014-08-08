// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.ListFragment;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import java.io.OutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia:
//            Utils, HomeScreenShortcutActivity

public class QueueFragment extends ListFragment
{
    public static interface OnQueueItemSelectedListener
    {

        public abstract void onQueueItemSelected(String s);
    }


    private ArrayAdapter mAdapter;
    private JSONArray mQueue;

    public QueueFragment()
    {
        mQueue = null;
        mAdapter = null;
    }

    private void initList(final ListView list)
    {
        mAdapter = new ArrayAdapter(getActivity(), 0x7f03001a, 0x1020014);
        refreshList();
        setListAdapter(mAdapter);
        list.setOnCreateContextMenuListener(new android.view.View.OnCreateContextMenuListener() {

            final QueueFragment this$0;
            private final ListView val$list;

            public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
            {
                android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
                String s = mQueue.optString(-1 + adaptercontextmenuinfo.position);
                contextmenu.setHeaderTitle(HomeScreenShortcutActivity.getArticleNameFromURL(getActivity(), Uri.parse(s)));
                contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(adaptercontextmenuinfo. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls1 this$1;
                    private final ListView val$list;
                    private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

                    public boolean onMenuItemClick(MenuItem menuitem)
                    {
                        onListItemClick(list, menuInfo.targetView, menuInfo.position, menuInfo.id);
                        return true;
                    }

            
            {
                this$1 = final__pcls1;
                list = listview;
                menuInfo = android.widget.AdapterView.AdapterContextMenuInfo.this;
                super();
            }
                });
                contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(adaptercontextmenuinfo. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls1 this$1;
                    private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

                    public boolean onMenuItemClick(MenuItem menuitem)
                    {
                        remove(-1 + menuInfo.position);
                        refreshList();
                        return true;
                    }

            
            {
                this$1 = final__pcls1;
                menuInfo = android.widget.AdapterView.AdapterContextMenuInfo.this;
                super();
            }
                });
            }


            
            {
                this$0 = QueueFragment.this;
                list = listview;
                super();
            }
        });
    }

    private void refreshData()
    {
        try
        {
            mQueue = new JSONArray(new JSONTokener(Utils.slurp(getActivity().openFileInput("queue.json"))));
            return;
        }
        catch (Exception exception)
        {
            mQueue = new JSONArray();
        }
    }

    private void refreshList()
    {
        mAdapter.clear();
        int i = 0;
        do
        {
            if (i >= mQueue.length())
            {
                if (mQueue.length() > 0)
                {
                    mAdapter.add(getActivity().getString(0x7f0b005f));
                }
                return;
            }
            try
            {
                mAdapter.add(HomeScreenShortcutActivity.getArticleNameFromURL(getActivity(), Uri.parse(mQueue.getString(i))));
            }
            catch (JSONException jsonexception)
            {
                jsonexception.printStackTrace();
            }
            i++;
        } while (true);
    }

    private void remove(int i)
    {
        JSONArray jsonarray = new JSONArray();
        int j = 0;
        do
        {
            if (j >= mQueue.length())
            {
                mQueue = jsonarray;
                return;
            }
            if (j != i)
            {
                jsonarray.put(mQueue.opt(j));
            }
            j++;
        } while (true);
    }

    private void saveData()
    {
        try
        {
            getActivity().openFileOutput("queue.json", 0).write(mQueue.toString().getBytes());
            return;
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }

    public void addToQueue(String s)
    {
        mQueue.put(s);
        saveData();
        refreshList();
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f03001e, viewgroup, false);
        ListView listview = (ListView)view.findViewById(0x102000a);
        listview.setDivider(null);
        listview.addHeaderView(layoutinflater.inflate(0x7f03001f, null));
        refreshData();
        initList(listview);
        return view;
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        if (i > mQueue.length())
        {
            mQueue = new JSONArray();
            saveData();
            refreshList();
            return;
        } else
        {
            ((OnQueueItemSelectedListener)getActivity()).onQueueItemSelected(mQueue.optString(i - 1));
            return;
        }
    }



}
