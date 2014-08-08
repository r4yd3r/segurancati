// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.AndroidRuntimeException;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.Window;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.app.ActionBarImpl;
import com.actionbarsherlock.internal.view.StandaloneActionMode;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import com.actionbarsherlock.internal.widget.ActionBarContainer;
import com.actionbarsherlock.internal.widget.ActionBarContextView;
import com.actionbarsherlock.internal.widget.ActionBarView;
import com.actionbarsherlock.internal.widget.IcsProgressBar;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.Menu;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.actionbarsherlock.internal:
//            ResourcesCompat

public class ActionBarSherlockCompat extends ActionBarSherlock
    implements com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback, com.actionbarsherlock.view.Window.Callback, com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback, android.view.MenuItem.OnMenuItemClickListener
{

    protected static final int DEFAULT_FEATURES = 0;
    private static final String PANELS_TAG = "sherlock:Panels";
    private ActionBarImpl aActionBar;
    private ActionMode mActionMode;
    private ActionBarContextView mActionModeView;
    private IcsProgressBar mCircularProgressBar;
    private boolean mClosingActionMenu;
    private ViewGroup mContentParent;
    private ViewGroup mDecor;
    private int mFeatures;
    private IcsProgressBar mHorizontalProgressBar;
    private boolean mIsDestroyed;
    private boolean mIsFloating;
    private boolean mIsTitleReady;
    private MenuBuilder mMenu;
    private Bundle mMenuFrozenActionViewState;
    private boolean mMenuIsPrepared;
    private boolean mMenuRefreshContent;
    protected HashMap mNativeItemMap;
    private boolean mReserveOverflow;
    private boolean mReserveOverflowSet;
    private CharSequence mTitle;
    private TextView mTitleView;
    private int mUiOptions;
    private ActionBarView wActionBar;

    public ActionBarSherlockCompat(Activity activity, int i)
    {
        ActionBarSherlock(activity, i);
        mReserveOverflowSet = false;
        mIsTitleReady = false;
        mIsDestroyed = false;
        mFeatures = 0;
        mUiOptions = 0;
        mTitle = null;
    }

    public static String cleanActivityName(String s, String s1)
    {
        if (s1.charAt(0) == '.')
        {
            s1 = (new StringBuilder(String.valueOf(s))).append(s1).toString();
        } else
        if (s1.indexOf('.', 1) == -1)
        {
            return (new StringBuilder(String.valueOf(s))).append(".").append(s1).toString();
        }
        return s1;
    }

    private ViewGroup generateLayout()
    {
        TypedArray typedarray = mActivity.getTheme().obtainStyledAttributes(com.actionbarsherlock.R.styleable.SherlockTheme);
        mIsFloating = typedarray.getBoolean(0, false);
        if (!typedarray.hasValue(60))
        {
            throw new IllegalStateException("You must use Theme.Sherlock, Theme.Sherlock.Light, Theme.Sherlock.Light.DarkActionBar, or a derivative.");
        }
        View view;
        if (typedarray.getBoolean(59, false))
        {
            requestFeature(1);
            break MISSING_BLOCK_LABEL_59;
        } else
        {
            if (typedarray.getBoolean(60, false))
            {
                requestFeature(8);
            }
            continue;
        }
        do
        {
            if (typedarray.getBoolean(61, false))
            {
                requestFeature(9);
            }
            if (typedarray.getBoolean(62, false))
            {
                requestFeature(10);
            }
            typedarray.recycle();
            int i;
            ViewGroup viewgroup;
            if (!hasFeature(1))
            {
                if (mIsFloating)
                {
                    mDecor = (ViewGroup)mDecor.getParent();
                    mDecor.removeAllViews();
                    i = com.actionbarsherlock.R.layout.abs__dialog_title_holo;
                } else
                if (hasFeature(9))
                {
                    i = com.actionbarsherlock.R.layout.abs__screen_action_bar_overlay;
                } else
                {
                    i = com.actionbarsherlock.R.layout.abs__screen_action_bar;
                }
            } else
            if (hasFeature(10) && !hasFeature(1))
            {
                i = com.actionbarsherlock.R.layout.abs__screen_simple_overlay_action_mode;
            } else
            {
                i = com.actionbarsherlock.R.layout.abs__screen_simple;
            }
            view = mActivity.getLayoutInflater().inflate(i, null);
            mDecor.addView(view, new LayoutParams(-1, -1));
            viewgroup = (ViewGroup)mDecor.findViewById(com.actionbarsherlock.R.id.abs__content);
            if (viewgroup == null)
            {
                throw new RuntimeException("Couldn't find content container view");
            }
            mDecor.setId(-1);
            viewgroup.setId(0x1020002);
            if (hasFeature(5))
            {
                IcsProgressBar icsprogressbar = getCircularProgressBar(false);
                if (icsprogressbar != null)
                {
                    icsprogressbar.setIndeterminate(true);
                }
            }
            return viewgroup;
        } while (true);
    }

    private IcsProgressBar getCircularProgressBar(boolean flag)
    {
        if (mCircularProgressBar != null)
        {
            return mCircularProgressBar;
        }
        if (mContentParent == null && flag)
        {
            installDecor();
        }
        mCircularProgressBar = (IcsProgressBar)mDecor.findViewById(com.actionbarsherlock.R.id.abs__progress_circular);
        if (mCircularProgressBar != null)
        {
            mCircularProgressBar.setVisibility(4);
        }
        return mCircularProgressBar;
    }

    private int getFeatures()
    {
        return mFeatures;
    }

    private IcsProgressBar getHorizontalProgressBar(boolean flag)
    {
        if (mHorizontalProgressBar != null)
        {
            return mHorizontalProgressBar;
        }
        if (mContentParent == null && flag)
        {
            installDecor();
        }
        mHorizontalProgressBar = (IcsProgressBar)mDecor.findViewById(com.actionbarsherlock.R.id.abs__progress_horizontal);
        if (mHorizontalProgressBar != null)
        {
            mHorizontalProgressBar.setVisibility(4);
        }
        return mHorizontalProgressBar;
    }

    private void hideProgressBars(IcsProgressBar icsprogressbar, IcsProgressBar icsprogressbar1)
    {
        int i = mFeatures;
        Animation animation = AnimationUtils.loadAnimation(mActivity, 0x10a0001);
        animation.setDuration(1000L);
        if ((i & 0x20) != 0 && icsprogressbar1.getVisibility() == 0)
        {
            icsprogressbar1.startAnimation(animation);
            icsprogressbar1.setVisibility(4);
        }
        if ((i & 4) != 0 && icsprogressbar.getVisibility() == 0)
        {
            icsprogressbar.startAnimation(animation);
            icsprogressbar.setVisibility(4);
        }
    }

    private void initActionBar()
    {
        if (mDecor == null)
        {
            installDecor();
        }
        if (aActionBar == null && hasFeature(8) && !hasFeature(1) && !mActivity.isChild())
        {
            aActionBar = new ActionBarImpl(mActivity, mFeatures);
            if (!mIsDelegate)
            {
                wActionBar.setWindowTitle(mActivity.getTitle());
                return;
            }
        }
    }

    private boolean initializePanelMenu()
    {
        Object obj = mActivity;
        if (wActionBar != null)
        {
            TypedValue typedvalue = new TypedValue();
            ((Context) (obj)).getTheme().resolveAttribute(com.actionbarsherlock.R.attr.actionBarWidgetTheme, typedvalue, true);
            int i = typedvalue.resourceId;
            if (i != 0)
            {
                obj = new ContextThemeWrapper(((Context) (obj)), i);
            }
        }
        mMenu = new MenuBuilder(((Context) (obj)));
        mMenu.setCallback(this);
        return true;
    }

    private void installDecor()
    {
        boolean flag;
        flag = true;
        if (mDecor == null)
        {
            mDecor = (ViewGroup)mActivity.getWindow().getDecorView().findViewById(0x1020002);
        }
        if (mContentParent != null) goto _L2; else goto _L1
_L1:
        int i;
        ArrayList arraylist;
        i = mDecor.getChildCount();
        arraylist = null;
        if (i <= 0) goto _L4; else goto _L3
_L3:
        int j;
        int k;
        arraylist = new ArrayList(flag);
        j = 0;
        k = mDecor.getChildCount();
_L20:
        if (j < k) goto _L5; else goto _L4
_L4:
        mContentParent = generateLayout();
        if (arraylist == null) goto _L7; else goto _L6
_L6:
        Iterator iterator = arraylist.iterator();
_L13:
        if (iterator.hasNext()) goto _L8; else goto _L7
_L7:
        mTitleView = (TextView)mDecor.findViewById(0x1020016);
        if (mTitleView == null) goto _L10; else goto _L9
_L9:
        if (!hasFeature(flag)) goto _L12; else goto _L11
_L11:
        mTitleView.setVisibility(8);
        if (mContentParent instanceof FrameLayout)
        {
            ((FrameLayout)mContentParent).setForeground(null);
        }
_L2:
        return;
_L5:
        View view = mDecor.getChildAt(0);
        mDecor.removeView(view);
        arraylist.add(view);
        j++;
        continue; /* Loop/switch isn't completed */
_L8:
        View view1 = (View)iterator.next();
        mContentParent.addView(view1);
          goto _L13
_L12:
        mTitleView.setText(mTitle);
        return;
_L10:
        wActionBar = (ActionBarView)mDecor.findViewById(com.actionbarsherlock.R.id.abs__action_bar);
        if (wActionBar == null) goto _L2; else goto _L14
_L14:
        boolean flag1;
        wActionBar.setWindowCallback(this);
        if (wActionBar.getTitle() == null)
        {
            wActionBar.setWindowTitle(mActivity.getTitle());
        }
        if (hasFeature(2))
        {
            wActionBar.initProgress();
        }
        if (hasFeature(5))
        {
            wActionBar.initIndeterminateProgress();
        }
        int l = loadUiOptionsFromManifest(mActivity);
        if (l != 0)
        {
            mUiOptions = l;
        }
        ActionBarContainer actionbarcontainer;
        if ((1 & mUiOptions) == 0)
        {
            flag = false;
        }
        if (flag)
        {
            flag1 = ResourcesCompat.getResources_getBoolean(mActivity, com.actionbarsherlock.R.bool.abs__split_action_bar_is_narrow);
        } else
        {
            flag1 = mActivity.getTheme().obtainStyledAttributes(com.actionbarsherlock.R.styleable.SherlockTheme).getBoolean(63, false);
        }
        actionbarcontainer = (ActionBarContainer)mDecor.findViewById(com.actionbarsherlock.R.id.abs__split_action_bar);
        if (actionbarcontainer == null) goto _L16; else goto _L15
_L15:
        wActionBar.setSplitView(actionbarcontainer);
        wActionBar.setSplitActionBar(flag1);
        wActionBar.setSplitWhenNarrow(flag);
        mActionModeView = (ActionBarContextView)mDecor.findViewById(com.actionbarsherlock.R.id.abs__action_context_bar);
        mActionModeView.setSplitView(actionbarcontainer);
        mActionModeView.setSplitActionBar(flag1);
        mActionModeView.setSplitWhenNarrow(flag);
_L18:
        mDecor.post(new Runnable() );
        return;
_L16:
        if (flag1)
        {
            Log.e("ActionBarSherlock", "Requested split action bar with incompatible window decor! Ignoring request.");
        }
        if (true) goto _L18; else goto _L17
_L17:
        if (true) goto _L20; else goto _L19
_L19:
    }

    private boolean isReservingOverflow()
    {
        if (!mReserveOverflowSet)
        {
            mReserveOverflow = ActionMenuPresenter.reserveOverflow(mActivity);
            mReserveOverflowSet = true;
        }
        return mReserveOverflow;
    }

    private static int loadUiOptionsFromManifest(Activity activity)
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
        s3 = null;
        integer = null;
        flag = false;
          goto _L7
_L16:
        s4 = xmlresourceparser.getAttributeName(k);
        if (!"uiOptions".equals(s4)) goto _L9; else goto _L8
_L8:
        integer = Integer.valueOf(xmlresourceparser.getAttributeIntValue(k, 0));
          goto _L10
_L9:
        if (!"name".equals(s4))
        {
            continue; /* Loop/switch isn't completed */
        }
        s3 = cleanActivityName(s1, xmlresourceparser.getAttributeValue(k));
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
        String s3;
        Integer integer;
        String s4;
        if ("uiOptions".equals(xmlresourceparser.getAttributeName(l)))
        {
            i = xmlresourceparser.getAttributeIntValue(l, 0);
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

    private void onIntChanged(int i, int j)
    {
        if (i == 2 || i == 5)
        {
            updateProgressBars(j);
        }
    }

    private boolean preparePanel()
    {
        if (!mMenuIsPrepared) goto _L2; else goto _L1
_L1:
        boolean flag1 = true;
_L4:
        return flag1;
_L2:
        MenuBuilder menubuilder1;
        if (mMenu != null && !mMenuRefreshContent)
        {
            break MISSING_BLOCK_LABEL_134;
        }
        if (mMenu != null)
        {
            break; /* Loop/switch isn't completed */
        }
        boolean flag2 = initializePanelMenu();
        flag1 = false;
        if (!flag2)
        {
            continue; /* Loop/switch isn't completed */
        }
        menubuilder1 = mMenu;
        flag1 = false;
        if (menubuilder1 == null) goto _L4; else goto _L3
_L3:
        if (wActionBar != null)
        {
            wActionBar.setMenu(mMenu, this);
        }
        mMenu.stopDispatchingItemsChanged();
        if (callbackCreateOptionsMenu(mMenu))
        {
            break; /* Loop/switch isn't completed */
        }
        mMenu = null;
        ActionBarView actionbarview = wActionBar;
        flag1 = false;
        if (actionbarview != null)
        {
            wActionBar.setMenu(null, this);
            return false;
        }
        if (true) goto _L4; else goto _L5
_L5:
        mMenuRefreshContent = false;
        mMenu.stopDispatchingItemsChanged();
        if (mMenuFrozenActionViewState != null)
        {
            mMenu.restoreActionViewStates(mMenuFrozenActionViewState);
            mMenuFrozenActionViewState = null;
        }
        if (!callbackPrepareOptionsMenu(mMenu))
        {
            if (wActionBar != null)
            {
                wActionBar.setMenu(null, this);
            }
            mMenu.startDispatchingItemsChanged();
            return false;
        }
        KeyCharacterMap keycharactermap = KeyCharacterMap.load(-1);
        MenuBuilder menubuilder = mMenu;
        int i = keycharactermap.getKeyboardType();
        boolean flag = false;
        if (i != 1)
        {
            flag = true;
        }
        menubuilder.setQwertyMode(flag);
        mMenu.startDispatchingItemsChanged();
        mMenuIsPrepared = true;
        return true;
    }

    private void reopenMenu(boolean flag)
    {
label0:
        {
            if (wActionBar != null && wActionBar.isOverflowReserved())
            {
                if (wActionBar.isOverflowMenuShowing() && flag)
                {
                    break label0;
                }
                if (wActionBar.getVisibility() == 0 && callbackPrepareOptionsMenu(mMenu))
                {
                    wActionBar.showOverflowMenu();
                }
            }
            return;
        }
        wActionBar.hideOverflowMenu();
    }

    private void setFeatureInt(int i, int j)
    {
        updateInt(i, j, false);
    }

    private void showProgressBars(IcsProgressBar icsprogressbar, IcsProgressBar icsprogressbar1)
    {
        int i = mFeatures;
        if ((i & 0x20) != 0 && icsprogressbar1.getVisibility() == 4)
        {
            icsprogressbar1.setVisibility(0);
        }
        if ((i & 4) != 0 && icsprogressbar.getProgress() < 10000)
        {
            icsprogressbar.setVisibility(0);
        }
    }

    private void updateInt(int i, int j, boolean flag)
    {
        while (mContentParent == null || (1 << i & getFeatures()) == 0 && !flag) 
        {
            return;
        }
        onIntChanged(i, j);
    }

    private void updateProgressBars(int i)
    {
        IcsProgressBar icsprogressbar;
        IcsProgressBar icsprogressbar1;
        int j;
        icsprogressbar = getCircularProgressBar(true);
        icsprogressbar1 = getHorizontalProgressBar(true);
        j = mFeatures;
        if (i != -1) goto _L2; else goto _L1
_L1:
        if ((j & 4) != 0)
        {
            int k = icsprogressbar1.getProgress();
            int l;
            if (icsprogressbar1.isIndeterminate() || k < 10000)
            {
                l = 0;
            } else
            {
                l = 4;
            }
            icsprogressbar1.setVisibility(l);
        }
        if ((j & 0x20) != 0)
        {
            icsprogressbar.setVisibility(0);
        }
_L4:
        return;
_L2:
        if (i != -2)
        {
            break; /* Loop/switch isn't completed */
        }
        if ((j & 4) != 0)
        {
            icsprogressbar1.setVisibility(8);
        }
        if ((j & 0x20) != 0)
        {
            icsprogressbar.setVisibility(8);
            return;
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (i == -3)
        {
            icsprogressbar1.setIndeterminate(true);
            return;
        }
        if (i == -4)
        {
            icsprogressbar1.setIndeterminate(false);
            return;
        }
        if (i >= 0 && i <= 10000)
        {
            icsprogressbar1.setProgress(i + 0);
            if (i < 10000)
            {
                showProgressBars(icsprogressbar1, icsprogressbar);
                return;
            } else
            {
                hideProgressBars(icsprogressbar1, icsprogressbar);
                return;
            }
        }
        if (20000 <= i && i <= 30000)
        {
            icsprogressbar1.setSecondaryProgress(i - 20000);
            showProgressBars(icsprogressbar1, icsprogressbar);
            return;
        }
        if (true) goto _L4; else goto _L5
_L5:
    }

    public void addContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (mContentParent == null)
        {
            installDecor();
        }
        mContentParent.addView(view, layoutparams);
        initActionBar();
    }

    void checkCloseActionMenu(Menu menu)
    {
        if (mClosingActionMenu)
        {
            return;
        } else
        {
            mClosingActionMenu = true;
            wActionBar.dismissPopupMenus();
            mClosingActionMenu = false;
            return;
        }
    }

    public boolean dispatchCloseOptionsMenu()
    {
        while (!isReservingOverflow() || wActionBar == null) 
        {
            return false;
        }
        return wActionBar.hideOverflowMenu();
    }

    public void dispatchConfigurationChanged(Configuration configuration)
    {
        if (aActionBar != null)
        {
            aActionBar.onConfigurationChanged(configuration);
        }
    }

    public boolean dispatchCreateOptionsMenu(android.view.Menu menu)
    {
        return true;
    }

    public void dispatchDestroy()
    {
        mIsDestroyed = true;
    }

    public void dispatchInvalidateOptionsMenu()
    {
        if (mMenu != null)
        {
            Bundle bundle = new Bundle();
            mMenu.saveActionViewStates(bundle);
            if (bundle.size() > 0)
            {
                mMenuFrozenActionViewState = bundle;
            }
            mMenu.stopDispatchingItemsChanged();
            mMenu.clear();
        }
        mMenuRefreshContent = true;
        if (wActionBar != null)
        {
            mMenuIsPrepared = false;
            preparePanel();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        int i;
        if (keyevent.getKeyCode() != 4)
        {
            break MISSING_BLOCK_LABEL_65;
        }
        i = keyevent.getAction();
        if (mActionMode == null) goto _L2; else goto _L1
_L1:
        if (i == 1)
        {
            mActionMode.finish();
        }
_L4:
        return true;
_L2:
        if (wActionBar == null || !wActionBar.hasExpandedActionView())
        {
            break MISSING_BLOCK_LABEL_65;
        }
        if (i != 1) goto _L4; else goto _L3
_L3:
        wActionBar.collapseActionView();
        return true;
        return false;
    }

    public boolean dispatchMenuOpened(int i, android.view.Menu menu)
    {
        if (i == 8 || i == 0)
        {
            if (aActionBar != null)
            {
                aActionBar.dispatchMenuVisibilityChanged(true);
            }
            return true;
        } else
        {
            return false;
        }
    }

    public boolean dispatchOpenOptionsMenu()
    {
        if (!isReservingOverflow())
        {
            return false;
        } else
        {
            return wActionBar.showOverflowMenu();
        }
    }

    public boolean dispatchOptionsItemSelected(MenuItem menuitem)
    {
        throw new IllegalStateException("Native callback invoked. Create a test case and report!");
    }

    public void dispatchPanelClosed(int i, android.view.Menu menu)
    {
        if ((i == 8 || i == 0) && aActionBar != null)
        {
            aActionBar.dispatchMenuVisibilityChanged(false);
        }
    }

    public void dispatchPause()
    {
        if (wActionBar != null && wActionBar.isOverflowMenuShowing())
        {
            wActionBar.hideOverflowMenu();
        }
    }

    public void dispatchPostCreate(Bundle bundle)
    {
        if (mIsDelegate)
        {
            mIsTitleReady = true;
        }
        if (mDecor == null)
        {
            initActionBar();
        }
    }

    public void dispatchPostResume()
    {
        if (aActionBar != null)
        {
            aActionBar.setShowHideAnimationEnabled(true);
        }
    }

    public boolean dispatchPrepareOptionsMenu(android.view.Menu menu)
    {
        if (mActionMode == null)
        {
            mMenuIsPrepared = false;
            if (preparePanel() && !isReservingOverflow())
            {
                if (mNativeItemMap == null)
                {
                    mNativeItemMap = new HashMap();
                } else
                {
                    mNativeItemMap.clear();
                }
                if (mMenu != null)
                {
                    return mMenu.bindNativeOverflow(menu, this, mNativeItemMap);
                }
            }
        }
        return false;
    }

    public void dispatchRestoreInstanceState(Bundle bundle)
    {
        mMenuFrozenActionViewState = (Bundle)bundle.getParcelable("sherlock:Panels");
    }

    public void dispatchSaveInstanceState(Bundle bundle)
    {
        if (mMenu != null)
        {
            mMenuFrozenActionViewState = new Bundle();
            mMenu.saveActionViewStates(mMenuFrozenActionViewState);
        }
        bundle.putParcelable("sherlock:Panels", mMenuFrozenActionViewState);
    }

    public void dispatchStop()
    {
        if (aActionBar != null)
        {
            aActionBar.setShowHideAnimationEnabled(false);
        }
    }

    public void dispatchTitleChanged(CharSequence charsequence, int i)
    {
        if (mIsDelegate && !mIsTitleReady) goto _L2; else goto _L1
_L1:
        if (mTitleView == null) goto _L4; else goto _L3
_L3:
        mTitleView.setText(charsequence);
_L2:
        mTitle = charsequence;
        return;
_L4:
        if (wActionBar != null)
        {
            wActionBar.setWindowTitle(charsequence);
        }
        if (true) goto _L2; else goto _L5
_L5:
    }

    public ActionBar getActionBar()
    {
        initActionBar();
        return aActionBar;
    }

    protected Context getThemedContext()
    {
        return aActionBar.getThemedContext();
    }

    public boolean hasFeature(int i)
    {
        return (mFeatures & 1 << i) != 0;
    }

    public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
    {
        checkCloseActionMenu(menubuilder);
    }

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        MenuItemImpl menuitemimpl = (MenuItemImpl)mNativeItemMap.get(menuitem);
        if (menuitemimpl != null)
        {
            menuitemimpl.invoke();
        } else
        {
            Log.e("ActionBarSherlock", (new StringBuilder("Options item \"")).append(menuitem).append("\" not found in mapping").toString());
        }
        return true;
    }

    public boolean onMenuItemSelected(int i, com.actionbarsherlock.view.MenuItem menuitem)
    {
        return callbackOptionsItemSelected(menuitem);
    }

    public boolean onMenuItemSelected(MenuBuilder menubuilder, com.actionbarsherlock.view.MenuItem menuitem)
    {
        return callbackOptionsItemSelected(menuitem);
    }

    public void onMenuModeChange(MenuBuilder menubuilder)
    {
        reopenMenu(true);
    }

    public boolean onOpenSubMenu(MenuBuilder menubuilder)
    {
        return true;
    }

    public boolean requestFeature(int i)
    {
        if (mContentParent != null)
        {
            throw new AndroidRuntimeException("requestFeature() must be called before adding content");
        }
        switch (i)
        {
        case 3: // '\003'
        case 4: // '\004'
        case 6: // '\006'
        case 7: // '\007'
        default:
            return false;

        case 1: // '\001'
        case 2: // '\002'
        case 5: // '\005'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
            mFeatures = mFeatures | 1 << i;
            break;
        }
        return true;
    }

    public void setContentView(int i)
    {
        android.view.Window.Callback callback;
        if (mContentParent == null)
        {
            installDecor();
        } else
        {
            mContentParent.removeAllViews();
        }
        mActivity.getLayoutInflater().inflate(i, mContentParent);
        callback = mActivity.getWindow().getCallback();
        if (callback != null)
        {
            callback.onContentChanged();
        }
        initActionBar();
    }

    public void setContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        android.view.Window.Callback callback;
        if (mContentParent == null)
        {
            installDecor();
        } else
        {
            mContentParent.removeAllViews();
        }
        mContentParent.addView(view, layoutparams);
        callback = mActivity.getWindow().getCallback();
        if (callback != null)
        {
            callback.onContentChanged();
        }
        initActionBar();
    }

    public void setProgress(int i)
    {
        setFeatureInt(2, i + 0);
    }

    public void setProgressBarIndeterminate(boolean flag)
    {
        byte byte0;
        if (flag)
        {
            byte0 = -3;
        } else
        {
            byte0 = -4;
        }
        setFeatureInt(2, byte0);
    }

    public void setProgressBarIndeterminateVisibility(boolean flag)
    {
        byte byte0;
        if (flag)
        {
            byte0 = -1;
        } else
        {
            byte0 = -2;
        }
        setFeatureInt(5, byte0);
    }

    public void setProgressBarVisibility(boolean flag)
    {
        byte byte0;
        if (flag)
        {
            byte0 = -1;
        } else
        {
            byte0 = -2;
        }
        setFeatureInt(2, byte0);
    }

    public void setSecondaryProgress(int i)
    {
        setFeatureInt(2, i + 20000);
    }

    public void setTitle(CharSequence charsequence)
    {
        dispatchTitleChanged(charsequence, 0);
    }

    public void setUiOptions(int i)
    {
        mUiOptions = i;
    }

    public void setUiOptions(int i, int j)
    {
        mUiOptions = mUiOptions & ~j | i & j;
    }

    public ActionMode startActionMode(com.actionbarsherlock.view.ActionMode.Callback callback)
    {
        ActionModeCallbackWrapper actionmodecallbackwrapper;
        ActionMode actionmode;
        if (mActionMode != null)
        {
            mActionMode.finish();
        }
        actionmodecallbackwrapper = new ActionModeCallbackWrapper(callback);
        initActionBar();
        ActionBarImpl actionbarimpl = aActionBar;
        actionmode = null;
        if (actionbarimpl != null)
        {
            actionmode = aActionBar.startActionMode(actionmodecallbackwrapper);
        }
        if (actionmode == null) goto _L2; else goto _L1
_L1:
        mActionMode = actionmode;
_L4:
        if (mActionMode != null && (mActivity instanceof com.actionbarsherlock.ActionBarSherlock.OnActionModeStartedListener))
        {
            ((com.actionbarsherlock.ActionBarSherlock.OnActionModeStartedListener)mActivity).onActionModeStarted(mActionMode);
        }
        return mActionMode;
_L2:
        if (mActionModeView == null)
        {
            ViewStub viewstub = (ViewStub)mDecor.findViewById(com.actionbarsherlock.R.id.abs__action_mode_bar_stub);
            if (viewstub != null)
            {
                mActionModeView = (ActionBarContextView)viewstub.inflate();
            }
        }
        if (mActionModeView != null)
        {
            mActionModeView.killMode();
            StandaloneActionMode standaloneactionmode = new StandaloneActionMode(mActivity, mActionModeView, actionmodecallbackwrapper, true);
            if (callback.onCreateActionMode(standaloneactionmode, standaloneactionmode.getMenu()))
            {
                standaloneactionmode.invalidate();
                mActionModeView.initForMode(standaloneactionmode);
                mActionModeView.setVisibility(0);
                mActionMode = standaloneactionmode;
                mActionModeView.sendAccessibilityEvent(32);
            } else
            {
                mActionMode = null;
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }






}
