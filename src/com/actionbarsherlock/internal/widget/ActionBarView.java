// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.actionbarsherlock.internal.ActionBarSherlockCompat;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.menu.ActionMenuItem;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.view.CollapsibleActionView;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuItem;
import java.util.List;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            AbsActionBarView, IcsSpinner, IcsProgressBar, ScrollingTabContainerView, 
//            ActionBarContextView, IcsLinearLayout, ActionBarContainer, IcsAdapterView

public class ActionBarView extends AbsActionBarView
{
    private class ExpandedActionViewMenuPresenter
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
            removeView(mExpandedHomeLayout);
            mExpandedActionView = null;
            if ((2 & mDisplayOptions) != 0)
            {
                mHomeLayout.setVisibility(0);
            }
            if ((8 & mDisplayOptions) != 0)
            {
                if (mTitleLayout == null)
                {
                    initTitle();
                } else
                {
                    mTitleLayout.setVisibility(0);
                }
            }
            if (mTabScrollView != null && mNavigationMode == 2)
            {
                mTabScrollView.setVisibility(0);
            }
            if (mSpinner != null && mNavigationMode == 1)
            {
                mSpinner.setVisibility(0);
            }
            if (mCustomNavView != null && (0x10 & mDisplayOptions) != 0)
            {
                mCustomNavView.setVisibility(0);
            }
            mExpandedHomeLayout.setIcon(null);
            mCurrentExpandedItem = null;
            requestLayout();
            menuitemimpl.setActionViewExpanded(false);
            return true;
        }

        public boolean expandItemActionView(MenuBuilder menubuilder, MenuItemImpl menuitemimpl)
        {
            mExpandedActionView = menuitemimpl.getActionView();
            mExpandedHomeLayout.setIcon(mIcon.getConstantState().newDrawable());
            mCurrentExpandedItem = menuitemimpl;
            if (mExpandedActionView.getParent() != ActionBarView.this)
            {
                addView(mExpandedActionView);
            }
            if (mExpandedHomeLayout.getParent() != ActionBarView.this)
            {
                addView(mExpandedHomeLayout);
            }
            mHomeLayout.setVisibility(8);
            if (mTitleLayout != null)
            {
                mTitleLayout.setVisibility(8);
            }
            if (mTabScrollView != null)
            {
                mTabScrollView.setVisibility(8);
            }
            if (mSpinner != null)
            {
                mSpinner.setVisibility(8);
            }
            if (mCustomNavView != null)
            {
                mCustomNavView.setVisibility(8);
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

        public void setCallback(com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback callback)
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

        private ExpandedActionViewMenuPresenter()
        {
            this$0 = ActionBarView.this;
            super();
        }

        ExpandedActionViewMenuPresenter(ExpandedActionViewMenuPresenter expandedactionviewmenupresenter)
        {
            this();
        }
    }

    public static class HomeView extends FrameLayout
    {

        private ImageView mIconView;
        private View mUpView;
        private int mUpWidth;

        public boolean dispatchHoverEvent(MotionEvent motionevent)
        {
            return onHoverEvent(motionevent);
        }

        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
        {
            onPopulateAccessibilityEvent(accessibilityevent);
            return true;
        }

        public int getLeftOffset()
        {
            if (mUpView.getVisibility() == 8)
            {
                return mUpWidth;
            } else
            {
                return 0;
            }
        }

        protected void onFinishInflate()
        {
            mUpView = findViewById(com.actionbarsherlock.R.id.abs__up);
            mIconView = (ImageView)findViewById(com.actionbarsherlock.R.id.abs__home);
        }

        protected void onLayout(boolean flag, int i, int j, int k, int l)
        {
            int i1 = (l - j) / 2;
            int j1 = mUpView.getVisibility();
            int k1 = 0;
            if (j1 != 8)
            {
                android.widget.FrameLayout.LayoutParams layoutparams1 = (android.widget.FrameLayout.LayoutParams)mUpView.getLayoutParams();
                int i3 = mUpView.getMeasuredHeight();
                int j3 = mUpView.getMeasuredWidth();
                int k3 = i1 - i3 / 2;
                mUpView.layout(0, k3, j3, k3 + i3);
                k1 = j3 + layoutparams1.leftMargin + layoutparams1.rightMargin;
                i += k1;
            }
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mIconView.getLayoutParams();
            int l1 = mIconView.getMeasuredHeight();
            int i2 = mIconView.getMeasuredWidth();
            int j2 = (k - i) / 2;
            int k2 = k1 + Math.max(layoutparams.leftMargin, j2 - i2 / 2);
            int l2 = Math.max(layoutparams.topMargin, i1 - l1 / 2);
            mIconView.layout(k2, l2, k2 + i2, l2 + l1);
        }

        protected void onMeasure(int i, int j)
        {
            int i1;
            int j1;
            int i2;
            int j2;
            measureChildWithMargins(mUpView, i, 0, j, 0);
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mUpView.getLayoutParams();
            mUpWidth = layoutparams.leftMargin + mUpView.getMeasuredWidth() + layoutparams.rightMargin;
            int k;
            int l;
            android.widget.FrameLayout.LayoutParams layoutparams1;
            int k1;
            int l1;
            if (mUpView.getVisibility() == 8)
            {
                k = 0;
            } else
            {
                k = mUpWidth;
            }
            l = layoutparams.topMargin + mUpView.getMeasuredHeight() + layoutparams.bottomMargin;
            measureChildWithMargins(mIconView, i, k, j, 0);
            layoutparams1 = (android.widget.FrameLayout.LayoutParams)mIconView.getLayoutParams();
            i1 = k + (layoutparams1.leftMargin + mIconView.getMeasuredWidth() + layoutparams1.rightMargin);
            j1 = Math.max(l, layoutparams1.topMargin + mIconView.getMeasuredHeight() + layoutparams1.bottomMargin);
            k1 = android.view.View.MeasureSpec.getMode(i);
            l1 = android.view.View.MeasureSpec.getMode(j);
            i2 = android.view.View.MeasureSpec.getSize(i);
            j2 = android.view.View.MeasureSpec.getSize(j);
            k1;
            JVM INSTR lookupswitch 2: default 204
        //                       -2147483648: 250
        //                       1073741824: 262;
               goto _L1 _L2 _L3
_L1:
            l1;
            JVM INSTR lookupswitch 2: default 232
        //                       -2147483648: 269
        //                       1073741824: 281;
               goto _L4 _L5 _L6
_L4:
            setMeasuredDimension(i1, j1);
            return;
_L2:
            i1 = Math.min(i1, i2);
              goto _L1
_L3:
            i1 = i2;
              goto _L1
_L5:
            j1 = Math.min(j1, j2);
              goto _L4
_L6:
            j1 = j2;
              goto _L4
        }

        public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
        {
            if (android.os.Build.VERSION.SDK_INT >= 14)
            {
                super.onPopulateAccessibilityEvent(accessibilityevent);
            }
            CharSequence charsequence = getContentDescription();
            if (!TextUtils.isEmpty(charsequence))
            {
                accessibilityevent.getText().add(charsequence);
            }
        }

        public void setIcon(Drawable drawable)
        {
            mIconView.setImageDrawable(drawable);
        }

        public void setUp(boolean flag)
        {
            View view = mUpView;
            int i;
            if (flag)
            {
                i = 0;
            } else
            {
                i = 8;
            }
            view.setVisibility(i);
        }

        public HomeView(Context context)
        {
            this(context, null);
        }

        public HomeView(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }

    static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel, null);
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
        int expandedMenuItemId;
        boolean isOverflowOpen;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(expandedMenuItemId);
            int j;
            if (isOverflowOpen)
            {
                j = 1;
            } else
            {
                j = 0;
            }
            parcel.writeInt(j);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            expandedMenuItemId = parcel.readInt();
            boolean flag;
            if (parcel.readInt() != 0)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            isOverflowOpen = flag;
        }

        SavedState(Parcel parcel, SavedState savedstate)
        {
            this(parcel);
        }

        SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private static final boolean DEBUG = false;
    private static final int DEFAULT_CUSTOM_GRAVITY = 19;
    public static final int DISPLAY_DEFAULT = 0;
    private static final int DISPLAY_RELAYOUT_MASK = 31;
    private static final String TAG = "ActionBarView";
    private com.actionbarsherlock.app.ActionBar.OnNavigationListener mCallback;
    private ActionBarContextView mContextView;
    private View mCustomNavView;
    private int mDisplayOptions;
    View mExpandedActionView;
    private final android.view.View.OnClickListener mExpandedActionViewUpListener = new android.view.View.OnClickListener() {

        final ActionBarView this$0;

        public void onClick(View view)
        {
            MenuItemImpl menuitemimpl = mExpandedMenuPresenter.mCurrentExpandedItem;
            if (menuitemimpl != null)
            {
                menuitemimpl.collapseActionView();
            }
        }

            
            {
                this$0 = ActionBarView.this;
                super();
            }
    };
    private HomeView mExpandedHomeLayout;
    private ExpandedActionViewMenuPresenter mExpandedMenuPresenter;
    private HomeView mHomeLayout;
    private Drawable mIcon;
    private boolean mIncludeTabs;
    private int mIndeterminateProgressStyle;
    private IcsProgressBar mIndeterminateProgressView;
    private boolean mIsCollapsable;
    private boolean mIsCollapsed;
    private int mItemPadding;
    private IcsLinearLayout mListNavLayout;
    private Drawable mLogo;
    private ActionMenuItem mLogoNavItem;
    private final IcsAdapterView.OnItemSelectedListener mNavItemSelectedListener = new IcsAdapterView.OnItemSelectedListener() {

        final ActionBarView this$0;

        public void onItemSelected(IcsAdapterView icsadapterview, View view, int l, long l1)
        {
            if (mCallback != null)
            {
                mCallback.onNavigationItemSelected(l, l1);
            }
        }

        public void onNothingSelected(IcsAdapterView icsadapterview)
        {
        }

            
            {
                this$0 = ActionBarView.this;
                super();
            }
    };
    private int mNavigationMode;
    private MenuBuilder mOptionsMenu;
    private int mProgressBarPadding;
    private int mProgressStyle;
    private IcsProgressBar mProgressView;
    private IcsSpinner mSpinner;
    private SpinnerAdapter mSpinnerAdapter;
    private CharSequence mSubtitle;
    private int mSubtitleStyleRes;
    private TextView mSubtitleView;
    private ScrollingTabContainerView mTabScrollView;
    private CharSequence mTitle;
    private LinearLayout mTitleLayout;
    private int mTitleStyleRes;
    private View mTitleUpView;
    private TextView mTitleView;
    private final android.view.View.OnClickListener mUpClickListener = new android.view.View.OnClickListener() {

        final ActionBarView this$0;

        public void onClick(View view)
        {
            mWindowCallback.onMenuItemSelected(0, mLogoNavItem);
        }

            
            {
                this$0 = ActionBarView.this;
                super();
            }
    };
    private boolean mUserTitle;
    com.actionbarsherlock.view.Window.Callback mWindowCallback;

    public ActionBarView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mDisplayOptions = -1;
        setBackgroundResource(0);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockActionBar, com.actionbarsherlock.R.attr.actionBarStyle, 0);
        ApplicationInfo applicationinfo = context.getApplicationInfo();
        PackageManager packagemanager = context.getPackageManager();
        mNavigationMode = typedarray.getInt(6, 0);
        mTitle = typedarray.getText(8);
        mSubtitle = typedarray.getText(9);
        mLogo = typedarray.getDrawable(11);
        if (mLogo == null)
        {
            if (android.os.Build.VERSION.SDK_INT < 11)
            {
                if (context instanceof Activity)
                {
                    int k = loadLogoFromManifest((Activity)context);
                    if (k != 0)
                    {
                        mLogo = context.getResources().getDrawable(k);
                    }
                }
            } else
            {
                if (context instanceof Activity)
                {
                    try
                    {
                        mLogo = packagemanager.getActivityLogo(((Activity)context).getComponentName());
                    }
                    catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1)
                    {
                        Log.e("ActionBarView", "Activity component name not found!", namenotfoundexception1);
                    }
                }
                if (mLogo == null)
                {
                    mLogo = applicationinfo.loadLogo(packagemanager);
                }
            }
        }
        mIcon = typedarray.getDrawable(10);
        if (mIcon == null)
        {
            LayoutInflater layoutinflater;
            int i;
            int j;
            if (context instanceof Activity)
            {
                try
                {
                    mIcon = packagemanager.getActivityIcon(((Activity)context).getComponentName());
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                {
                    Log.e("ActionBarView", "Activity component name not found!", namenotfoundexception);
                }
            }
            if (mIcon == null)
            {
                mIcon = applicationinfo.loadIcon(packagemanager);
            }
        }
        layoutinflater = LayoutInflater.from(context);
        i = typedarray.getResourceId(14, com.actionbarsherlock.R.layout.abs__action_bar_home);
        mHomeLayout = (HomeView)layoutinflater.inflate(i, this, false);
        mExpandedHomeLayout = (HomeView)layoutinflater.inflate(i, this, false);
        mExpandedHomeLayout.setUp(true);
        mExpandedHomeLayout.setOnClickListener(mExpandedActionViewUpListener);
        mExpandedHomeLayout.setContentDescription(getResources().getText(com.actionbarsherlock.R.string.abs__action_bar_up_description));
        mTitleStyleRes = typedarray.getResourceId(0, 0);
        mSubtitleStyleRes = typedarray.getResourceId(1, 0);
        mProgressStyle = typedarray.getResourceId(15, 0);
        mIndeterminateProgressStyle = typedarray.getResourceId(16, 0);
        mProgressBarPadding = typedarray.getDimensionPixelOffset(17, 0);
        mItemPadding = typedarray.getDimensionPixelOffset(18, 0);
        setDisplayOptions(typedarray.getInt(7, 0));
        j = typedarray.getResourceId(13, 0);
        if (j != 0)
        {
            mCustomNavView = layoutinflater.inflate(j, this, false);
            mNavigationMode = 0;
            setDisplayOptions(0x10 | mDisplayOptions);
        }
        mContentHeight = typedarray.getLayoutDimension(4, 0);
        typedarray.recycle();
        mLogoNavItem = new ActionMenuItem(context, 0, 0x102002c, 0, 0, mTitle);
        mHomeLayout.setOnClickListener(mUpClickListener);
        mHomeLayout.setClickable(true);
        mHomeLayout.setFocusable(true);
    }

    private void configPresenters(MenuBuilder menubuilder)
    {
        if (menubuilder != null)
        {
            menubuilder.addMenuPresenter(mActionMenuPresenter);
            menubuilder.addMenuPresenter(mExpandedMenuPresenter);
            return;
        } else
        {
            mActionMenuPresenter.initForMenu(mContext, null);
            mExpandedMenuPresenter.initForMenu(mContext, null);
            mActionMenuPresenter.updateMenuView(true);
            mExpandedMenuPresenter.updateMenuView(true);
            return;
        }
    }

    private void initTitle()
    {
        boolean flag = true;
        if (mTitleLayout == null)
        {
            mTitleLayout = (LinearLayout)LayoutInflater.from(getContext()).inflate(com.actionbarsherlock.R.layout.abs__action_bar_title_item, this, false);
            mTitleView = (TextView)mTitleLayout.findViewById(com.actionbarsherlock.R.id.abs__action_bar_title);
            mSubtitleView = (TextView)mTitleLayout.findViewById(com.actionbarsherlock.R.id.abs__action_bar_subtitle);
            mTitleUpView = mTitleLayout.findViewById(com.actionbarsherlock.R.id.abs__up);
            mTitleLayout.setOnClickListener(mUpClickListener);
            if (mTitleStyleRes != 0)
            {
                mTitleView.setTextAppearance(mContext, mTitleStyleRes);
            }
            if (mTitle != null)
            {
                mTitleView.setText(mTitle);
            }
            if (mSubtitleStyleRes != 0)
            {
                mSubtitleView.setTextAppearance(mContext, mSubtitleStyleRes);
            }
            if (mSubtitle != null)
            {
                mSubtitleView.setText(mSubtitle);
                mSubtitleView.setVisibility(0);
            }
            boolean flag1;
            boolean flag2;
            View view;
            int i;
            LinearLayout linearlayout;
            if ((4 & mDisplayOptions) != 0)
            {
                flag1 = flag;
            } else
            {
                flag1 = false;
            }
            if ((2 & mDisplayOptions) != 0)
            {
                flag2 = flag;
            } else
            {
                flag2 = false;
            }
            view = mTitleUpView;
            if (!flag2)
            {
                if (flag1)
                {
                    i = 0;
                } else
                {
                    i = 4;
                }
            } else
            {
                i = 8;
            }
            view.setVisibility(i);
            linearlayout = mTitleLayout;
            if (!flag1 || flag2)
            {
                flag = false;
            }
            linearlayout.setEnabled(flag);
        }
        addView(mTitleLayout);
        if (mExpandedActionView != null || TextUtils.isEmpty(mTitle) && TextUtils.isEmpty(mSubtitle))
        {
            mTitleLayout.setVisibility(8);
        }
    }

    private static int loadLogoFromManifest(Activity activity)
    {
        int i = 0;
        String s;
        String s1;
        XmlResourceParser xmlresourceparser;
        int j;
        s = activity.getClass().getName();
        s1 = activity.getApplicationInfo().packageName;
        xmlresourceparser = activity.createPackageContext(s1, 0).getAssets().openXmlResourceParser("AndroidManifest.xml");
        j = xmlresourceparser.getEventType();
        i = 0;
          goto _L1
_L13:
        if (j != 2) goto _L3; else goto _L2
_L2:
        String s2 = xmlresourceparser.getName();
        if (!"application".equals(s2)) goto _L5; else goto _L4
_L4:
        int l = -1 + xmlresourceparser.getAttributeCount();
          goto _L6
_L3:
        j = xmlresourceparser.nextToken();
        continue; /* Loop/switch isn't completed */
_L5:
        int k;
        if (!"activity".equals(s2))
        {
            break; /* Loop/switch isn't completed */
        }
        k = -1 + xmlresourceparser.getAttributeCount();
        boolean flag;
        integer = null;
        s3 = null;
        flag = false;
          goto _L7
_L16:
        s4 = xmlresourceparser.getAttributeName(k);
        if (!"logo".equals(s4)) goto _L9; else goto _L8
_L8:
        integer = Integer.valueOf(xmlresourceparser.getAttributeResourceValue(k, 0));
          goto _L10
_L9:
        if (!"name".equals(s4))
        {
            continue; /* Loop/switch isn't completed */
        }
        s3 = ActionBarSherlockCompat.cleanActivityName(s1, xmlresourceparser.getAttributeValue(k));
        flag1 = s.equals(s3);
        if (!flag1)
        {
            break; /* Loop/switch isn't completed */
        }
        flag = true;
        if (true) goto _L10; else goto _L11
_L10:
        if (integer == null || s3 == null)
        {
            break; /* Loop/switch isn't completed */
        }
        boolean flag1;
        try
        {
            i = integer.intValue();
            break; /* Loop/switch isn't completed */
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
        return i;
_L1:
        if (j != 1) goto _L13; else goto _L12
_L12:
        return i;
_L6:
        if (l >= 0) goto _L14; else goto _L3
_L14:
        Integer integer;
        String s3;
        String s4;
        if ("logo".equals(xmlresourceparser.getAttributeName(l)))
        {
            i = xmlresourceparser.getAttributeResourceValue(l, 0);
            break; /* Loop/switch isn't completed */
        }
        l--;
          goto _L6
_L7:
        if (k >= 0) goto _L16; else goto _L15
_L15:
        if (!flag) goto _L3; else goto _L17
_L17:
        return i;
_L11:
        k--;
          goto _L7
    }

    private void setTitleImpl(CharSequence charsequence)
    {
        mTitle = charsequence;
        if (mTitleView != null)
        {
            mTitleView.setText(charsequence);
            boolean flag;
            LinearLayout linearlayout;
            int i;
            if (mExpandedActionView == null && (8 & mDisplayOptions) != 0 && (!TextUtils.isEmpty(mTitle) || !TextUtils.isEmpty(mSubtitle)))
            {
                flag = true;
            } else
            {
                flag = false;
            }
            linearlayout = mTitleLayout;
            i = 0;
            if (!flag)
            {
                i = 8;
            }
            linearlayout.setVisibility(i);
        }
        if (mLogoNavItem != null)
        {
            mLogoNavItem.setTitle(charsequence);
        }
    }

    public void collapseActionView()
    {
        MenuItemImpl menuitemimpl;
        if (mExpandedMenuPresenter == null)
        {
            menuitemimpl = null;
        } else
        {
            menuitemimpl = mExpandedMenuPresenter.mCurrentExpandedItem;
        }
        if (menuitemimpl != null)
        {
            menuitemimpl.collapseActionView();
        }
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new com.actionbarsherlock.app.ActionBar.LayoutParams(19);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new com.actionbarsherlock.app.ActionBar.LayoutParams(getContext(), attributeset);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams == null)
        {
            layoutparams = generateDefaultLayoutParams();
        }
        return layoutparams;
    }

    public View getCustomNavigationView()
    {
        return mCustomNavView;
    }

    public int getDisplayOptions()
    {
        return mDisplayOptions;
    }

    public SpinnerAdapter getDropdownAdapter()
    {
        return mSpinnerAdapter;
    }

    public int getDropdownSelectedPosition()
    {
        return mSpinner.getSelectedItemPosition();
    }

    public int getNavigationMode()
    {
        return mNavigationMode;
    }

    public CharSequence getSubtitle()
    {
        return mSubtitle;
    }

    public CharSequence getTitle()
    {
        return mTitle;
    }

    public boolean hasEmbeddedTabs()
    {
        return mIncludeTabs;
    }

    public boolean hasExpandedActionView()
    {
        return mExpandedMenuPresenter != null && mExpandedMenuPresenter.mCurrentExpandedItem != null;
    }

    public void initIndeterminateProgress()
    {
        mIndeterminateProgressView = new IcsProgressBar(mContext, null, 0, mIndeterminateProgressStyle);
        mIndeterminateProgressView.setId(com.actionbarsherlock.R.id.abs__progress_circular);
        addView(mIndeterminateProgressView);
    }

    public void initProgress()
    {
        mProgressView = new IcsProgressBar(mContext, null, 0, mProgressStyle);
        mProgressView.setId(com.actionbarsherlock.R.id.abs__progress_horizontal);
        mProgressView.setMax(10000);
        addView(mProgressView);
    }

    public boolean isCollapsed()
    {
        return mIsCollapsed;
    }

    public boolean isSplitActionBar()
    {
        return mSplitActionBar;
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        mTitleView = null;
        mSubtitleView = null;
        mTitleUpView = null;
        if (mTitleLayout != null && mTitleLayout.getParent() == this)
        {
            removeView(mTitleLayout);
        }
        mTitleLayout = null;
        if ((8 & mDisplayOptions) != 0)
        {
            initTitle();
        }
        if (mTabScrollView != null && mIncludeTabs)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mTabScrollView.getLayoutParams();
            if (layoutparams != null)
            {
                layoutparams.width = -2;
                layoutparams.height = -1;
            }
            mTabScrollView.setAllowCollapse(true);
        }
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mActionMenuPresenter != null)
        {
            mActionMenuPresenter.hideOverflowMenu();
            mActionMenuPresenter.hideSubMenus();
        }
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        addView(mHomeLayout);
        if (mCustomNavView != null && (0x10 & mDisplayOptions) != 0)
        {
            android.view.ViewParent viewparent = mCustomNavView.getParent();
            if (viewparent != this)
            {
                if (viewparent instanceof ViewGroup)
                {
                    ((ViewGroup)viewparent).removeView(mCustomNavView);
                }
                addView(mCustomNavView);
            }
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1;
        int j1;
        int k1;
        i1 = getPaddingLeft();
        j1 = getPaddingTop();
        k1 = l - j - getPaddingTop() - getPaddingBottom();
        if (k1 > 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int l1;
        View view;
        int l2;
        int i3;
        int j3;
        int l3;
        int j4;
        boolean flag1;
        HomeView homeview;
        int j2;
        android.view.ViewGroup.LayoutParams layoutparams;
        int i4;
        int k4;
        int l4;
        int i5;
        if (mExpandedActionView != null)
        {
            homeview = mExpandedHomeLayout;
        } else
        {
            homeview = mHomeLayout;
        }
        if (homeview.getVisibility() != 8)
        {
            int l5 = homeview.getLeftOffset();
            i1 += l5 + positionChild(homeview, i1 + l5, j1, k1);
        }
        if (mExpandedActionView != null) goto _L4; else goto _L3
_L3:
        if (mTitleLayout != null && mTitleLayout.getVisibility() != 8 && (8 & mDisplayOptions) != 0)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        if (flag1)
        {
            i1 += positionChild(mTitleLayout, i1, j1, k1);
        }
        mNavigationMode;
        JVM INSTR tableswitch 0 2: default 180
    //                   0 180
    //                   1 632
    //                   2 680;
           goto _L4 _L4 _L5 _L6
_L4:
        l1 = k - i - getPaddingRight();
        if (mMenuView != null && mMenuView.getParent() == this)
        {
            positionChildInverse(mMenuView, l1, j1, k1);
            l1 -= mMenuView.getMeasuredWidth();
        }
        if (mIndeterminateProgressView != null && mIndeterminateProgressView.getVisibility() != 8)
        {
            positionChildInverse(mIndeterminateProgressView, l1, j1, k1);
            l1 -= mIndeterminateProgressView.getMeasuredWidth();
        }
        com.actionbarsherlock.app.ActionBar.LayoutParams layoutparams1;
        int k2;
        int k3;
        if (mExpandedActionView != null)
        {
            view = mExpandedActionView;
        } else
        {
            int i2 = 0x10 & mDisplayOptions;
            view = null;
            if (i2 != 0)
            {
                View view1 = mCustomNavView;
                view = null;
                if (view1 != null)
                {
                    view = mCustomNavView;
                }
            }
        }
        if (view == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        layoutparams = view.getLayoutParams();
        if (layoutparams instanceof com.actionbarsherlock.app.ActionBar.LayoutParams)
        {
            layoutparams1 = (com.actionbarsherlock.app.ActionBar.LayoutParams)layoutparams;
        } else
        {
            layoutparams1 = null;
        }
        if (layoutparams1 != null)
        {
            k2 = layoutparams1.gravity;
        } else
        {
            k2 = 19;
        }
        l2 = view.getMeasuredWidth();
        i3 = 0;
        j3 = 0;
        if (layoutparams1 != null)
        {
            i1 += layoutparams1.leftMargin;
            l1 -= layoutparams1.rightMargin;
            j3 = layoutparams1.topMargin;
            i3 = layoutparams1.bottomMargin;
        }
        k3 = k2 & 7;
        if (k3 == 1)
        {
            int k5 = (getRight() - getLeft() - l2) / 2;
            if (k5 < i1)
            {
                k3 = 3;
            } else
            if (k5 + l2 > l1)
            {
                k3 = 5;
            }
        } else
        if (k2 == -1)
        {
            k3 = 3;
        }
        l3 = 0;
        k3;
        JVM INSTR tableswitch 1 5: default 464
    //                   1 809
    //                   2 464
    //                   3 828
    //                   4 464
    //                   5 835;
           goto _L7 _L8 _L7 _L9 _L7 _L10
_L7:
        i4 = k2 & 0x70;
        if (k2 == -1)
        {
            i4 = 16;
        }
        j4 = 0;
        i4;
        JVM INSTR lookupswitch 3: default 520
    //                   16: 845
    //                   48: 881
    //                   80: 893;
           goto _L11 _L12 _L13 _L14
_L11:
        break; /* Loop/switch isn't completed */
_L14:
        break MISSING_BLOCK_LABEL_893;
_L16:
        k4 = view.getMeasuredWidth();
        l4 = l3 + k4;
        i5 = j4 + view.getMeasuredHeight();
        view.layout(l3, j4, l4, i5);
        i1 + k4;
        if (mProgressView == null) goto _L1; else goto _L15
_L15:
        mProgressView.bringToFront();
        j2 = mProgressView.getMeasuredHeight() / 2;
        mProgressView.layout(mProgressBarPadding, -j2, mProgressBarPadding + mProgressView.getMeasuredWidth(), j2);
        return;
_L5:
        if (mListNavLayout != null)
        {
            if (flag1)
            {
                i1 += mItemPadding;
            }
            i1 += positionChild(mListNavLayout, i1, j1, k1) + mItemPadding;
        }
          goto _L4
_L6:
        if (mTabScrollView != null)
        {
            if (flag1)
            {
                i1 += mItemPadding;
            }
            i1 += positionChild(mTabScrollView, i1, j1, k1) + mItemPadding;
        }
          goto _L4
_L8:
        l3 = (getRight() - getLeft() - l2) / 2;
          goto _L7
_L9:
        l3 = i1;
          goto _L7
_L10:
        l3 = l1 - l2;
          goto _L7
_L12:
        int j5 = getPaddingTop();
        j4 = (getBottom() - getTop() - getPaddingBottom() - j5 - view.getMeasuredHeight()) / 2;
          goto _L16
_L13:
        j4 = j3 + getPaddingTop();
          goto _L16
        j4 = getHeight() - getPaddingBottom() - view.getMeasuredHeight() - i3;
          goto _L16
    }

    protected void onMeasure(int i, int j)
    {
        int k = getChildCount();
        if (!mIsCollapsable) goto _L2; else goto _L1
_L1:
        int i9;
        int j9;
        i9 = 0;
        j9 = 0;
_L6:
        if (j9 < k) goto _L4; else goto _L3
_L3:
        if (i9 != 0) goto _L2; else goto _L5
_L5:
        setMeasuredDimension(0, 0);
        mIsCollapsed = true;
_L13:
        return;
_L4:
        View view2 = getChildAt(j9);
        if (view2.getVisibility() != 8 && (view2 != mMenuView || mMenuView.getChildCount() != 0))
        {
            i9++;
        }
        j9++;
          goto _L6
_L2:
        int l;
        int i1;
        int j1;
        int i2;
        int k2;
        int l2;
        boolean flag;
        int k3;
        int l3;
        mIsCollapsed = false;
        if (android.view.View.MeasureSpec.getMode(i) != 0x40000000)
        {
            throw new IllegalStateException((new StringBuilder(String.valueOf(getClass().getSimpleName()))).append(" can only be used ").append("with android:layout_width=\"match_parent\" (or fill_parent)").toString());
        }
        if (android.view.View.MeasureSpec.getMode(j) != 0x80000000)
        {
            throw new IllegalStateException((new StringBuilder(String.valueOf(getClass().getSimpleName()))).append(" can only be used ").append("with android:layout_height=\"wrap_content\"").toString());
        }
        l = android.view.View.MeasureSpec.getSize(i);
        int k1;
        int l1;
        int j2;
        int i3;
        HomeView homeview;
        if (mContentHeight > 0)
        {
            i1 = mContentHeight;
        } else
        {
            i1 = android.view.View.MeasureSpec.getSize(j);
        }
        j1 = getPaddingTop() + getPaddingBottom();
        k1 = getPaddingLeft();
        l1 = getPaddingRight();
        i2 = i1 - j1;
        j2 = android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x80000000);
        k2 = l - k1 - l1;
        l2 = k2 / 2;
        i3 = l2;
        if (mExpandedActionView != null)
        {
            homeview = mExpandedHomeLayout;
        } else
        {
            homeview = mHomeLayout;
        }
        if (homeview.getVisibility() != 8)
        {
            android.view.ViewGroup.LayoutParams layoutparams2 = homeview.getLayoutParams();
            int j4;
            int k4;
            int i5;
            int l5;
            int j8;
            int k8;
            int l8;
            if (layoutparams2.width < 0)
            {
                j8 = android.view.View.MeasureSpec.makeMeasureSpec(k2, 0x80000000);
            } else
            {
                j8 = android.view.View.MeasureSpec.makeMeasureSpec(layoutparams2.width, 0x40000000);
            }
            k8 = android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x40000000);
            homeview.measure(j8, k8);
            l8 = homeview.getMeasuredWidth() + homeview.getLeftOffset();
            k2 = Math.max(0, k2 - l8);
            l2 = Math.max(0, k2 - l8);
        }
        if (mMenuView != null && mMenuView.getParent() == this)
        {
            k2 = measureChildView(mMenuView, k2, j2, 0);
            i3 = Math.max(0, i3 - mMenuView.getMeasuredWidth());
        }
        if (mIndeterminateProgressView != null && mIndeterminateProgressView.getVisibility() != 8)
        {
            k2 = measureChildView(mIndeterminateProgressView, k2, j2, 0);
            i3 = Math.max(0, i3 - mIndeterminateProgressView.getMeasuredWidth());
        }
        if (mTitleLayout != null && mTitleLayout.getVisibility() != 8 && (8 & mDisplayOptions) != 0)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (mExpandedActionView != null) goto _L8; else goto _L7
_L7:
        mNavigationMode;
        JVM INSTR tableswitch 1 2: default 536
    //                   1 965
    //                   2 1073;
           goto _L8 _L9 _L10
_L8:
        View view;
        if (mExpandedActionView != null)
        {
            view = mExpandedActionView;
        } else
        {
            int j3 = 0x10 & mDisplayOptions;
            view = null;
            if (j3 != 0)
            {
                View view1 = mCustomNavView;
                view = null;
                if (view1 != null)
                {
                    view = mCustomNavView;
                }
            }
        }
        if (view != null)
        {
            android.view.ViewGroup.LayoutParams layoutparams = generateLayoutParams(view.getLayoutParams());
            com.actionbarsherlock.app.ActionBar.LayoutParams layoutparams1;
            int l4;
            int j5;
            int k5;
            int i6;
            int j6;
            int k6;
            int l6;
            int i7;
            int j7;
            int k7;
            int l7;
            int i8;
            if (layoutparams instanceof com.actionbarsherlock.app.ActionBar.LayoutParams)
            {
                layoutparams1 = (com.actionbarsherlock.app.ActionBar.LayoutParams)layoutparams;
            } else
            {
                layoutparams1 = null;
            }
            j4 = 0;
            k4 = 0;
            if (layoutparams1 != null)
            {
                j4 = layoutparams1.leftMargin + layoutparams1.rightMargin;
                k4 = layoutparams1.topMargin + layoutparams1.bottomMargin;
            }
            if (mContentHeight <= 0)
            {
                l4 = 0x80000000;
            } else
            if (layoutparams.height != -2)
            {
                l4 = 0x40000000;
            } else
            {
                l4 = 0x80000000;
            }
            if (layoutparams.height >= 0)
            {
                i2 = Math.min(layoutparams.height, i2);
            }
            i5 = Math.max(0, i2 - k4);
            if (layoutparams.width != -2)
            {
                j5 = 0x40000000;
            } else
            {
                j5 = 0x80000000;
            }
            if (layoutparams.width >= 0)
            {
                k5 = Math.min(layoutparams.width, k2);
            } else
            {
                k5 = k2;
            }
            l5 = Math.max(0, k5 - j4);
            if (layoutparams1 != null)
            {
                i6 = layoutparams1.gravity;
            } else
            {
                i6 = 19;
            }
            if ((i6 & 7) == 1 && layoutparams.width == -1)
            {
                l5 = 2 * Math.min(l2, i3);
            }
            view.measure(android.view.View.MeasureSpec.makeMeasureSpec(l5, j5), android.view.View.MeasureSpec.makeMeasureSpec(i5, l4));
            k2 -= j4 + view.getMeasuredWidth();
        }
        if (mExpandedActionView == null && flag)
        {
            measureChildView(mTitleLayout, k2, android.view.View.MeasureSpec.makeMeasureSpec(mContentHeight, 0x40000000), 0);
            Math.max(0, l2 - mTitleLayout.getMeasuredWidth());
        }
        if (mContentHeight > 0)
        {
            break MISSING_BLOCK_LABEL_1306;
        }
        k3 = 0;
        l3 = 0;
_L14:
        if (l3 < k) goto _L12; else goto _L11
_L11:
        setMeasuredDimension(l, k3);
_L15:
        if (mContextView != null)
        {
            mContextView.setContentHeight(getMeasuredHeight());
        }
        if (mProgressView != null && mProgressView.getVisibility() != 8)
        {
            mProgressView.measure(android.view.View.MeasureSpec.makeMeasureSpec(l - 2 * mProgressBarPadding, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0x80000000));
            return;
        }
          goto _L13
_L9:
        if (mListNavLayout != null)
        {
            if (flag)
            {
                j7 = 2 * mItemPadding;
            } else
            {
                j7 = mItemPadding;
            }
            k7 = Math.max(0, k2 - j7);
            l7 = Math.max(0, l2 - j7);
            mListNavLayout.measure(android.view.View.MeasureSpec.makeMeasureSpec(k7, 0x80000000), android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x40000000));
            i8 = mListNavLayout.getMeasuredWidth();
            k2 = Math.max(0, k7 - i8);
            l2 = Math.max(0, l7 - i8);
        }
          goto _L8
