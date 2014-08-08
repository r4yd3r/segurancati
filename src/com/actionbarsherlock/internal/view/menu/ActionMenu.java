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
import android.content.res.Resources;
import android.view.KeyEvent;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.view.SubMenu;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            ActionMenuItem

public class ActionMenu
    implements Menu
{

    private Context mContext;
    private boolean mIsQwerty;
    private ArrayList mItems;

    public ActionMenu(Context context)
    {
        mContext = context;
        mItems = new ArrayList();
    }

    private int findItemIndex(int i)
    {
        ArrayList arraylist;
        int j;
        int k;
        arraylist = mItems;
        j = arraylist.size();
        k = 0;
_L6:
        if (k < j) goto _L2; else goto _L1
_L1:
        k = -1;
_L4:
        return k;
_L2:
        if (((ActionMenuItem)arraylist.get(k)).getItemId() == i) goto _L4; else goto _L3
_L3:
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private ActionMenuItem findItemWithShortcut(int i, KeyEvent keyevent)
    {
        boolean flag;
        ArrayList arraylist;
        int j;
        int k;
        flag = mIsQwerty;
        arraylist = mItems;
        j = arraylist.size();
        k = 0;
_L6:
        if (k < j) goto _L2; else goto _L1
_L1:
        ActionMenuItem actionmenuitem = null;
_L4:
        return actionmenuitem;
_L2:
        actionmenuitem = (ActionMenuItem)arraylist.get(k);
        char c;
        if (flag)
        {
            c = actionmenuitem.getAlphabeticShortcut();
        } else
        {
            c = actionmenuitem.getNumericShortcut();
        }
        if (i == c) goto _L4; else goto _L3
_L3:
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public MenuItem add(int i)
    {
        return add(0, 0, 0, i);
    }

    public MenuItem add(int i, int j, int k, int l)
    {
        return add(i, j, k, ((CharSequence) (mContext.getResources().getString(l))));
    }

    public MenuItem add(int i, int j, int k, CharSequence charsequence)
    {
        ActionMenuItem actionmenuitem = new ActionMenuItem(getContext(), i, j, 0, k, charsequence);
        mItems.add(k, actionmenuitem);
        return actionmenuitem;
    }

    public MenuItem add(CharSequence charsequence)
    {
        return add(0, 0, 0, charsequence);
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

    public SubMenu addSubMenu(int i)
    {
        return null;
    }

    public SubMenu addSubMenu(int i, int j, int k, int l)
    {
        return null;
    }

    public SubMenu addSubMenu(int i, int j, int k, CharSequence charsequence)
    {
        return null;
    }

    public SubMenu addSubMenu(CharSequence charsequence)
    {
        return null;
    }

    public void clear()
    {
        mItems.clear();
    }

    public void close()
    {
    }

    public MenuItem findItem(int i)
    {
        return (MenuItem)mItems.get(findItemIndex(i));
    }

    public Context getContext()
    {
        return mContext;
    }

    public MenuItem getItem(int i)
    {
        return (MenuItem)mItems.get(i);
    }

    public boolean hasVisibleItems()
    {
        ArrayList arraylist = mItems;
        int i = arraylist.size();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return false;
            }
            if (((ActionMenuItem)arraylist.get(j)).isVisible())
            {
                return true;
            }
            j++;
        } while (true);
    }

    public boolean isShortcutKey(int i, KeyEvent keyevent)
    {
        return findItemWithShortcut(i, keyevent) != null;
    }

    public boolean performIdentifierAction(int i, int j)
    {
        int k = findItemIndex(i);
        if (k < 0)
        {
            return false;
        } else
        {
            return ((ActionMenuItem)mItems.get(k)).invoke();
        }
    }

    public boolean performShortcut(int i, KeyEvent keyevent, int j)
    {
        ActionMenuItem actionmenuitem = findItemWithShortcut(i, keyevent);
        if (actionmenuitem == null)
        {
            return false;
        } else
        {
            return actionmenuitem.invoke();
        }
    }

    public void removeGroup(int i)
    {
        ArrayList arraylist = mItems;
        int j = arraylist.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            if (((ActionMenuItem)arraylist.get(k)).getGroupId() == i)
            {
                arraylist.remove(k);
                j--;
            } else
            {
                k++;
            }
        } while (true);
    }

    public void removeItem(int i)
    {
        mItems.remove(findItemIndex(i));
    }

    public void setGroupCheckable(int i, boolean flag, boolean flag1)
    {
        ArrayList arraylist = mItems;
        int j = arraylist.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            ActionMenuItem actionmenuitem = (ActionMenuItem)arraylist.get(k);
            if (actionmenuitem.getGroupId() == i)
            {
                actionmenuitem.setCheckable(flag);
                actionmenuitem.setExclusiveCheckable(flag1);
            }
            k++;
        } while (true);
    }

    public void setGroupEnabled(int i, boolean flag)
    {
        ArrayList arraylist = mItems;
        int j = arraylist.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            ActionMenuItem actionmenuitem = (ActionMenuItem)arraylist.get(k);
            if (actionmenuitem.getGroupId() == i)
            {
                actionmenuitem.setEnabled(flag);
            }
            k++;
        } while (true);
    }

    public void setGroupVisible(int i, boolean flag)
    {
        ArrayList arraylist = mItems;
        int j = arraylist.size();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            ActionMenuItem actionmenuitem = (ActionMenuItem)arraylist.get(k);
            if (actionmenuitem.getGroupId() == i)
            {
                actionmenuitem.setVisible(flag);
            }
            k++;
        } while (true);
    }

    public void setQwertyMode(boolean flag)
    {
        mIsQwerty = flag;
    }

    public int size()
    {
        return mItems.size();
    }
}
