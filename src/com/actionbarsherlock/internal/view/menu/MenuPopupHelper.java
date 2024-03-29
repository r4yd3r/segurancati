// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.internal.widget.IcsListPopupWindow;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            MenuPresenter, MenuBuilder, SubMenuBuilder, MenuItemImpl, 
//            MenuView, ListMenuItemView

public class MenuPopupHelper
    implements android.widget.AdapterView.OnItemClickListener, android.view.View.OnKeyListener, android.view.ViewTreeObserver.OnGlobalLayoutListener, android.widget.PopupWindow.OnDismissListener, View_OnAttachStateChangeListener, MenuPresenter
{
    private class ExpandedIndexObserver extends DataSetObserver
    {

        final MenuPopupHelper this$0;

        public void onChanged()
        {
            mAdapter.findExpandedIndex();
        }

        private ExpandedIndexObserver()
        {
            this$0 = MenuPopupHelper.this;
            super();
        }

        ExpandedIndexObserver(ExpandedIndexObserver expandedindexobserver)
        {
            this();
        }
    }

    private class MenuAdapter extends BaseAdapter
    {

        private MenuBuilder mAdapterMenu;
        private int mExpandedIndex;
        final MenuPopupHelper this$0;

        void findExpandedIndex()
        {
            MenuItemImpl menuitemimpl = mMenu.getExpandedItem();
            if (menuitemimpl == null) goto _L2; else goto _L1
_L1:
            ArrayList arraylist;
            int i;
            int j;
            arraylist = mMenu.getNonActionItems();
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
            if (mOverflowOnly)
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
            if (mOverflowOnly)
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
                view = mInflater.inflate(MenuPopupHelper.ITEM_LAYOUT, viewgroup, false);
            }
            MenuView.ItemView itemview = (MenuView.ItemView)view;
            if (mForceShowIcon)
            {
                ((ListMenuItemView)view).setForceShowIcon(true);
            }
            itemview.initialize(getItem(i), 0);
            return view;
        }


        public MenuAdapter(MenuBuilder menubuilder)
        {
            this$0 = MenuPopupHelper.this;
            super();
            mExpandedIndex = -1;
            mAdapterMenu = menubuilder;
            registerDataSetObserver(new ExpandedIndexObserver(null));
            findExpandedIndex();
        }
    }


    static final int ITEM_LAYOUT;
    private MenuAdapter mAdapter;
    private View mAnchorView;
    private Context mContext;
    boolean mForceShowIcon;
    private LayoutInflater mInflater;
    private ViewGroup mMeasureParent;
    private MenuBuilder mMenu;
    private boolean mOverflowOnly;
    private IcsListPopupWindow mPopup;
    private int mPopupMaxWidth;
    private MenuPresenter.Callback mPresenterCallback;
    private ViewTreeObserver mTreeObserver;

    public MenuPopupHelper(Context context, MenuBuilder menubuilder)
    {
        this(context, menubuilder, null, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menubuilder, View view)
    {
        this(context, menubuilder, view, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menubuilder, View view, boolean flag)
    {
        mContext = context;
        mInflater = LayoutInflater.from(context);
        mMenu = menubuilder;
        mOverflowOnly = flag;
        Resources resources = context.getResources();
        mPopupMaxWidth = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(com.actionbarsherlock.R.dimen.abs__config_prefDialogWidth));
        mAnchorView = view;
        menubuilder.addMenuPresenter(this);
    }

    private int measureContentWidth(ListAdapter listadapter)
    {
        int i = 0;
        View view = null;
        int j = 0;
        int k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        int l = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        int i1 = listadapter.getCount();
        int j1 = 0;
        do
        {
            if (j1 >= i1)
            {
                return i;
            }
            int k1 = listadapter.getItemViewType(j1);
            if (k1 != j)
            {
                j = k1;
                view = null;
            }
            if (mMeasureParent == null)
            {
                mMeasureParent = new FrameLayout(mContext);
            }
            view = listadapter.getView(j1, view, mMeasureParent);
            view.measure(k, l);
            i = Math.max(i, view.getMeasuredWidth());
            j1++;
        } while (true);
    }

    public boolean collapseItemActionView(MenuBuilder menubuilder, MenuItemImpl menuitemimpl)
    {
        return false;
    }

    public void dismiss()
    {
        if (isShowing())
        {
            mPopup.dismiss();
        }
    }

    public boolean expandItemActionView(MenuBuilder menubuilder, MenuItemImpl menuitemimpl)
    {
        return false;
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
        throw new UnsupportedOperationException("MenuPopupHelpers manage their own views");
    }

    public void initForMenu(Context context, MenuBuilder menubuilder)
    {
    }

    public boolean isShowing()
    {
        return mPopup != null && mPopup.isShowing();
    }

    public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
    {
        if (menubuilder == mMenu)
        {
            dismiss();
            if (mPresenterCallback != null)
            {
                mPresenterCallback.onCloseMenu(menubuilder, flag);
                return;
            }
        }
    }

    public void onDismiss()
    {
        mPopup = null;
        mMenu.close();
        if (mTreeObserver != null)
        {
            if (!mTreeObserver.isAlive())
            {
                mTreeObserver = mAnchorView.getViewTreeObserver();
            }
            mTreeObserver.removeGlobalOnLayoutListener(this);
            mTreeObserver = null;
        }
        ((View_HasStateListenerSupport)mAnchorView).removeOnAttachStateChangeListener(this);
    }

    public void onGlobalLayout()
    {
        if (isShowing())
        {
            View view = mAnchorView;
            if (view == null || !view.isShown())
            {
                dismiss();
            } else
            if (isShowing())
            {
                mPopup.show();
                return;
            }
        }
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        MenuAdapter menuadapter = mAdapter;
        menuadapter.mAdapterMenu.performItemAction(menuadapter.getItem(i), 0);
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        if (keyevent.getAction() == 1 && i == 82)
        {
            dismiss();
            return true;
        } else
        {
            return false;
        }
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
        boolean flag;
        boolean flag1;
        flag = submenubuilder.hasVisibleItems();
        flag1 = false;
        if (!flag) goto _L2; else goto _L1
_L1:
        MenuPopupHelper menupopuphelper;
        int i;
        int j;
        menupopuphelper = new MenuPopupHelper(mContext, submenubuilder, mAnchorView, false);
        menupopuphelper.setCallback(mPresenterCallback);
        i = submenubuilder.size();
        j = 0;
_L7:
        boolean flag2 = false;
        if (j < i) goto _L4; else goto _L3
_L3:
        menupopuphelper.setForceShowIcon(flag2);
        boolean flag3 = menupopuphelper.tryShow();
        flag1 = false;
        if (flag3)
        {
            if (mPresenterCallback != null)
            {
                mPresenterCallback.onOpenSubMenu(submenubuilder);
            }
            flag1 = true;
        }
_L2:
        return flag1;
_L4:
        MenuItem menuitem = submenubuilder.getItem(j);
        if (!menuitem.isVisible() || menuitem.getIcon() == null)
        {
            break; /* Loop/switch isn't completed */
        }
        flag2 = true;
        if (true) goto _L3; else goto _L5
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void onViewAttachedToWindow(View view)
    {
    }

    public void onViewDetachedFromWindow(View view)
    {
        if (mTreeObserver != null)
        {
            if (!mTreeObserver.isAlive())
            {
                mTreeObserver = view.getViewTreeObserver();
            }
            mTreeObserver.removeGlobalOnLayoutListener(this);
        }
        ((View_HasStateListenerSupport)view).removeOnAttachStateChangeListener(this);
    }

    public void setAnchorView(View view)
    {
        mAnchorView = view;
    }

    public void setCallback(MenuPresenter.Callback callback)
    {
        mPresenterCallback = callback;
    }

    public void setForceShowIcon(boolean flag)
    {
        mForceShowIcon = flag;
    }

    public void show()
    {
        if (!tryShow())
        {
            throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
        } else
        {
            return;
        }
    }

    public boolean tryShow()
    {
        mPopup = new IcsListPopupWindow(mContext, null, com.actionbarsherlock.R.attr.popupMenuStyle);
        mPopup.setOnDismissListener(this);
        mPopup.setOnItemClickListener(this);
        mAdapter = new MenuAdapter(mMenu);
        mPopup.setAdapter(mAdapter);
        mPopup.setModal(true);
        View view = mAnchorView;
        if (view != null)
        {
            ViewTreeObserver viewtreeobserver = mTreeObserver;
            boolean flag = false;
            if (viewtreeobserver == null)
            {
                flag = true;
            }
            mTreeObserver = view.getViewTreeObserver();
            if (flag)
            {
                mTreeObserver.addOnGlobalLayoutListener(this);
            }
            ((View_HasStateListenerSupport)view).addOnAttachStateChangeListener(this);
            mPopup.setAnchorView(view);
            mPopup.setContentWidth(Math.min(measureContentWidth(mAdapter), mPopupMaxWidth));
            mPopup.setInputMethodMode(2);
            mPopup.show();
            mPopup.getListView().setOnKeyListener(this);
            return true;
        } else
        {
            return false;
        }
    }

    public void updateMenuView(boolean flag)
    {
        if (mAdapter != null)
        {
            mAdapter.notifyDataSetChanged();
        }
    }

    static 
    {
        ITEM_LAYOUT = com.actionbarsherlock.R.layout.abs__popup_menu_item_layout;
    }




}
