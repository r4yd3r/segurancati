// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.Activity;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SimpleCursorAdapter;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
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
//            BookmarksDBAdapter, OfflinePageSaver

public class BookmarksFragment extends Fragment
    implements android.widget.AdapterView.OnItemClickListener
{
    public static interface OnBookmarkSelectedListener
    {

        public abstract void onBookmarkSelected(String s);

        public abstract void onPageSelected(File file);
    }


    private Cursor c;
    BookmarksDBAdapter mAdapter;
    ListView mBookmarks;
    OnBookmarkSelectedListener mCallback;
    ListView mSavedPages;

    public BookmarksFragment()
    {
        mAdapter = null;
    }

    private void initBookmarks(final ListView bookmarks)
    {
        mAdapter = new BookmarksDBAdapter(getActivity());
        c = mAdapter.open().fetchBookmarks();
        int ai[] = {
            0x1020014, 0x1020015
        };
        String as[] = {
            "title", "url"
        };
        bookmarks.setAdapter(new SimpleCursorAdapter(getActivity(), 0x7f03001a, c, as, ai));
        bookmarks.setOnItemClickListener(this);
        bookmarks.setOnCreateContextMenuListener(new android.view.View.OnCreateContextMenuListener() {

            final BookmarksFragment this$0;
            private final ListView val$bookmarks;

            public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
            {
                android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
                Cursor cursor = (Cursor)bookmarks.getItemAtPosition(adaptercontextmenuinfo.position);
                contextmenu.setHeaderTitle(cursor.getString(cursor.getColumnIndex("title")));
                contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(adaptercontextmenuinfo. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls2 this$1;
                    private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

                    public boolean onMenuItemClick(MenuItem menuitem)
                    {
                        onItemClick(mBookmarks, menuInfo.targetView, menuInfo.position, menuInfo.id);
                        return true;
                    }

            
            {
                this$1 = final__pcls2;
                menuInfo = android.widget.AdapterView.AdapterContextMenuInfo.this;
                super();
            }
                });
                contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(cursor. new android.view.MenuItem.OnMenuItemClickListener() {

                    final _cls2 this$1;
                    private final Cursor val$c;

                    public boolean onMenuItemClick(MenuItem menuitem)
                    {
                        mAdapter.deleteBookmark(c.getLong(c.getColumnIndex("_id")));
                        c.requery();
                        return true;
                    }

            
            {
                this$1 = final__pcls2;
                c = Cursor.this;
                super();
            }
                });
            }


            
            {
                this$0 = BookmarksFragment.this;
                bookmarks = listview;
                super();
            }
        });
    }

    private void initSavedPages(final ListView savedPages)
    {
        List list = OfflinePageSaver.getSavedPages();
        Object obj = list;
_L1:
        ArrayList arraylist;
        Iterator iterator;
        arraylist = new ArrayList();
        iterator = ((List) (obj)).iterator();
_L2:
        if (!iterator.hasNext())
        {
            int ai[] = {
                0x1020015, 0x1020014
            };
            String as[] = {
                "uri", "title"
            };
            savedPages.setAdapter(new SimpleAdapter(getActivity(), arraylist, 0x7f03001a, as, ai));
            savedPages.setOnItemClickListener(this);
            savedPages.setOnCreateContextMenuListener(new android.view.View.OnCreateContextMenuListener() {

                final BookmarksFragment this$0;
                private final ListView val$savedPages;

                public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
                {
                    android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
                    Map map = (Map)savedPages.getItemAtPosition(adaptercontextmenuinfo.position);
                    contextmenu.setHeaderTitle((String)map.get("title"));
                    contextmenu.add(0x7f0b0060).setOnMenuItemClickListener(adaptercontextmenuinfo. new android.view.MenuItem.OnMenuItemClickListener() {

                        final _cls1 this$1;
                        private final android.widget.AdapterView.AdapterContextMenuInfo val$menuInfo;

                        public boolean onMenuItemClick(MenuItem menuitem)
                        {
                            onItemClick(mSavedPages, menuInfo.targetView, menuInfo.position, menuInfo.id);
                            return true;
                        }

            
            {
                this$1 = final__pcls1;
                menuInfo = android.widget.AdapterView.AdapterContextMenuInfo.this;
                super();
            }
                    });
                    contextmenu.add(0x7f0b001e).setOnMenuItemClickListener(map. new android.view.MenuItem.OnMenuItemClickListener() {

                        final _cls1 this$1;
                        private final Map val$item;

                        public boolean onMenuItemClick(MenuItem menuitem)
                        {
                            OfflinePageSaver.deletePage((File)item.get("file"));
                            refreshPages();
                            return true;
                        }

            
            {
                this$1 = final__pcls1;
                item = Map.this;
                super();
            }
                    });
                }


            
            {
                this$0 = BookmarksFragment.this;
                savedPages = listview;
                super();
            }
            });
            return;
        }
        break MISSING_BLOCK_LABEL_120;
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        obj = new ArrayList();
          goto _L1
        OfflinePageSaver.OfflinePage offlinepage = (OfflinePageSaver.OfflinePage)iterator.next();
        HashMap hashmap = new HashMap();
        hashmap.put("uri", offlinepage.uri);
        hashmap.put("file", offlinepage.file);
        hashmap.put("title", offlinepage.title);
        arraylist.add(hashmap);
          goto _L2
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
    }

    public void onAttach(Activity activity)
    {
        super.onAttach(activity);
        try
        {
            mCallback = (OnBookmarkSelectedListener)activity;
            return;
        }
        catch (ClassCastException classcastexception)
        {
            throw new ClassCastException((new StringBuilder(String.valueOf(activity.toString()))).append(" must implement OnBookmarkSelectedListener").toString());
        }
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f03001b, viewgroup, false);
        mBookmarks = (ListView)view.findViewById(0x7f06003e);
        mSavedPages = (ListView)view.findViewById(0x7f060042);
        mBookmarks.setDivider(null);
        mSavedPages.setDivider(null);
        mBookmarks.setEmptyView(view.findViewById(0x7f06003f));
        mSavedPages.setEmptyView(view.findViewById(0x7f060043));
        initBookmarks(mBookmarks);
        initSavedPages(mSavedPages);
        return view;
    }

    public void onDestroy()
    {
        super.onDestroy();
        mAdapter.close();
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        if (adapterview == mBookmarks)
        {
            Cursor cursor = (Cursor)adapterview.getItemAtPosition(i);
            String s = cursor.getString(cursor.getColumnIndex("url"));
            mCallback.onBookmarkSelected(s);
            return;
        } else
        {
            Map map = (Map)mSavedPages.getItemAtPosition(i);
            mCallback.onPageSelected((File)map.get("file"));
            return;
        }
    }

    public void refreshBookmarks()
    {
        c.requery();
    }

    public void refreshPages()
    {
        initSavedPages(mSavedPages);
    }
}
