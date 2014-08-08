// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import java.lang.reflect.Constructor;

// Referenced classes of package com.actionbarsherlock.view:
//            MenuInflater, MenuItem, Menu, SubMenu, 
//            ActionProvider

private class resetGroup
{

    private static final int defaultGroupId = 0;
    private static final int defaultItemCategory = 0;
    private static final int defaultItemCheckable = 0;
    private static final boolean defaultItemChecked = false;
    private static final boolean defaultItemEnabled = true;
    private static final int defaultItemId = 0;
    private static final int defaultItemOrder = 0;
    private static final boolean defaultItemVisible = true;
    private int groupCategory;
    private int groupCheckable;
    private boolean groupEnabled;
    private int groupId;
    private int groupOrder;
    private boolean groupVisible;
    private ActionProvider itemActionProvider;
    private String itemActionProviderClassName;
    private String itemActionViewClassName;
    private int itemActionViewLayout;
    private boolean itemAdded;
    private char itemAlphabeticShortcut;
    private int itemCategoryOrder;
    private int itemCheckable;
    private boolean itemChecked;
    private boolean itemEnabled;
    private int itemIconResId;
    private int itemId;
    private String itemListenerMethodName;
    private char itemNumericShortcut;
    private int itemShowAsAction;
    private CharSequence itemTitle;
    private CharSequence itemTitleCondensed;
    private boolean itemVisible;
    private Menu menu;
    final MenuInflater this$0;

    private char getShortcut(String s)
    {
        if (s == null)
        {
            return '\0';
        } else
        {
            return s.charAt(0);
        }
    }

    private Object newInstance(String s, Class aclass[], Object aobj[])
    {
        Object obj;
        try
        {
            obj = MenuInflater.access$0(MenuInflater.this).getClassLoader().loadClass(s).getConstructor(aclass).newInstance(aobj);
        }
        catch (Exception exception)
        {
            Log.w("MenuInflater", (new StringBuilder("Cannot instantiate class: ")).append(s).toString(), exception);
            return null;
        }
        return obj;
    }

