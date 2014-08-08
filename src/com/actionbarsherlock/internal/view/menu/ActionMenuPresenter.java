// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.ImageButton;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.view.ActionProvider;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            BaseMenuPresenter, ActionMenuView, ActionMenuItemView, MenuBuilder, 
//            MenuItemImpl, MenuPopupHelper, SubMenuBuilder, MenuView

public class ActionMenuPresenter extends BaseMenuPresenter
    implements com.actionbarsherlock.view.ActionProvider.SubUiVisibilityListener
{
    private class ActionButtonSubmenu extends MenuPopupHelper
    {

        final ActionMenuPresenter this$0;

        public void onDismiss()
        {
            super.onDismiss();
            mActionButtonPopup = null;
            mOpenSubMenuId = 0;
        }

        public ActionButtonSubmenu(Context context, SubMenuBuilder submenubuilder)
        {
            int j;
            boolean flag;
            this$0 = ActionMenuPresenter.this;
            super(context, submenubuilder);
            if (!((MenuItemImpl)submenubuilder.getItem()).isActionButton())
            {
                int i;
                View view;
                if (mOverflowButton == null)
                {
                    view = (View)mMenuView;
                } else
                {
                    view = mOverflowButton;
                }
                setAnchorView(view);
            }
            setCallback(mPopupPresenterCallback);
            i = submenubuilder.size();
            j = 0;
_L5:
            flag = false;
            if (j < i) goto _L2; else goto _L1
_L1:
            setForceShowIcon(flag);
            return;
_L2:
            MenuItem menuitem = submenubuilder.getItem(j);
            if (!menuitem.isVisible() || menuitem.getIcon() == null)
            {
                break; /* Loop/switch isn't completed */
            }
            flag = true;
            if (true) goto _L1; else goto _L3
_L3:
            j++;
            if (true) goto _L5; else goto _L4
_L4:
        }
    }

    private static class HasPermanentMenuKey
    {

        public static boolean get(Context context)
        {
            return ViewConfiguration.get(context).hasPermanentMenuKey();
        }

        private HasPermanentMenuKey()
        {
        }
    }

    private class OpenOverflowRunnable
        implements Runnable
    {

        private OverflowPopup mPopup;
        final ActionMenuPresenter this$0;

        public void run()
        {
            mMenu.changeMenuMode();
            View view = (View)mMenuView;
            if (view != null && view.getWindowToken() != null && mPopup.tryShow())
            {
                mOverflowPopup = mPopup;
            }
            mPostedOpenRunnable = null;
        }

        public OpenOverflowRunnable(OverflowPopup overflowpopup)
        {
            this$0 = ActionMenuPresenter.this;
            super();
            mPopup = overflowpopup;
        }
    }

    private class OverflowMenuButton extends ImageButton
        implements ActionMenuView.ActionMenuChildView, View_HasStateListenerSupport
    {

        private final Set mListeners = new HashSet();
        final ActionMenuPresenter this$0;

        public void addOnAttachStateChangeListener(View_OnAttachStateChangeListener view_onattachstatechangelistener)
        {
            mListeners.add(view_onattachstatechangelistener);
        }

        public boolean needsDividerAfter()
        {
            return false;
        }

        public boolean needsDividerBefore()
        {
            return false;
        }

        protected void onAttachedToWindow()
        {
            super.onAttachedToWindow();
            Iterator iterator = mListeners.iterator();
            do
            {
                if (!iterator.hasNext())
                {
                    return;
                }
                ((View_OnAttachStateChangeListener)iterator.next()).onViewAttachedToWindow(this);
            } while (true);
        }

        protected void onDetachedFromWindow()
        {
            super.onDetachedFromWindow();
            Iterator iterator = mListeners.iterator();
            do
            {
                if (!iterator.hasNext())
                {
                    if (mOverflowPopup != null)
                    {
                        mOverflowPopup.dismiss();
                    }
                    return;
                }
                ((View_OnAttachStateChangeListener)iterator.next()).onViewDetachedFromWindow(this);
            } while (true);
        }

        public boolean performClick()
        {
            if (super.performClick())
            {
                return true;
            } else
            {
                playSoundEffect(0);
                showOverflowMenu();
                return true;
            }
        }

        public void removeOnAttachStateChangeListener(View_OnAttachStateChangeListener view_onattachstatechangelistener)
        {
            mListeners.remove(view_onattachstatechangelistener);
        }

        public OverflowMenuButton(Context context)
        {
            this$0 = ActionMenuPresenter.this;
            super(context, null, com.actionbarsherlock.R.attr.actionOverflowButtonStyle);
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
        }
    }

    private class OverflowPopup extends MenuPopupHelper
    {

        final ActionMenuPresenter this$0;

        public void onDismiss()
        {
            super.onDismiss();
            mMenu.close();
            mOverflowPopup = null;
        }

        public OverflowPopup(Context context, MenuBuilder menubuilder, View view, boolean flag)
        {
            this$0 = ActionMenuPresenter.this;
            super(context, menubuilder, view, flag);
            setCallback(mPopupPresenterCallback);
        }
    }

    private class PopupPresenterCallback
        implements MenuPresenter.Callback
    {

        final ActionMenuPresenter this$0;

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
        {
            if (menubuilder instanceof SubMenuBuilder)
            {
                ((SubMenuBuilder)menubuilder).getRootMenu().close(false);
            }
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder)
        {
            if (menubuilder == null)
            {
                return false;
            } else
            {
                mOpenSubMenuId = ((SubMenuBuilder)menubuilder).getItem().getItemId();
                return false;
            }
        }

        private PopupPresenterCallback()
        {
            this$0 = ActionMenuPresenter.this;
            super();
        }

        PopupPresenterCallback(PopupPresenterCallback popuppresentercallback)
        {
            this();
        }
    }

    private static class SavedState
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        };
        public int openSubMenuId;

        public int describeContents()
        {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(openSubMenuId);
        }


        SavedState()
        {
        }

        SavedState(Parcel parcel)
        {
            openSubMenuId = parcel.readInt();
        }
    }


    private final SparseBooleanArray mActionButtonGroups = new SparseBooleanArray();
    private ActionButtonSubmenu mActionButtonPopup;
    private int mActionItemWidthLimit;
    private boolean mExpandedActionViewsExclusive;
    private int mMaxItems;
    private boolean mMaxItemsSet;
    private int mMinCellSize;
    int mOpenSubMenuId;
    private View mOverflowButton;
    private OverflowPopup mOverflowPopup;
    final PopupPresenterCallback mPopupPresenterCallback = new PopupPresenterCallback(null);
    private OpenOverflowRunnable mPostedOpenRunnable;
    private boolean mReserveOverflow;
    private boolean mReserveOverflowSet;
    private View mScrapActionButtonView;
    private boolean mStrictWidthLimit;
    private int mWidthLimit;
    private boolean mWidthLimitSet;

    public ActionMenuPresenter(Context context)
    {
        super(context, com.actionbarsherlock.R.layout.abs__action_menu_layout, com.actionbarsherlock.R.layout.abs__action_menu_item_layout);
    }

    private View findViewForItem(MenuItem menuitem)
    {
        ViewGroup viewgroup = (ViewGroup)mMenuView;
        if (viewgroup != null) goto _L2; else goto _L1
_L1:
        View view = null;
_L4:
        return view;
_L2:
        int i = viewgroup.getChildCount();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return null;
            }
            view = viewgroup.getChildAt(j);
            if ((view instanceof MenuView.ItemView) && ((MenuView.ItemView)view).getItemData() == menuitem)
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static boolean reserveOverflow(Context context)
    {
        boolean flag1;
        if (android.os.Build.VERSION.SDK_INT < 14)
        {
            int i = android.os.Build.VERSION.SDK_INT;
            flag1 = false;
            if (i >= 11)
            {
                flag1 = true;
            }
        } else
        {
            boolean flag = HasPermanentMenuKey.get(context);
            flag1 = false;
            if (!flag)
            {
                return true;
            }
        }
        return flag1;
    }

    public void bindItemView(MenuItemImpl menuitemimpl, MenuView.ItemView itemview)
    {
        itemview.initialize(menuitemimpl, 0);
        ActionMenuView actionmenuview = (ActionMenuView)mMenuView;
        ((ActionMenuItemView)itemview).setItemInvoker(actionmenuview);
    }

    public boolean dismissPopupMenus()
    {
        return hideOverflowMenu() | hideSubMenus();
    }

    public boolean filterLeftoverView(ViewGroup viewgroup, int i)
    {
        if (viewgroup.getChildAt(i) == mOverflowButton)
        {
            return false;
        } else
        {
            return super.filterLeftoverView(viewgroup, i);
        }
    }

    public boolean flagActionItems()
    {
        ArrayList arraylist;
        int i;
        int j;
        int k;
        int l;
        ViewGroup viewgroup;
        int i1;
        int j1;
        int k1;
        boolean flag;
        int l1;
        arraylist = mMenu.getVisibleItems();
        i = arraylist.size();
        j = mMaxItems;
        k = mActionItemWidthLimit;
        l = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        viewgroup = (ViewGroup)mMenuView;
        i1 = 0;
        j1 = 0;
        k1 = 0;
        flag = false;
        l1 = 0;
_L3:
        if (l1 < i) goto _L2; else goto _L1
_L1:
        int i2;
        SparseBooleanArray sparsebooleanarray;
        int j2;
        int k2;
        int l2;
        if (mReserveOverflow && (flag || i1 + j1 > j))
        {
            j--;
        }
        i2 = j - i1;
        sparsebooleanarray = mActionButtonGroups;
        sparsebooleanarray.clear();
        boolean flag1 = mStrictWidthLimit;
        j2 = 0;
        k2 = 0;
        if (flag1)
        {
            k2 = k / mMinCellSize;
            int k4 = k % mMinCellSize;
            j2 = mMinCellSize + k4 / k2;
        }
        l2 = 0;
_L4:
        if (l2 >= i)
        {
            return true;
        }
        break MISSING_BLOCK_LABEL_225;
_L2:
        MenuItemImpl menuitemimpl = (MenuItemImpl)arraylist.get(l1);
        if (menuitemimpl.requiresActionButton())
        {
            i1++;
        } else
        if (menuitemimpl.requestsActionButton())
        {
            j1++;
        } else
        {
            flag = true;
        }
        if (mExpandedActionViewsExclusive && menuitemimpl.isActionViewExpanded())
        {
            j = 0;
        }
        l1++;
          goto _L3
        MenuItemImpl menuitemimpl1 = (MenuItemImpl)arraylist.get(l2);
        if (menuitemimpl1.requiresActionButton())
        {
            View view1 = getItemView(menuitemimpl1, mScrapActionButtonView, viewgroup);
            if (mScrapActionButtonView == null)
            {
                mScrapActionButtonView = view1;
            }
            int i4;
            int j4;
            if (mStrictWidthLimit)
            {
                k2 -= ActionMenuView.measureChildForCells(view1, j2, k2, l, 0);
            } else
            {
                view1.measure(l, l);
            }
            i4 = view1.getMeasuredWidth();
            k -= i4;
            if (k1 == 0)
            {
                k1 = i4;
            }
            j4 = menuitemimpl1.getGroupId();
            if (j4 != 0)
            {
                sparsebooleanarray.put(j4, true);
            }
            menuitemimpl1.setIsActionButton(true);
        } else
        if (menuitemimpl1.requestsActionButton())
        {
            int i3 = menuitemimpl1.getGroupId();
            boolean flag2 = sparsebooleanarray.get(i3);
            boolean flag3;
            if ((i2 > 0 || flag2) && k > 0 && (!mStrictWidthLimit || k2 > 0))
            {
                flag3 = true;
            } else
            {
                flag3 = false;
            }
            if (flag3)
            {
                View view = getItemView(menuitemimpl1, mScrapActionButtonView, viewgroup);
                if (mScrapActionButtonView == null)
                {
                    mScrapActionButtonView = view;
                }
                int k3;
                if (mStrictWidthLimit)
                {
                    int l3 = ActionMenuView.measureChildForCells(view, j2, k2, l, 0);
                    k2 -= l3;
                    if (l3 == 0)
                    {
                        flag3 = false;
                    }
                } else
                {
                    view.measure(l, l);
                }
                k3 = view.getMeasuredWidth();
                k -= k3;
                if (k1 == 0)
                {
                    k1 = k3;
                }
                if (mStrictWidthLimit)
                {
                    boolean flag5;
                    if (k >= 0)
                    {
                        flag5 = true;
                    } else
                    {
                        flag5 = false;
                    }
                    flag3 &= flag5;
                } else
                {
                    boolean flag4;
                    if (k + k1 > 0)
                    {
                        flag4 = true;
                    } else
                    {
                        flag4 = false;
                    }
                    flag3 &= flag4;
                }
            }
            if (flag3 && i3 != 0)
            {
                sparsebooleanarray.put(i3, true);
            } else
            if (flag2)
            {
                sparsebooleanarray.put(i3, false);
                int j3 = 0;
                while (j3 < l2) 
                {
                    MenuItemImpl menuitemimpl2 = (MenuItemImpl)arraylist.get(j3);
                    if (menuitemimpl2.getGroupId() == i3)
                    {
                        if (menuitemimpl2.isActionButton())
                        {
                            i2++;
                        }
                        menuitemimpl2.setIsActionButton(false);
                    }
                    j3++;
                }
            }
            if (flag3)
            {
                i2--;
            }
            menuitemimpl1.setIsActionButton(flag3);
        }
        l2++;
          goto _L4
    }

    public View getItemView(MenuItemImpl menuitemimpl, View view, ViewGroup viewgroup)
    {
        View view1 = menuitemimpl.getActionView();
        if (view1 == null || menuitemimpl.hasCollapsibleActionView())
        {
            if (!(view instanceof ActionMenuItemView))
            {
                view = null;
            }
            view1 = super.getItemView(menuitemimpl, view, viewgroup);
        }
        byte byte0;
        ActionMenuView actionmenuview;
        android.view.ViewGroup.LayoutParams layoutparams;
        if (menuitemimpl.isActionViewExpanded())
        {
            byte0 = 8;
        } else
        {
            byte0 = 0;
        }
        view1.setVisibility(byte0);
        actionmenuview = (ActionMenuView)viewgroup;
        layoutparams = view1.getLayoutParams();
        if (!actionmenuview.checkLayoutParams(layoutparams))
        {
            view1.setLayoutParams(actionmenuview.generateLayoutParams(layoutparams));
        }
        return view1;
    }

    public MenuView getMenuView(ViewGroup viewgroup)
    {
        MenuView menuview = super.getMenuView(viewgroup);
        ((ActionMenuView)menuview).setPresenter(this);
        return menuview;
    }

    public boolean hideOverflowMenu()
    {
        if (mPostedOpenRunnable != null && mMenuView != null)
        {
            ((View)mMenuView).removeCallbacks(mPostedOpenRunnable);
            mPostedOpenRunnable = null;
            return true;
        }
        OverflowPopup overflowpopup = mOverflowPopup;
        if (overflowpopup != null)
        {
            overflowpopup.dismiss();
            return true;
        } else
        {
            return false;
        }
    }

    public boolean hideSubMenus()
    {
        if (mActionButtonPopup != null)
        {
            mActionButtonPopup.dismiss();
            return true;
        } else
        {
            return false;
        }
    }

    public void initForMenu(Context context, MenuBuilder menubuilder)
    {
        super.initForMenu(context, menubuilder);
        Resources resources = context.getResources();
        if (!mReserveOverflowSet)
        {
            mReserveOverflow = reserveOverflow(mContext);
        }
        if (!mWidthLimitSet)
        {
            mWidthLimit = resources.getDisplayMetrics().widthPixels / 2;
        }
        if (!mMaxItemsSet)
        {
            mMaxItems = ResourcesCompat.getResources_getInteger(context, com.actionbarsherlock.R.integer.abs__max_action_buttons);
        }
        int i = mWidthLimit;
        if (mReserveOverflow)
        {
            if (mOverflowButton == null)
            {
                mOverflowButton = new OverflowMenuButton(mSystemContext);
                int j = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
                mOverflowButton.measure(j, j);
            }
            i -= mOverflowButton.getMeasuredWidth();
        } else
        {
            mOverflowButton = null;
        }
        mActionItemWidthLimit = i;
        mMinCellSize = (int)(56F * resources.getDisplayMetrics().density);
        mScrapActionButtonView = null;
    }

    public boolean isOverflowMenuShowing()
    {
        return mOverflowPopup != null && mOverflowPopup.isShowing();
    }

    public boolean isOverflowReserved()
    {
        return mReserveOverflow;
    }

    public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
    {
        dismissPopupMenus();
        super.onCloseMenu(menubuilder, flag);
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        if (!mMaxItemsSet)
        {
            mMaxItems = ResourcesCompat.getResources_getInteger(mContext, com.actionbarsherlock.R.integer.abs__max_action_buttons);
            if (mMenu != null)
            {
                mMenu.onItemsChanged(true);
            }
        }
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        if (savedstate.openSubMenuId > 0)
        {
            MenuItem menuitem = mMenu.findItem(savedstate.openSubMenuId);
            if (menuitem != null)
            {
                onSubMenuSelected((SubMenuBuilder)menuitem.getSubMenu());
            }
        }
    }

    public Parcelable onSaveInstanceState()
    {
        SavedState savedstate = new SavedState();
        savedstate.openSubMenuId = mOpenSubMenuId;
        return savedstate;
    }

    public boolean onSubMenuSelected(SubMenuBuilder submenubuilder)
    {
        if (submenubuilder.hasVisibleItems()) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        View view;
        for (SubMenuBuilder submenubuilder1 = submenubuilder; submenubuilder1.getParentMenu() != mMenu; submenubuilder1 = (SubMenuBuilder)submenubuilder1.getParentMenu())
        {
            break MISSING_BLOCK_LABEL_100;
        }

        view = findViewForItem(submenubuilder1.getItem());
        if (view != null)
        {
            break; /* Loop/switch isn't completed */
        }
        if (mOverflowButton == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        view = mOverflowButton;
        break; /* Loop/switch isn't completed */
        if (true) goto _L1; else goto _L3
_L3:
        mOpenSubMenuId = submenubuilder.getItem().getItemId();
        mActionButtonPopup = new ActionButtonSubmenu(mContext, submenubuilder);
        mActionButtonPopup.setAnchorView(view);
        mActionButtonPopup.show();
        super.onSubMenuSelected(submenubuilder);
        return true;
    }

    public void onSubUiVisibilityChanged(boolean flag)
    {
        if (flag)
        {
            super.onSubMenuSelected(null);
            return;
        } else
        {
            mMenu.close(false);
            return;
        }
    }

    public void setExpandedActionViewsExclusive(boolean flag)
    {
        mExpandedActionViewsExclusive = flag;
    }

    public void setItemLimit(int i)
    {
        mMaxItems = i;
        mMaxItemsSet = true;
    }

    public void setReserveOverflow(boolean flag)
    {
        mReserveOverflow = flag;
        mReserveOverflowSet = true;
    }

    public void setWidthLimit(int i, boolean flag)
    {
        mWidthLimit = i;
        mStrictWidthLimit = flag;
        mWidthLimitSet = true;
    }

    public boolean shouldIncludeItem(int i, MenuItemImpl menuitemimpl)
    {
        return menuitemimpl.isActionButton();
    }

    public boolean showOverflowMenu()
    {
        if (mReserveOverflow && !isOverflowMenuShowing() && mMenu != null && mMenuView != null && mPostedOpenRunnable == null && !mMenu.getNonActionItems().isEmpty())
        {
            mPostedOpenRunnable = new OpenOverflowRunnable(new OverflowPopup(mContext, mMenu, mOverflowButton, true));
            ((View)mMenuView).post(mPostedOpenRunnable);
            super.onSubMenuSelected(null);
            return true;
        } else
        {
            return false;
        }
    }

    public void updateMenuView(boolean flag)
    {
        super.updateMenuView(flag);
        if (mMenu == null) goto _L2; else goto _L1
_L1:
        ArrayList arraylist1;
        int j;
        int k;
        arraylist1 = mMenu.getActionItems();
        j = arraylist1.size();
        k = 0;
_L5:
        if (k < j) goto _L3; else goto _L2
_L2:
        ArrayList arraylist;
        boolean flag1;
        boolean flag2;
        if (mMenu != null)
        {
            arraylist = mMenu.getNonActionItems();
        } else
        {
            arraylist = null;
        }
        flag1 = mReserveOverflow;
        flag2 = false;
        if (flag1)
        {
            flag2 = false;
            if (arraylist != null)
            {
                int i = arraylist.size();
                ViewGroup viewgroup;
                ActionMenuView actionmenuview;
                ActionProvider actionprovider;
                if (i == 1)
                {
                    if (((MenuItemImpl)arraylist.get(0)).isActionViewExpanded())
                    {
                        flag2 = false;
                    } else
                    {
                        flag2 = true;
                    }
                } else
                if (i > 0)
                {
                    flag2 = true;
                } else
                {
                    flag2 = false;
                }
            }
        }
        if (flag2)
        {
            if (mOverflowButton == null)
            {
                mOverflowButton = new OverflowMenuButton(mSystemContext);
            }
            viewgroup = (ViewGroup)mOverflowButton.getParent();
            if (viewgroup != mMenuView)
            {
                if (viewgroup != null)
                {
                    viewgroup.removeView(mOverflowButton);
                }
                actionmenuview = (ActionMenuView)mMenuView;
                actionmenuview.addView(mOverflowButton, actionmenuview.generateOverflowButtonLayoutParams());
            }
        } else
        if (mOverflowButton != null && mOverflowButton.getParent() == mMenuView)
        {
            ((ViewGroup)mMenuView).removeView(mOverflowButton);
        }
        ((ActionMenuView)mMenuView).setOverflowReserved(mReserveOverflow);
        return;
_L3:
        actionprovider = ((MenuItemImpl)arraylist1.get(k)).getActionProvider();
        if (actionprovider != null)
        {
            actionprovider.setSubUiVisibilityListener(this);
        }
        k++;
        if (true) goto _L5; else goto _L4
_L4:
    }





}