_L10:
        if (mTabScrollView != null)
        {
            if (flag)
            {
                j6 = 2 * mItemPadding;
            } else
            {
                j6 = mItemPadding;
            }
            k6 = Math.max(0, k2 - j6);
            l6 = Math.max(0, l2 - j6);
            mTabScrollView.measure(android.view.View.MeasureSpec.makeMeasureSpec(k6, 0x80000000), android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x40000000));
            i7 = mTabScrollView.getMeasuredWidth();
            k2 = Math.max(0, k6 - i7);
            l2 = Math.max(0, l6 - i7);
        }
          goto _L8
_L12:
        int i4 = j1 + getChildAt(l3).getMeasuredHeight();
        if (i4 > k3)
        {
            k3 = i4;
        }
        l3++;
          goto _L14
        setMeasuredDimension(l, i1);
          goto _L15
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        if (savedstate.expandedMenuItemId != 0 && mExpandedMenuPresenter != null && mOptionsMenu != null)
        {
            MenuItem menuitem = mOptionsMenu.findItem(savedstate.expandedMenuItemId);
            if (menuitem != null)
            {
                menuitem.expandActionView();
            }
        }
        if (savedstate.isOverflowOpen)
        {
            postShowOverflowMenu();
        }
    }

    public Parcelable onSaveInstanceState()
    {
        SavedState savedstate = new SavedState(super.onSaveInstanceState());
        if (mExpandedMenuPresenter != null && mExpandedMenuPresenter.mCurrentExpandedItem != null)
        {
            savedstate.expandedMenuItemId = mExpandedMenuPresenter.mCurrentExpandedItem.getItemId();
        }
        savedstate.isOverflowOpen = isOverflowMenuShowing();
        return savedstate;
    }

    public void setCallback(com.actionbarsherlock.app.ActionBar.OnNavigationListener onnavigationlistener)
    {
        mCallback = onnavigationlistener;
    }

    public void setCollapsable(boolean flag)
    {
        mIsCollapsable = flag;
    }

    public void setContextView(ActionBarContextView actionbarcontextview)
    {
        mContextView = actionbarcontextview;
    }

    public void setCustomNavigationView(View view)
    {
        boolean flag;
        if ((0x10 & mDisplayOptions) != 0)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (mCustomNavView != null && flag)
        {
            removeView(mCustomNavView);
        }
        mCustomNavView = view;
        if (mCustomNavView != null && flag)
        {
            addView(mCustomNavView);
        }
    }

    public void setDisplayOptions(int i)
    {
        byte byte0 = 8;
        int j = -1;
        boolean flag = true;
        if (mDisplayOptions != j)
        {
            j = i ^ mDisplayOptions;
        }
        mDisplayOptions = i;
        if ((j & 0x1f) != 0)
        {
            boolean flag1;
            int k;
            if ((i & 2) != 0)
            {
                flag1 = flag;
            } else
            {
                flag1 = false;
            }
            if (flag1 && mExpandedActionView == null)
            {
                k = 0;
            } else
            {
                k = byte0;
            }
            mHomeLayout.setVisibility(k);
            if ((j & 4) != 0)
            {
                View view;
                LinearLayout linearlayout;
                HomeView homeview;
                boolean flag4;
                if ((i & 4) != 0)
                {
                    flag4 = flag;
                } else
                {
                    flag4 = false;
                }
                mHomeLayout.setUp(flag4);
                if (flag4)
                {
                    setHomeButtonEnabled(flag);
                }
            }
            if ((j & 1) != 0)
            {
                boolean flag3;
                Drawable drawable;
                if (mLogo != null && (i & 1) != 0)
                {
                    flag3 = flag;
                } else
                {
                    flag3 = false;
                }
                homeview = mHomeLayout;
                if (flag3)
                {
                    drawable = mLogo;
                } else
                {
                    drawable = mIcon;
                }
                homeview.setIcon(drawable);
            }
            if ((j & 8) != 0)
            {
                if ((i & 8) != 0)
                {
                    initTitle();
                } else
                {
                    removeView(mTitleLayout);
                }
            }
            if (mTitleLayout != null && (j & 6) != 0)
            {
                boolean flag2;
                if ((4 & mDisplayOptions) != 0)
                {
                    flag2 = flag;
                } else
                {
                    flag2 = false;
                }
                view = mTitleUpView;
                if (!flag1)
                {
                    if (flag2)
                    {
                        byte0 = 0;
                    } else
                    {
                        byte0 = 4;
                    }
                }
                view.setVisibility(byte0);
                linearlayout = mTitleLayout;
                if (flag1 || !flag2)
                {
                    flag = false;
                }
                linearlayout.setEnabled(flag);
            }
            if ((j & 0x10) != 0 && mCustomNavView != null)
            {
                if ((i & 0x10) != 0)
                {
                    addView(mCustomNavView);
                } else
                {
                    removeView(mCustomNavView);
                }
            }
            requestLayout();
        } else
        {
            invalidate();
        }
        if (!mHomeLayout.isEnabled())
        {
            mHomeLayout.setContentDescription(null);
            return;
        }
        if ((i & 4) != 0)
        {
            mHomeLayout.setContentDescription(mContext.getResources().getText(com.actionbarsherlock.R.string.abs__action_bar_up_description));
            return;
        } else
        {
            mHomeLayout.setContentDescription(mContext.getResources().getText(com.actionbarsherlock.R.string.abs__action_bar_home_description));
            return;
        }
    }

    public void setDropdownAdapter(SpinnerAdapter spinneradapter)
    {
        mSpinnerAdapter = spinneradapter;
        if (mSpinner != null)
        {
            mSpinner.setAdapter(spinneradapter);
        }
    }

    public void setDropdownSelectedPosition(int i)
    {
        mSpinner.setSelection(i);
    }

    public void setEmbeddedTabView(ScrollingTabContainerView scrollingtabcontainerview)
    {
        if (mTabScrollView != null)
        {
            removeView(mTabScrollView);
        }
        mTabScrollView = scrollingtabcontainerview;
        boolean flag;
        if (scrollingtabcontainerview != null)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        mIncludeTabs = flag;
        if (mIncludeTabs && mNavigationMode == 2)
        {
            addView(mTabScrollView);
            android.view.ViewGroup.LayoutParams layoutparams = mTabScrollView.getLayoutParams();
            layoutparams.width = -2;
            layoutparams.height = -1;
            scrollingtabcontainerview.setAllowCollapse(true);
        }
    }

    public void setHomeButtonEnabled(boolean flag)
    {
        mHomeLayout.setEnabled(flag);
        mHomeLayout.setFocusable(flag);
        if (!flag)
        {
            mHomeLayout.setContentDescription(null);
            return;
        }
        if ((4 & mDisplayOptions) != 0)
        {
            mHomeLayout.setContentDescription(mContext.getResources().getText(com.actionbarsherlock.R.string.abs__action_bar_up_description));
            return;
        } else
        {
            mHomeLayout.setContentDescription(mContext.getResources().getText(com.actionbarsherlock.R.string.abs__action_bar_home_description));
            return;
        }
    }

    public void setIcon(int i)
    {
        setIcon(mContext.getResources().getDrawable(i));
    }

    public void setIcon(Drawable drawable)
    {
        mIcon = drawable;
        if (drawable != null && ((1 & mDisplayOptions) == 0 || mLogo == null))
        {
            mHomeLayout.setIcon(drawable);
        }
    }

    public void setLogo(int i)
    {
        setLogo(mContext.getResources().getDrawable(i));
    }

    public void setLogo(Drawable drawable)
    {
        mLogo = drawable;
        if (drawable != null && (1 & mDisplayOptions) != 0)
        {
            mHomeLayout.setIcon(drawable);
        }
    }

    public void setMenu(Menu menu, com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback callback)
    {
        if (menu == mOptionsMenu)
        {
            return;
        }
        if (mOptionsMenu != null)
        {
            mOptionsMenu.removeMenuPresenter(mActionMenuPresenter);
            mOptionsMenu.removeMenuPresenter(mExpandedMenuPresenter);
        }
        MenuBuilder menubuilder = (MenuBuilder)menu;
        mOptionsMenu = menubuilder;
        if (mMenuView != null)
        {
            ViewGroup viewgroup2 = (ViewGroup)mMenuView.getParent();
            if (viewgroup2 != null)
            {
                viewgroup2.removeView(mMenuView);
            }
        }
        if (mActionMenuPresenter == null)
        {
            mActionMenuPresenter = new ActionMenuPresenter(mContext);
            mActionMenuPresenter.setCallback(callback);
            mActionMenuPresenter.setId(com.actionbarsherlock.R.id.abs__action_menu_presenter);
            mExpandedMenuPresenter = new ExpandedActionViewMenuPresenter(null);
        }
        android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -1);
        ActionMenuView actionmenuview;
        if (!mSplitActionBar)
        {
            mActionMenuPresenter.setExpandedActionViewsExclusive(ResourcesCompat.getResources_getBoolean(getContext(), com.actionbarsherlock.R.bool.abs__action_bar_expanded_action_views_exclusive));
            configPresenters(menubuilder);
            actionmenuview = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
            ViewGroup viewgroup1 = (ViewGroup)actionmenuview.getParent();
            if (viewgroup1 != null && viewgroup1 != this)
            {
                viewgroup1.removeView(actionmenuview);
            }
            addView(actionmenuview, layoutparams);
        } else
        {
            mActionMenuPresenter.setExpandedActionViewsExclusive(false);
            mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
            mActionMenuPresenter.setItemLimit(0x7fffffff);
            layoutparams.width = -1;
            configPresenters(menubuilder);
            actionmenuview = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
            if (mSplitView != null)
            {
                ViewGroup viewgroup = (ViewGroup)actionmenuview.getParent();
                if (viewgroup != null && viewgroup != mSplitView)
                {
                    viewgroup.removeView(actionmenuview);
                }
                actionmenuview.setVisibility(getAnimatedVisibility());
                mSplitView.addView(actionmenuview, layoutparams);
            } else
            {
                actionmenuview.setLayoutParams(layoutparams);
            }
        }
        mMenuView = actionmenuview;
    }

    public void setNavigationMode(int i)
    {
        int j = mNavigationMode;
        if (i == j) goto _L2; else goto _L1
_L1:
        j;
        JVM INSTR tableswitch 1 2: default 32
    //                   1 66
    //                   2 84;
           goto _L3 _L4 _L5
_L3:
        i;
        JVM INSTR tableswitch 1 2: default 56
    //                   1 109
    //                   2 232;
           goto _L6 _L7 _L8
_L6:
        mNavigationMode = i;
        requestLayout();
_L2:
        return;
_L4:
        if (mListNavLayout != null)
        {
            removeView(mListNavLayout);
        }
          goto _L3
_L5:
        if (mTabScrollView != null && mIncludeTabs)
        {
            removeView(mTabScrollView);
        }
          goto _L3
_L7:
        if (mSpinner == null)
        {
            mSpinner = new IcsSpinner(mContext, null, com.actionbarsherlock.R.attr.actionDropDownStyle);
            mListNavLayout = (IcsLinearLayout)LayoutInflater.from(mContext).inflate(com.actionbarsherlock.R.layout.abs__action_bar_tab_bar_view, null);
            android.widget.LinearLayout.LayoutParams layoutparams = new android.widget.LinearLayout.LayoutParams(-2, -1);
            layoutparams.gravity = 17;
            mListNavLayout.addView(mSpinner, layoutparams);
        }
        if (mSpinner.getAdapter() != mSpinnerAdapter)
        {
            mSpinner.setAdapter(mSpinnerAdapter);
        }
        mSpinner.setOnItemSelectedListener(mNavItemSelectedListener);
        addView(mListNavLayout);
          goto _L6
_L8:
        if (mTabScrollView != null && mIncludeTabs)
        {
            addView(mTabScrollView);
        }
          goto _L6
    }

    public void setSplitActionBar(boolean flag)
    {
        if (mSplitActionBar != flag)
        {
            if (mMenuView != null)
            {
                ViewGroup viewgroup = (ViewGroup)mMenuView.getParent();
                if (viewgroup != null)
                {
                    viewgroup.removeView(mMenuView);
                }
                ActionBarContainer actionbarcontainer;
                if (flag)
                {
                    if (mSplitView != null)
                    {
                        mSplitView.addView(mMenuView);
                    }
                } else
                {
                    addView(mMenuView);
                }
            }
            if (mSplitView != null)
            {
                actionbarcontainer = mSplitView;
                int i;
                if (flag)
                {
                    i = 0;
                } else
                {
                    i = 8;
                }
                actionbarcontainer.setVisibility(i);
            }
            super.setSplitActionBar(flag);
        }
    }

    public void setSubtitle(CharSequence charsequence)
    {
        mSubtitle = charsequence;
        if (mSubtitleView != null)
        {
            mSubtitleView.setText(charsequence);
            TextView textview = mSubtitleView;
            int i;
            boolean flag;
            LinearLayout linearlayout;
            int j;
            if (charsequence != null)
            {
                i = 0;
            } else
            {
                i = 8;
            }
            textview.setVisibility(i);
            if (mExpandedActionView == null && (8 & mDisplayOptions) != 0 && (!TextUtils.isEmpty(mTitle) || !TextUtils.isEmpty(mSubtitle)))
            {
                flag = true;
            } else
            {
                flag = false;
            }
            linearlayout = mTitleLayout;
            j = 0;
            if (!flag)
            {
                j = 8;
            }
            linearlayout.setVisibility(j);
        }
    }

    public void setTitle(CharSequence charsequence)
    {
        mUserTitle = true;
        setTitleImpl(charsequence);
    }

    public void setWindowCallback(com.actionbarsherlock.view.Window.Callback callback)
    {
        mWindowCallback = callback;
    }

    public void setWindowTitle(CharSequence charsequence)
    {
        if (!mUserTitle)
        {
            setTitleImpl(charsequence);
        }
    }

    public boolean shouldDelayChildPressedState()
    {
        return false;
    }













}
