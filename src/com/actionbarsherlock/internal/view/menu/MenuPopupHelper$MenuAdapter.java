// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import java.util.ArrayList;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            MenuPopupHelper, MenuBuilder, MenuItemImpl, ListMenuItemView

private class findExpandedIndex extends BaseAdapter
{

    private MenuBuilder mAdapterMenu;
    private int mExpandedIndex;
    final MenuPopupHelper this$0;

    void findExpandedIndex()
    {
        MenuItemImpl menuitemimpl = MenuPopupHelper.access$2(MenuPopupHelper.this).getExpandedItem();
        if (menuitemimpl == null) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        int i;
        int j;
        arraylist = MenuPopupHelper.access$2(MenuPopupHelper.this).getNonActionItems();
        i = arraylist.size();
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        mExpandedIndex = -1;
        return;
_L3:
        if ((MenuItemImpl)arraylist.get(j) == menuitemimpl)
        {
            mExpandedIndex = j;
            return;
        }
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public int getCount()
    {
        ArrayList arraylist;
        if (MenuPopupHelper.access$0(MenuPopupHelper.this))
        {
            arraylist = mAdapterMenu.getNonActionItems();
        } else
        {
            arraylist = mAdapterMenu.getVisibleItems();
        }
        if (mExpandedIndex < 0)
        {
            return arraylist.size();
        } else
        {
            return -1 + arraylist.size();
        }
    }

    public MenuItemImpl getItem(int i)
    {
        ArrayList arraylist;
        if (MenuPopupHelper.access$0(MenuPopupHelper.this))
        {
            arraylist = mAdapterMenu.getNonActionItems();
        } else
        {
            arraylist = mAdapterMenu.getVisibleItems();
        }
        if (mExpandedIndex >= 0 && i >= mExpandedIndex)
        {
            i++;
        }
        return (MenuItemImpl)arraylist.get(i);
    }

    public volatile Object getItem(int i)
    {
        return getItem(i);
    }

    public long getItemId(int i)
    {
        return (long)i;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        if (view == null)
        {
            view = MenuPopupHelper.access$1(MenuPopupHelper.this).inflate(MenuPopupHelper.ITEM_LAYOUT, viewgroup, false);
        }
        getItem getitem = (this._cls0)view;
        if (mForceShowIcon)
        {
            ((ListMenuItemView)view).setForceShowIcon(true);
        }
        getitem.(getItem(i), 0);
        return view;
    }


    public xObserver(MenuBuilder menubuilder)
    {
        this$0 = MenuPopupHelper.this;
        super();
        mExpandedIndex = -1;
        mAdapterMenu = menubuilder;
        registerDataSetObserver(new xObserver(MenuPopupHelper.this, null));
        findExpandedIndex();
    }
}