    private void setItem(MenuItem menuitem)
    {
        MenuItem menuitem1 = menuitem.setChecked(itemChecked).setVisible(itemVisible).setEnabled(itemEnabled);
        boolean flag;
        if (itemCheckable >= 1)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        menuitem1.setCheckable(flag).setTitleCondensed(itemTitleCondensed).setIcon(itemIconResId).setAlphabeticShortcut(itemAlphabeticShortcut).setNumericShortcut(itemNumericShortcut);
        if (itemShowAsAction >= 0)
        {
            menuitem.setShowAsAction(itemShowAsAction);
        }
        if (itemListenerMethodName != null)
        {
            if (MenuInflater.access$0(MenuInflater.this).isRestricted())
            {
                throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
            }
            menuitem.setOnMenuItemClickListener(new MenuItemClickListener(MenuInflater.access$3(MenuInflater.this), itemListenerMethodName));
        }
        String s;
        boolean flag1;
        if (itemCheckable >= 2)
        {
            if (menuitem instanceof MenuItemImpl)
            {
                ((MenuItemImpl)menuitem).setExclusiveCheckable(true);
            } else
            {
                menu.setGroupCheckable(groupId, true, true);
            }
        }
        s = itemActionViewClassName;
        flag1 = false;
        if (s != null)
        {
            menuitem.setActionView((View)newInstance(itemActionViewClassName, MenuInflater.access$4(), MenuInflater.access$5(MenuInflater.this)));
            flag1 = true;
        }
        if (itemActionViewLayout > 0)
        {
            if (!flag1)
            {
                menuitem.setActionView(itemActionViewLayout);
            } else
            {
                Log.w("MenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
            }
        }
        if (itemActionProvider != null)
        {
            menuitem.setActionProvider(itemActionProvider);
        }
    }

    public void addItem()
    {
        itemAdded = true;
        setItem(menu.add(groupId, itemId, itemCategoryOrder, itemTitle));
    }

    public SubMenu addSubMenuItem()
    {
        itemAdded = true;
        SubMenu submenu = menu.addSubMenu(groupId, itemId, itemCategoryOrder, itemTitle);
        setItem(submenu.getItem());
        return submenu;
    }

    public boolean hasAddedItem()
    {
        return itemAdded;
    }

    public void readGroup(AttributeSet attributeset)
    {
        TypedArray typedarray = MenuInflater.access$0(MenuInflater.this).obtainStyledAttributes(attributeset, com.actionbarsherlock.uGroup);
        groupId = typedarray.getResourceId(1, 0);
        groupCategory = typedarray.getInt(3, 0);
        groupOrder = typedarray.getInt(4, 0);
        groupCheckable = typedarray.getInt(5, 0);
        groupVisible = typedarray.getBoolean(2, true);
        groupEnabled = typedarray.getBoolean(0, true);
        typedarray.recycle();
    }

    public void readItem(AttributeSet attributeset)
    {
        TypedArray typedarray = MenuInflater.access$0(MenuInflater.this).obtainStyledAttributes(attributeset, com.actionbarsherlock.uItem);
        itemId = typedarray.getResourceId(2, 0);
        int i = typedarray.getInt(5, groupCategory);
        int j = typedarray.getInt(6, groupOrder);
        itemCategoryOrder = 0xffff0000 & i | 0xffff & j;
        itemTitle = typedarray.getText(7);
        itemTitleCondensed = typedarray.getText(8);
        itemIconResId = typedarray.getResourceId(0, 0);
        itemAlphabeticShortcut = getShortcut(typedarray.getString(9));
        itemNumericShortcut = getShortcut(typedarray.getString(10));
        int k;
        String s;
        String s1;
        boolean flag;
        if (typedarray.hasValue(11))
        {
            TypedValue typedvalue;
            TypedValue typedvalue1;
            TypedValue typedvalue2;
            int l;
            if (typedarray.getBoolean(11, false))
            {
                l = 1;
            } else
            {
                l = 0;
            }
            itemCheckable = l;
        } else
        {
            itemCheckable = groupCheckable;
        }
        itemChecked = typedarray.getBoolean(3, false);
        itemVisible = typedarray.getBoolean(4, groupVisible);
        itemEnabled = typedarray.getBoolean(1, groupEnabled);
        typedvalue = new TypedValue();
        typedarray.getValue(13, typedvalue);
        if (typedvalue.type == 17)
        {
            k = typedvalue.data;
        } else
        {
            k = -1;
        }
        itemShowAsAction = k;
        itemListenerMethodName = typedarray.getString(12);
        itemActionViewLayout = typedarray.getResourceId(14, 0);
        typedvalue1 = new TypedValue();
        typedarray.getValue(15, typedvalue1);
        if (typedvalue1.type == 3)
        {
            s = typedvalue1.string.toString();
        } else
        {
            s = null;
        }
        itemActionViewClassName = s;
        typedvalue2 = new TypedValue();
        typedarray.getValue(16, typedvalue2);
        if (typedvalue2.type == 3)
        {
            s1 = typedvalue2.string.toString();
        } else
        {
            s1 = null;
        }
        itemActionProviderClassName = s1;
        if (itemActionProviderClassName != null)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (flag && itemActionViewLayout == 0 && itemActionViewClassName == null)
        {
            itemActionProvider = (ActionProvider)newInstance(itemActionProviderClassName, MenuInflater.access$1(), MenuInflater.access$2(MenuInflater.this));
        } else
        {
            if (flag)
            {
                Log.w("MenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
            }
            itemActionProvider = null;
        }
        typedarray.recycle();
        itemAdded = false;
    }

    public void resetGroup()
    {
        groupId = 0;
        groupCategory = 0;
        groupOrder = 0;
        groupCheckable = 0;
        groupVisible = true;
        groupEnabled = true;
    }


    public mpl(Menu menu1)
    {
        this$0 = MenuInflater.this;
        super();
        menu = menu1;
        resetGroup();
    }
}
