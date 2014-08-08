// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.SubMenu;
import android.view.View;
import com.actionbarsherlock.view.ActionProvider;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuItem;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            MenuItemImpl, MenuPresenter, SubMenuBuilder

public class MenuBuilder
    implements Menu
{
    public static interface Callback
    {

        public abstract boolean onMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem);

        public abstract void onMenuModeChange(MenuBuilder menubuilder);
    }

    public static interface ItemInvoker
    {

        public abstract boolean invokeItem(MenuItemImpl menuitemimpl);
    }


    private static final String ACTION_VIEW_STATES_KEY = "android:menu:actionviewstates";
    private static final String EXPANDED_ACTION_VIEW_ID = "android:menu:expandedactionview";
    private static final String PRESENTER_KEY = "android:menu:presenters";
    private static final int sCategoryToOrder[];
    private ArrayList mActionItems;
    private Callback mCallback;
    private final Context mContext;
    private android.view.ContextMenu.ContextMenuInfo mCurrentMenuInfo;
    private int mDefaultShowAsAction;
    private MenuItemImpl mExpandedItem;
    Drawable mHeaderIcon;
    CharSequence mHeaderTitle;
    View mHeaderView;
    private boolean mIsActionItemsStale;
    private boolean mIsClosing;
    private boolean mIsVisibleItemsStale;
    private ArrayList mItems;
    private boolean mItemsChangedWhileDispatchPrevented;
    private ArrayList mNonActionItems;
    private boolean mOptionalIconsVisible;
    private CopyOnWriteArrayList mPresenters;
    private boolean mPreventDispatchingItemsChanged;
    private boolean mQwertyMode;
    private final Resources mResources;
    private boolean mShortcutsVisible;
    private ArrayList mTempShortcutItemList;
    private ArrayList mVisibleItems;

    public MenuBuilder(Context context)
    {
        mDefaultShowAsAction = 0;
        mPreventDispatchingItemsChanged = false;
        mItemsChangedWhileDispatchPrevented = false;
        mOptionalIconsVisible = false;
        mIsClosing = false;
        mTempShortcutItemList = new ArrayList();
        mPresenters = new CopyOnWriteArrayList();
        mContext = context;
        mResources = context.getResources();
        mItems = new ArrayList();
        mVisibleItems = new ArrayList();
        mIsVisibleItemsStale = true;
        mActionItems = new ArrayList();
        mNonActionItems = new ArrayList();
        mIsActionItemsStale = true;
        setShortcutsVisibleInner(true);
    }

    private MenuItem addInternal(int i, int j, int k, CharSequence charsequence)
    {
        int l = getOrdering(k);
        MenuItemImpl menuitemimpl = new MenuItemImpl(this, i, j, k, l, charsequence, mDefaultShowAsAction);
        if (mCurrentMenuInfo != null)
        {
            menuitemimpl.setMenuInfo(mCurrentMenuInfo);
        }
        mItems.add(findInsertIndex(mItems, l), menuitemimpl);
        onItemsChanged(true);
        return menuitemimpl;
    }

    private void dispatchPresenterUpdate(boolean flag)
    {
        if (mPresenters.isEmpty())
        {
            return;
        }
        stopDispatchingItemsChanged();
        Iterator iterator = mPresenters.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                startDispatchingItemsChanged();
                return;
            }
            WeakReference weakreference = (WeakReference)iterator.next();
            MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
            if (menupresenter == null)
            {
                mPresenters.remove(weakreference);
            } else
            {
                menupresenter.updateMenuView(flag);
            }
        } while (true);
    }

    private void dispatchRestoreInstanceState(Bundle bundle)
    {
        SparseArray sparsearray = bundle.getSparseParcelableArray("android:menu:presenters");
        if (sparsearray != null && !mPresenters.isEmpty())
        {
            Iterator iterator = mPresenters.iterator();
            while (iterator.hasNext()) 
            {
                WeakReference weakreference = (WeakReference)iterator.next();
                MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
                if (menupresenter == null)
                {
                    mPresenters.remove(weakreference);
                } else
                {
                    int i = menupresenter.getId();
                    if (i > 0)
                    {
                        Parcelable parcelable = (Parcelable)sparsearray.get(i);
                        if (parcelable != null)
                        {
                            menupresenter.onRestoreInstanceState(parcelable);
                        }
                    }
                }
            }
        }
    }

    private void dispatchSaveInstanceState(Bundle bundle)
    {
        if (mPresenters.isEmpty())
        {
            return;
        }
        SparseArray sparsearray = new SparseArray();
        Iterator iterator = mPresenters.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                bundle.putSparseParcelableArray("android:menu:presenters", sparsearray);
                return;
            }
            WeakReference weakreference = (WeakReference)iterator.next();
            MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
            if (menupresenter == null)
            {
                mPresenters.remove(weakreference);
            } else
            {
                int i = menupresenter.getId();
                if (i > 0)
                {
                    Parcelable parcelable = menupresenter.onSaveInstanceState();
                    if (parcelable != null)
                    {
                        sparsearray.put(i, parcelable);
                    }
                }
            }
        } while (true);
    }

    private boolean dispatchSubMenuSelected(SubMenuBuilder submenubuilder)
    {
        boolean flag;
        if (mPresenters.isEmpty())
        {
            flag = false;
        } else
        {
            flag = false;
            Iterator iterator = mPresenters.iterator();
            while (iterator.hasNext()) 
            {
                WeakReference weakreference = (WeakReference)iterator.next();
                MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
                if (menupresenter == null)
                {
                    mPresenters.remove(weakreference);
                } else
                if (!flag)
                {
                    flag = menupresenter.onSubMenuSelected(submenubuilder);
                }
            }
        }
        return flag;
    }

    private static int findInsertIndex(ArrayList arraylist, int i)
    {
        int j = -1 + arraylist.size();
        do
        {
            if (j < 0)
            {
                return 0;
            }
            if (((MenuItemImpl)arraylist.get(j)).getOrdering() <= i)
            {
                return j + 1;
            }
            j--;
        } while (true);
    }

    private static int getOrdering(int i)
    {
        int j = (0xffff0000 & i) >> 16;
        if (j < 0 || j >= sCategoryToOrder.length)
        {
            throw new IllegalArgumentException("order does not contain a valid category.");
        } else
        {
            return sCategoryToOrder[j] << 16 | 0xffff & i;
        }
    }

    private void removeItemAtInt(int i, boolean flag)
    {
        if (i >= 0 && i < mItems.size())
        {
            mItems.remove(i);
            if (flag)
            {
                onItemsChanged(true);
                return;
            }
        }
    }

    private void setHeaderInternal(int i, CharSequence charsequence, int j, Drawable drawable, View view)
    {
        Resources resources = getResources();
        if (view == null) goto _L2; else goto _L1
_L1:
        mHeaderView = view;
        mHeaderTitle = null;
        mHeaderIcon = null;
_L4:
        onItemsChanged(false);
        return;
_L2:
        if (i > 0)
        {
            mHeaderTitle = resources.getText(i);
        } else
        if (charsequence != null)
        {
            mHeaderTitle = charsequence;
        }
        if (j <= 0)
        {
            break; /* Loop/switch isn't completed */
        }
        mHeaderIcon = resources.getDrawable(j);
_L6:
        mHeaderView = null;
        if (true) goto _L4; else goto _L3
_L3:
        if (drawable == null) goto _L6; else goto _L5
_L5:
        mHeaderIcon = drawable;
          goto _L6
    }

    private void setShortcutsVisibleInner(boolean flag)
    {
        boolean flag1 = true;
        if (!flag || mResources.getConfiguration().keyboard == flag1 || !mResources.getBoolean(com.actionbarsherlock.R.bool.abs__config_showMenuShortcutsWhenKeyboardPresent))
        {
            flag1 = false;
        }
        mShortcutsVisible = flag1;
    }

    public MenuItem add(int i)
    {
        return addInternal(0, 0, 0, mResources.getString(i));
    }

    public MenuItem add(int i, int j, int k, int l)
    {
        return addInternal(i, j, k, mResources.getString(l));
    }

    public MenuItem add(int i, int j, int k, CharSequence charsequence)
    {
        return addInternal(i, j, k, charsequence);
    }

    public MenuItem add(CharSequence charsequence)
    {
        return addInternal(0, 0, 0, charsequence);
    }

    public int addIntentOptions(int i, int j, int k, ComponentName componentname, Intent aintent[], Intent intent, int l, 
            MenuItem amenuitem[])
    {
        PackageManager packagemanager = mContext.getPackageManager();
        List list = packagemanager.queryIntentActivityOptions(componentname, aintent, intent, 0);
        int i1;
        int j1;
        if (list != null)
        {
            i1 = list.size();
        } else
        {
            i1 = 0;
        }
        if ((l & 1) == 0)
        {
            removeGroup(i);
        }
        j1 = 0;
        do
        {
            if (j1 >= i1)
            {
                return i1;
            }
            ResolveInfo resolveinfo = (ResolveInfo)list.get(j1);
            Intent intent1;
            Intent intent2;
            MenuItem menuitem;
            if (resolveinfo.specificIndex < 0)
            {
                intent1 = intent;
            } else
            {
                intent1 = aintent[resolveinfo.specificIndex];
            }
            intent2 = new Intent(intent1);
            intent2.setComponent(new ComponentName(resolveinfo.activityInfo.applicationInfo.packageName, resolveinfo.activityInfo.name));
            menuitem = add(i, j, k, resolveinfo.loadLabel(packagemanager)).setIcon(resolveinfo.loadIcon(packagemanager)).setIntent(intent2);
            if (amenuitem != null && resolveinfo.specificIndex >= 0)
            {
                amenuitem[resolveinfo.specificIndex] = menuitem;
            }
            j1++;
        } while (true);
    }

    public void addMenuPresenter(MenuPresenter menupresenter)
    {
        mPresenters.add(new WeakReference(menupresenter));
        menupresenter.initForMenu(mContext, this);
        mIsActionItemsStale = true;
    }

    public com.actionbarsherlock.view.SubMenu addSubMenu(int i)
    {
        return addSubMenu(0, 0, 0, ((CharSequence) (mResources.getString(i))));
    }

    public com.actionbarsherlock.view.SubMenu addSubMenu(int i, int j, int k, int l)
    {
        return addSubMenu(i, j, k, ((CharSequence) (mResources.getString(l))));
    }

    public com.actionbarsherlock.view.SubMenu addSubMenu(int i, int j, int k, CharSequence charsequence)
    {
        MenuItemImpl menuitemimpl = (MenuItemImpl)addInternal(i, j, k, charsequence);
        SubMenuBuilder submenubuilder = new SubMenuBuilder(mContext, this, menuitemimpl);
        menuitemimpl.setSubMenu(submenubuilder);
        return submenubuilder;
    }

    public com.actionbarsherlock.view.SubMenu addSubMenu(CharSequence charsequence)
    {
        return addSubMenu(0, 0, 0, charsequence);
    }

    public boolean bindNativeOverflow(android.view.Menu menu, android.view.MenuItem.OnMenuItemClickListener onmenuitemclicklistener, HashMap hashmap)
    {
        ArrayList arraylist = getNonActionItems();
        if (arraylist != null && arraylist.size() != 0) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        Iterator iterator;
        flag = false;
        menu.clear();
        iterator = arraylist.iterator();
_L6:
        if (!iterator.hasNext()) goto _L4; else goto _L3
_L3:
        MenuItemImpl menuitemimpl = (MenuItemImpl)iterator.next();
        if (!menuitemimpl.isVisible()) goto _L6; else goto _L5
_L5:
        SubMenu submenu;
        Iterator iterator1;
        flag = true;
        if (!menuitemimpl.hasSubMenu())
        {
            break MISSING_BLOCK_LABEL_483;
        }
        submenu = menu.addSubMenu(menuitemimpl.getGroupId(), menuitemimpl.getItemId(), menuitemimpl.getOrder(), menuitemimpl.getTitle());
        iterator1 = ((SubMenuBuilder)menuitemimpl.getSubMenu()).getVisibleItems().iterator();
_L9:
        if (iterator1.hasNext()) goto _L8; else goto _L7
_L7:
        android.view.MenuItem menuitem = submenu.getItem();
_L10:
        menuitem.setIcon(menuitemimpl.getIcon());
        menuitem.setOnMenuItemClickListener(onmenuitemclicklistener);
        menuitem.setEnabled(menuitemimpl.isEnabled());
        menuitem.setIntent(menuitemimpl.getIntent());
        menuitem.setNumericShortcut(menuitemimpl.getNumericShortcut());
        menuitem.setAlphabeticShortcut(menuitemimpl.getAlphabeticShortcut());
        menuitem.setTitleCondensed(menuitemimpl.getTitleCondensed());
        menuitem.setCheckable(menuitemimpl.isCheckable());
        menuitem.setChecked(menuitemimpl.isChecked());
        if (menuitemimpl.isExclusiveCheckable())
        {
            menu.setGroupCheckable(menuitemimpl.getGroupId(), true, true);
        }
        hashmap.put(menuitem, menuitemimpl);
          goto _L6
_L8:
        MenuItemImpl menuitemimpl1 = (MenuItemImpl)iterator1.next();
        android.view.MenuItem menuitem1 = submenu.add(menuitemimpl1.getGroupId(), menuitemimpl1.getItemId(), menuitemimpl1.getOrder(), menuitemimpl1.getTitle());
        menuitem1.setIcon(menuitemimpl1.getIcon());
        menuitem1.setOnMenuItemClickListener(onmenuitemclicklistener);
        menuitem1.setEnabled(menuitemimpl1.isEnabled());
        menuitem1.setIntent(menuitemimpl1.getIntent());
        menuitem1.setNumericShortcut(menuitemimpl1.getNumericShortcut());
        menuitem1.setAlphabeticShortcut(menuitemimpl1.getAlphabeticShortcut());
        menuitem1.setTitleCondensed(menuitemimpl1.getTitleCondensed());
        menuitem1.setCheckable(menuitemimpl1.isCheckable());
        menuitem1.setChecked(menuitemimpl1.isChecked());
        if (menuitemimpl1.isExclusiveCheckable())
        {
            submenu.setGroupCheckable(menuitemimpl1.getGroupId(), true, true);
        }
        hashmap.put(menuitem1, menuitemimpl1);
          goto _L9
        menuitem = menu.add(menuitemimpl.getGroupId(), menuitemimpl.getItemId(), menuitemimpl.getOrder(), menuitemimpl.getTitle());
          goto _L10
    }

    public void changeMenuMode()
    {
        if (mCallback != null)
        {
            mCallback.onMenuModeChange(this);
        }
    }

    public void clear()
    {
        if (mExpandedItem != null)
        {
            collapseItemActionView(mExpandedItem);
        }
        mItems.clear();
        onItemsChanged(true);
    }

    public void clearAll()
    {
        mPreventDispatchingItemsChanged = true;
        clear();
        clearHeader();
        mPreventDispatchingItemsChanged = false;
        mItemsChangedWhileDispatchPrevented = false;
        onItemsChanged(true);
    }

    public void clearHeader()
    {
        mHeaderIcon = null;
        mHeaderTitle = null;
        mHeaderView = null;
        onItemsChanged(false);
    }

    public void close()
    {
        close(true);
    }

    final void close(boolean flag)
    {
        if (mIsClosing)
        {
            return;
        }
        mIsClosing = true;
        Iterator iterator = mPresenters.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                mIsClosing = false;
                return;
            }
            WeakReference weakreference = (WeakReference)iterator.next();
            MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
            if (menupresenter == null)
            {
                mPresenters.remove(weakreference);
            } else
            {
                menupresenter.onCloseMenu(this, flag);
            }
        } while (true);
    }

    public boolean collapseItemActionView(MenuItemImpl menuitemimpl)
    {
        if (!mPresenters.isEmpty() && mExpandedItem == menuitemimpl) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L5:
        return flag;
_L2:
        Iterator iterator;
        flag = false;
        stopDispatchingItemsChanged();
        iterator = mPresenters.iterator();
_L6:
        if (iterator.hasNext()) goto _L4; else goto _L3
_L3:
        startDispatchingItemsChanged();
        if (flag)
        {
            mExpandedItem = null;
            return flag;
        }
          goto _L5
_L4:
        WeakReference weakreference = (WeakReference)iterator.next();
        MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
        if (menupresenter == null)
        {
            mPresenters.remove(weakreference);
            break; /* Loop/switch isn't completed */
        }
        flag = menupresenter.collapseItemActionView(this, menuitemimpl);
        if (!flag) goto _L6; else goto _L3
    }

    boolean dispatchMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem)
    {
        return mCallback != null && mCallback.onMenuItemSelected(menubuilder, menuitem);
    }

    public boolean expandItemActionView(MenuItemImpl menuitemimpl)
    {
        if (!mPresenters.isEmpty()) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L5:
        return flag;
_L2:
        Iterator iterator;
        flag = false;
        stopDispatchingItemsChanged();
        iterator = mPresenters.iterator();
_L6:
        if (iterator.hasNext()) goto _L4; else goto _L3
_L3:
        startDispatchingItemsChanged();
        if (flag)
        {
            mExpandedItem = menuitemimpl;
            return flag;
        }
          goto _L5
_L4:
        WeakReference weakreference = (WeakReference)iterator.next();
        MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
        if (menupresenter == null)
        {
            mPresenters.remove(weakreference);
            break; /* Loop/switch isn't completed */
        }
        flag = menupresenter.expandItemActionView(this, menuitemimpl);
        if (!flag) goto _L6; else goto _L3
    }

    public int findGroupIndex(int i)
    {
        return findGroupIndex(i, 0);
    }

    public int findGroupIndex(int i, int j)
    {
        int k;
        int l;
        k = size();
        if (j < 0)
        {
            j = 0;
        }
        l = j;
_L6:
        if (l < k) goto _L2; else goto _L1
_L1:
        l = -1;
_L4:
        return l;
_L2:
        if (((MenuItemImpl)mItems.get(l)).getGroupId() == i) goto _L4; else goto _L3
_L3:
        l++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public MenuItem findItem(int i)
    {
        int j;
        int k;
        j = size();
        k = 0;
_L6:
        if (k < j) goto _L2; else goto _L1
_L1:
        Object obj = null;
_L4:
        return ((MenuItem) (obj));
_L2:
        obj = (MenuItemImpl)mItems.get(k);
        if (((MenuItemImpl) (obj)).getItemId() == i) goto _L4; else goto _L3
_L3:
        if (((MenuItemImpl) (obj)).hasSubMenu())
        {
            MenuItem menuitem = ((MenuItemImpl) (obj)).getSubMenu().findItem(i);
            if (menuitem != null)
            {
                return menuitem;
            }
        }
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public int findItemIndex(int i)
    {
        int j;
        int k;
        j = size();
        k = 0;
_L6:
        if (k < j) goto _L2; else goto _L1
_L1:
        k = -1;
_L4:
        return k;
_L2:
        if (((MenuItemImpl)mItems.get(k)).getItemId() == i) goto _L4; else goto _L3
_L3:
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    MenuItemImpl findItemWithShortcutForKey(int i, KeyEvent keyevent)
    {
        ArrayList arraylist = mTempShortcutItemList;
        arraylist.clear();
        findItemsWithShortcutForKey(arraylist, i, keyevent);
        if (!arraylist.isEmpty())
        {
            int j = keyevent.getMetaState();
            android.view.KeyCharacterMap.KeyData keydata = new android.view.KeyCharacterMap.KeyData();
            keyevent.getKeyData(keydata);
            int k = arraylist.size();
            if (k == 1)
            {
                return (MenuItemImpl)arraylist.get(0);
            }
            boolean flag = isQwertyMode();
            int l = 0;
            while (l < k) 
            {
                MenuItemImpl menuitemimpl = (MenuItemImpl)arraylist.get(l);
                char c;
                if (flag)
                {
                    c = menuitemimpl.getAlphabeticShortcut();
                } else
                {
                    c = menuitemimpl.getNumericShortcut();
                }
                if (c == keydata.meta[0] && (j & 2) == 0 || c == keydata.meta[2] && (j & 2) != 0 || flag && c == '\b' && i == 67)
                {
                    return menuitemimpl;
                }
                l++;
            }
        }
        return null;
    }

    void findItemsWithShortcutForKey(List list, int i, KeyEvent keyevent)
    {
        boolean flag = isQwertyMode();
        int j = keyevent.getMetaState();
        android.view.KeyCharacterMap.KeyData keydata = new android.view.KeyCharacterMap.KeyData();
        if (keyevent.getKeyData(keydata) || i == 67)
        {
            int k = mItems.size();
            int l = 0;
            while (l < k) 
            {
                MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(l);
                if (menuitemimpl.hasSubMenu())
                {
                    ((MenuBuilder)menuitemimpl.getSubMenu()).findItemsWithShortcutForKey(list, i, keyevent);
                }
                char c;
                if (flag)
                {
                    c = menuitemimpl.getAlphabeticShortcut();
                } else
                {
                    c = menuitemimpl.getNumericShortcut();
                }
                if ((j & 5) == 0 && c != 0 && (c == keydata.meta[0] || c == keydata.meta[2] || flag && c == '\b' && i == 67) && menuitemimpl.isEnabled())
                {
                    list.add(menuitemimpl);
                }
                l++;
            }
        }
    }

    public void flagActionItems()
    {
        boolean flag;
        Iterator iterator;
        if (!mIsActionItemsStale)
        {
            return;
        }
        flag = false;
        iterator = mPresenters.iterator();
_L5:
        if (iterator.hasNext()) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        int i;
        int j;
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_172;
        }
        mActionItems.clear();
        mNonActionItems.clear();
        arraylist = getVisibleItems();
        i = arraylist.size();
        j = 0;
_L6:
        if (j < i) goto _L4; else goto _L3
_L3:
        mIsActionItemsStale = false;
        return;
_L2:
        WeakReference weakreference = (WeakReference)iterator.next();
        MenuPresenter menupresenter = (MenuPresenter)weakreference.get();
        if (menupresenter == null)
        {
            mPresenters.remove(weakreference);
        } else
        {
            flag |= menupresenter.flagActionItems();
        }
          goto _L5
_L4:
        MenuItemImpl menuitemimpl = (MenuItemImpl)arraylist.get(j);
        if (menuitemimpl.isActionButton())
        {
            mActionItems.add(menuitemimpl);
        } else
        {
            mNonActionItems.add(menuitemimpl);
        }
        j++;
          goto _L6
        mActionItems.clear();
        mNonActionItems.clear();
        mNonActionItems.addAll(getVisibleItems());
          goto _L3
    }

    ArrayList getActionItems()
    {
        flagActionItems();
        return mActionItems;
    }

    protected String getActionViewStatesKey()
    {
        return "android:menu:actionviewstates";
    }

    public Context getContext()
    {
        return mContext;
    }

    public MenuItemImpl getExpandedItem()
    {
        return mExpandedItem;
    }

    public Drawable getHeaderIcon()
    {
        return mHeaderIcon;
    }

    public CharSequence getHeaderTitle()
    {
        return mHeaderTitle;
    }

    public View getHeaderView()
    {
        return mHeaderView;
    }

    public MenuItem getItem(int i)
    {
        return (MenuItem)mItems.get(i);
    }

    ArrayList getNonActionItems()
    {
        flagActionItems();
        return mNonActionItems;
    }

    boolean getOptionalIconsVisible()
    {
        return mOptionalIconsVisible;
    }

    Resources getResources()
    {
        return mResources;
    }

    public MenuBuilder getRootMenu()
    {
        return this;
    }

    ArrayList getVisibleItems()
    {
        if (!mIsVisibleItemsStale)
        {
            return mVisibleItems;
        }
        mVisibleItems.clear();
        int i = mItems.size();
        int j = 0;
        do
        {
            if (j >= i)
            {
                mIsVisibleItemsStale = false;
                mIsActionItemsStale = true;
                return mVisibleItems;
            }
            MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(j);
            if (menuitemimpl.isVisible())
            {
                mVisibleItems.add(menuitemimpl);
            }
            j++;
        } while (true);
    }

    public boolean hasVisibleItems()
    {
        int i = size();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return false;
            }
            if (((MenuItemImpl)mItems.get(j)).isVisible())
            {
                return true;
            }
            j++;
        } while (true);
    }

    boolean isQwertyMode()
    {
        return mQwertyMode;
    }

    public boolean isShortcutKey(int i, KeyEvent keyevent)
    {
        return findItemWithShortcutForKey(i, keyevent) != null;
    }

    public boolean isShortcutsVisible()
    {
        return mShortcutsVisible;
    }

    void onItemActionRequestChanged(MenuItemImpl menuitemimpl)
    {
        mIsActionItemsStale = true;
        onItemsChanged(true);
    }

    void onItemVisibleChanged(MenuItemImpl menuitemimpl)
    {
        mIsVisibleItemsStale = true;
        onItemsChanged(true);
    }

    void onItemsChanged(boolean flag)
    {
        if (!mPreventDispatchingItemsChanged)
        {
            if (flag)
            {
                mIsVisibleItemsStale = true;
                mIsActionItemsStale = true;
            }
            dispatchPresenterUpdate(flag);
            return;
        } else
        {
            mItemsChangedWhileDispatchPrevented = true;
            return;
        }
    }

    public boolean performIdentifierAction(int i, int j)
    {
        return performItemAction(findItem(i), j);
    }

    public boolean performItemAction(MenuItem menuitem, int i)
    {
        MenuItemImpl menuitemimpl = (MenuItemImpl)menuitem;
        if (menuitemimpl != null && menuitemimpl.isEnabled()) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        flag = menuitemimpl.invoke();
        if (!menuitemimpl.hasCollapsibleActionView())
        {
            break; /* Loop/switch isn't completed */
        }
        flag |= menuitemimpl.expandActionView();
        if (flag)
        {
            close(true);
            return flag;
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (!menuitem.hasSubMenu())
        {
            continue; /* Loop/switch isn't completed */
        }
        close(false);
        SubMenuBuilder submenubuilder = (SubMenuBuilder)menuitem.getSubMenu();
        ActionProvider actionprovider = menuitem.getActionProvider();
        if (actionprovider != null && actionprovider.hasSubMenu())
        {
            actionprovider.onPrepareSubMenu(submenubuilder);
        }
        flag |= dispatchSubMenuSelected(submenubuilder);
        if (flag) goto _L4; else goto _L5
_L5:
        close(true);
        return flag;
        if ((i & 1) != 0) goto _L4; else goto _L6
_L6:
        close(true);
        return flag;
    }

    public boolean performShortcut(int i, KeyEvent keyevent, int j)
    {
        MenuItemImpl menuitemimpl = findItemWithShortcutForKey(i, keyevent);
        boolean flag = false;
        if (menuitemimpl != null)
        {
            flag = performItemAction(menuitemimpl, j);
        }
        if ((j & 2) != 0)
        {
            close(true);
        }
        return flag;
    }

    public void removeGroup(int i)
    {
        int j = findGroupIndex(i);
        if (j < 0) goto _L2; else goto _L1
_L1:
        int k;
        int l;
        k = mItems.size() - j;
        l = 0;
_L6:
        int i1 = l + 1;
        if (l < k && ((MenuItemImpl)mItems.get(j)).getGroupId() == i) goto _L4; else goto _L3
_L3:
        onItemsChanged(true);
_L2:
        return;
_L4:
        removeItemAtInt(j, false);
        l = i1;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public void removeItem(int i)
    {
        removeItemAtInt(findItemIndex(i), true);
    }

    public void removeItemAt(int i)
    {
        removeItemAtInt(i, true);
    }

    public void removeMenuPresenter(MenuPresenter menupresenter)
    {
        Iterator iterator = mPresenters.iterator();
        do
        {
            WeakReference weakreference;
            MenuPresenter menupresenter1;
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                weakreference = (WeakReference)iterator.next();
                menupresenter1 = (MenuPresenter)weakreference.get();
            } while (menupresenter1 != null && menupresenter1 != menupresenter);
            mPresenters.remove(weakreference);
        } while (true);
    }

    public void restoreActionViewStates(Bundle bundle)
    {
        if (bundle != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        SparseArray sparsearray = bundle.getSparseParcelableArray(getActionViewStatesKey());
        int i = size();
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    break label0;
                }
                int k = bundle.getInt("android:menu:expandedactionview");
                if (k > 0)
                {
                    MenuItem menuitem1 = findItem(k);
                    if (menuitem1 != null)
                    {
                        menuitem1.expandActionView();
                        return;
                    }
                }
            }
            if (true)
            {
                continue;
            }
            MenuItem menuitem = getItem(j);
            View view = menuitem.getActionView();
            if (view != null && view.getId() != -1)
            {
                view.restoreHierarchyState(sparsearray);
            }
            if (menuitem.hasSubMenu())
            {
                ((SubMenuBuilder)menuitem.getSubMenu()).restoreActionViewStates(bundle);
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public void restorePresenterStates(Bundle bundle)
    {
        dispatchRestoreInstanceState(bundle);
    }

    public void saveActionViewStates(Bundle bundle)
    {
        SparseArray sparsearray = null;
        int i = size();
        int j = 0;
        do
        {
            if (j >= i)
            {
                if (sparsearray != null)
                {
                    bundle.putSparseParcelableArray(getActionViewStatesKey(), sparsearray);
                }
                return;
            }
            MenuItem menuitem = getItem(j);
            View view = menuitem.getActionView();
            if (view != null && view.getId() != -1)
            {
                if (sparsearray == null)
                {
                    sparsearray = new SparseArray();
                }
                view.saveHierarchyState(sparsearray);
                if (menuitem.isActionViewExpanded())
                {
                    bundle.putInt("android:menu:expandedactionview", menuitem.getItemId());
                }
            }
            if (menuitem.hasSubMenu())
            {
                ((SubMenuBuilder)menuitem.getSubMenu()).saveActionViewStates(bundle);
            }
            j++;
        } while (true);
    }

    public void savePresenterStates(Bundle bundle)
    {
        dispatchSaveInstanceState(bundle);
    }

    public void setCallback(Callback callback)
    {
        mCallback = callback;
    }

    public void setCurrentMenuInfo(android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        mCurrentMenuInfo = contextmenuinfo;
    }

    public MenuBuilder setDefaultShowAsAction(int i)
    {
        mDefaultShowAsAction = i;
        return this;
    }

    void setExclusiveItemChecked(MenuItem menuitem)
    {
        int i = menuitem.getGroupId();
        int j = mItems.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(k);
            while (false) 
            {
                if (menuitemimpl.getGroupId() == i && menuitemimpl.isExclusiveCheckable() && menuitemimpl.isCheckable())
                {
                    boolean flag;
                    if (menuitemimpl == menuitem)
                    {
                        flag = true;
                    } else
                    {
                        flag = false;
                    }
                    menuitemimpl.setCheckedInt(flag);
                }
                k++;
            }
        } while (true);
    }

    public void setGroupCheckable(int i, boolean flag, boolean flag1)
    {
        int j = mItems.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(k);
            if (menuitemimpl.getGroupId() == i)
            {
                menuitemimpl.setExclusiveCheckable(flag1);
                menuitemimpl.setCheckable(flag);
            }
            k++;
        } while (true);
    }

    public void setGroupEnabled(int i, boolean flag)
    {
        int j = mItems.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(k);
            if (menuitemimpl.getGroupId() == i)
            {
                menuitemimpl.setEnabled(flag);
            }
            k++;
        } while (true);
    }

    public void setGroupVisible(int i, boolean flag)
    {
        int j = mItems.size();
        boolean flag1 = false;
        int k = 0;
        do
        {
            if (k >= j)
            {
                if (flag1)
                {
                    onItemsChanged(true);
                }
                return;
            }
            MenuItemImpl menuitemimpl = (MenuItemImpl)mItems.get(k);
            if (menuitemimpl.getGroupId() == i && menuitemimpl.setVisibleInt(flag))
            {
                flag1 = true;
            }
            k++;
        } while (true);
    }

    protected MenuBuilder setHeaderIconInt(int i)
    {
        setHeaderInternal(0, null, i, null, null);
        return this;
    }

    protected MenuBuilder setHeaderIconInt(Drawable drawable)
    {
        setHeaderInternal(0, null, 0, drawable, null);
        return this;
    }

    protected MenuBuilder setHeaderTitleInt(int i)
    {
        setHeaderInternal(i, null, 0, null, null);
        return this;
    }

    protected MenuBuilder setHeaderTitleInt(CharSequence charsequence)
    {
        setHeaderInternal(0, charsequence, 0, null, null);
        return this;
    }

    protected MenuBuilder setHeaderViewInt(View view)
    {
        setHeaderInternal(0, null, 0, null, view);
        return this;
    }

    void setOptionalIconsVisible(boolean flag)
    {
        mOptionalIconsVisible = flag;
    }

    public void setQwertyMode(boolean flag)
    {
        mQwertyMode = flag;
        onItemsChanged(false);
    }

    public void setShortcutsVisible(boolean flag)
    {
        if (mShortcutsVisible == flag)
        {
            return;
        } else
        {
            setShortcutsVisibleInner(flag);
            onItemsChanged(false);
            return;
        }
    }

    public int size()
    {
        return mItems.size();
    }

    public void startDispatchingItemsChanged()
    {
        mPreventDispatchingItemsChanged = false;
        if (mItemsChangedWhileDispatchPrevented)
        {
            mItemsChangedWhileDispatchPrevented = false;
            onItemsChanged(true);
        }
    }

    public void stopDispatchingItemsChanged()
    {
        if (!mPreventDispatchingItemsChanged)
        {
            mPreventDispatchingItemsChanged = true;
            mItemsChangedWhileDispatchPrevented = false;
        }
    }

    static 
    {
        int ai[] = new int[6];
        ai[0] = 1;
        ai[1] = 4;
        ai[2] = 5;
        ai[3] = 3;
        ai[4] = 2;
        sCategoryToOrder = ai;
    }
}
