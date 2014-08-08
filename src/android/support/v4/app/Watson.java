// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package android.support.v4.app;

import android.view.View;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

// Referenced classes of package android.support.v4.app:
//            FragmentActivity, FragmentManagerImpl, Fragment

public abstract class Watson extends FragmentActivity
    implements com.actionbarsherlock.ActionBarSherlock.OnCreatePanelMenuListener, com.actionbarsherlock.ActionBarSherlock.OnPreparePanelListener, com.actionbarsherlock.ActionBarSherlock.OnMenuItemSelectedListener
{
    public static interface OnCreateOptionsMenuListener
    {

        public abstract void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater);
    }

    public static interface OnOptionsItemSelectedListener
    {

        public abstract boolean onOptionsItemSelected(MenuItem menuitem);
    }

    public static interface OnPrepareOptionsMenuListener
    {

        public abstract void onPrepareOptionsMenu(Menu menu);
    }


    private static final boolean DEBUG = false;
    private static final String TAG = "Watson";
    private ArrayList mCreatedMenus;

    public Watson()
    {
    }

    public abstract MenuInflater getSupportMenuInflater();

    public abstract boolean onCreateOptionsMenu(Menu menu);

    public boolean onCreatePanelMenu(int i, Menu menu)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        boolean flag;
        MenuInflater menuinflater;
        ArrayList arraylist;
        ArrayList arraylist1;
        boolean flag1;
        flag = onCreateOptionsMenu(menu);
        menuinflater = getSupportMenuInflater();
        arraylist = mFragments.mAdded;
        arraylist1 = null;
        flag1 = false;
        if (arraylist == null) goto _L4; else goto _L3
_L3:
        int k = 0;
_L11:
        if (k < mFragments.mAdded.size()) goto _L5; else goto _L4
_L4:
        if (mCreatedMenus == null) goto _L7; else goto _L6
_L6:
        int j = 0;
_L9:
        if (j < mCreatedMenus.size()) goto _L8; else goto _L7
_L7:
        mCreatedMenus = arraylist1;
        return flag | flag1;
_L5:
        Fragment fragment1 = (Fragment)mFragments.mAdded.get(k);
        if (fragment1 != null && !fragment1.mHidden && fragment1.mHasMenu && fragment1.mMenuVisible && (fragment1 instanceof OnCreateOptionsMenuListener))
        {
            flag1 = true;
            ((OnCreateOptionsMenuListener)fragment1).onCreateOptionsMenu(menu, menuinflater);
            if (arraylist1 == null)
            {
                arraylist1 = new ArrayList();
            }
            arraylist1.add(fragment1);
        }
        k++;
        continue; /* Loop/switch isn't completed */
_L8:
        Fragment fragment = (Fragment)mCreatedMenus.get(j);
        if (arraylist1 == null || !arraylist1.contains(fragment))
        {
            fragment.onDestroyOptionsMenu();
        }
        j++;
        if (true) goto _L9; else goto _L2
_L2:
        return false;
        if (true) goto _L11; else goto _L10
_L10:
    }

    public boolean onMenuItemSelected(int i, MenuItem menuitem)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        if (!onOptionsItemSelected(menuitem)) goto _L4; else goto _L3
_L3:
        return true;
_L4:
        if (mFragments.mAdded == null) goto _L2; else goto _L5
_L5:
        int j = 0;
_L8:
        if (j < mFragments.mAdded.size()) goto _L6; else goto _L2
_L2:
        return false;
_L6:
        Fragment fragment = (Fragment)mFragments.mAdded.get(j);
        if (fragment != null && !fragment.mHidden && fragment.mHasMenu && fragment.mMenuVisible && (fragment instanceof OnOptionsItemSelectedListener) && ((OnOptionsItemSelectedListener)fragment).onOptionsItemSelected(menuitem))
        {
            continue; /* Loop/switch isn't completed */
        }
        j++;
        if (true) goto _L8; else goto _L7
_L7:
        if (true) goto _L3; else goto _L9
_L9:
    }

    public abstract boolean onOptionsItemSelected(MenuItem menuitem);

    public abstract boolean onPrepareOptionsMenu(Menu menu);

    public boolean onPreparePanel(int i, View view, Menu menu)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        boolean flag;
        ArrayList arraylist;
        boolean flag1;
        flag = onPrepareOptionsMenu(menu);
        arraylist = mFragments.mAdded;
        flag1 = false;
        if (arraylist == null) goto _L4; else goto _L3
_L3:
        int j = 0;
_L6:
        if (j < mFragments.mAdded.size()) goto _L5; else goto _L4
_L4:
        return (flag | flag1) & menu.hasVisibleItems();
_L5:
        Fragment fragment = (Fragment)mFragments.mAdded.get(j);
        if (fragment != null && !fragment.mHidden && fragment.mHasMenu && fragment.mMenuVisible && (fragment instanceof OnPrepareOptionsMenuListener))
        {
            flag1 = true;
            ((OnPrepareOptionsMenuListener)fragment).onPrepareOptionsMenu(menu);
        }
        j++;
        if (true) goto _L6; else goto _L2
_L2:
        return false;
    }
}
