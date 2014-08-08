// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.view.CollapsibleActionView;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            ActionBarView, ScrollingTabContainerView, IcsSpinner

private class <init>
    implements MenuPresenter
{

    MenuItemImpl mCurrentExpandedItem;
    MenuBuilder mMenu;
    final ActionBarView this$0;

    public boolean collapseItemActionView(MenuBuilder menubuilder, MenuItemImpl menuitemimpl)
    {
        if (mExpandedActionView instanceof CollapsibleActionView)
        {
            ((CollapsibleActionView)mExpandedActionView).onActionViewCollapsed();
        }
        removeView(mExpandedActionView);
        removeView(ActionBarView.access$3(ActionBarView.this));
        mExpandedActionView = null;
        if ((2 & ActionBarView.access$10(ActionBarView.this)) != 0)
        {
            ActionBarView.access$5(ActionBarView.this)._mth0(0);
        }
        if ((8 & ActionBarView.access$10(ActionBarView.this)) != 0)
        {
            if (ActionBarView.access$6(ActionBarView.this) == null)
            {
                ActionBarView.access$11(ActionBarView.this);
            } else
            {
                ActionBarView.access$6(ActionBarView.this).setVisibility(0);
            }
        }
        if (ActionBarView.access$7(ActionBarView.this) != null && ActionBarView.access$12(ActionBarView.this) == 2)
        {
            ActionBarView.access$7(ActionBarView.this).setVisibility(0);
        }
        if (ActionBarView.access$8(ActionBarView.this) != null && ActionBarView.access$12(ActionBarView.this) == 1)
        {
            ActionBarView.access$8(ActionBarView.this).setVisibility(0);
        }
        if (ActionBarView.access$9(ActionBarView.this) != null && (0x10 & ActionBarView.access$10(ActionBarView.this)) != 0)
        {
            ActionBarView.access$9(ActionBarView.this).setVisibility(0);
        }
        ActionBarView.access$3(ActionBarView.this)._mth0(null);
        mCurrentExpandedItem = null;
        requestLayout();
        menuitemimpl.setActionViewExpanded(false);
        return true;
    }

    public boolean expandItemActionView(MenuBuilder menubuilder, MenuItemImpl menuitemimpl)
    {
        mExpandedActionView = menuitemimpl.getActionView();
        ActionBarView.access$3(ActionBarView.this)._mth0(ActionBarView.access$4(ActionBarView.this).getConstantState()._mth0());
        mCurrentExpandedItem = menuitemimpl;
        if (mExpandedActionView.getParent() != ActionBarView.this)
        {
            addView(mExpandedActionView);
        }
        if (ActionBarView.access$3(ActionBarView.this)._mth0() != ActionBarView.this)
        {
            addView(ActionBarView.access$3(ActionBarView.this));
        }
        ActionBarView.access$5(ActionBarView.this)._mth0(8);
        if (ActionBarView.access$6(ActionBarView.this) != null)
        {
            ActionBarView.access$6(ActionBarView.this).setVisibility(8);
        }
        if (ActionBarView.access$7(ActionBarView.this) != null)
        {
            ActionBarView.access$7(ActionBarView.this).setVisibility(8);
        }
        if (ActionBarView.access$8(ActionBarView.this) != null)
        {
            ActionBarView.access$8(ActionBarView.this).setVisibility(8);
        }
        if (ActionBarView.access$9(ActionBarView.this) != null)
        {
            ActionBarView.access$9(ActionBarView.this).setVisibility(8);
        }
        requestLayout();
        menuitemimpl.setActionViewExpanded(true);
        if (mExpandedActionView instanceof CollapsibleActionView)
        {
            ((CollapsibleActionView)mExpandedActionView).onActionViewExpanded();
        }
        return true;
    }

    public boolean flagActionItems()
    {
        return false;
    }

    public int getId()
    {
        return 0;
    }

    public MenuView getMenuView(ViewGroup viewgroup)
    {
        return null;
    }

    public void initForMenu(Context context, MenuBuilder menubuilder)
    {
        if (mMenu != null && mCurrentExpandedItem != null)
        {
            mMenu.collapseItemActionView(mCurrentExpandedItem);
        }
        mMenu = menubuilder;
    }

    public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
    {
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
    }

    public Parcelable onSaveInstanceState()
    {
        return null;
    }

    public boolean onSubMenuSelected(SubMenuBuilder submenubuilder)
    {
        return false;
    }

    public void setCallback(com.actionbarsherlock.internal.view.menu.nu nu)
    {
    }

    public void updateMenuView(boolean flag)
    {
        if (mCurrentExpandedItem == null) goto _L2; else goto _L1
_L1:
        MenuBuilder menubuilder;
        boolean flag1;
        menubuilder = mMenu;
        flag1 = false;
        if (menubuilder == null) goto _L4; else goto _L3
_L3:
        int i;
        int j;
        i = mMenu.size();
        j = 0;
_L8:
        flag1 = false;
        if (j < i) goto _L5; else goto _L4
_L4:
        if (!flag1)
        {
            collapseItemActionView(mMenu, mCurrentExpandedItem);
        }
_L2:
        return;
_L5:
        if (mMenu.getItem(j) != mCurrentExpandedItem)
        {
            break; /* Loop/switch isn't completed */
        }
        flag1 = true;
        if (true) goto _L4; else goto _L6
_L6:
        j++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    private Y()
    {
        this$0 = ActionBarView.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
