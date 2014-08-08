// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineHorizontalScrollView;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            IcsSpinner, IcsLinearLayout, IcsAdapterView, CapitalizingTextView

public class ScrollingTabContainerView extends NineHorizontalScrollView
    implements IcsAdapterView.OnItemSelectedListener
{
    private class TabAdapter extends BaseAdapter
    {

        final ScrollingTabContainerView this$0;

        public int getCount()
        {
            return mTabLayout.getChildCount();
        }

        public Object getItem(int i)
        {
            return ((TabView)mTabLayout.getChildAt(i)).getTab();
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            if (view == null)
            {
                return createTabView((com.actionbarsherlock.app.ActionBar.Tab)getItem(i), true);
            } else
            {
                ((TabView)view).bindTab((com.actionbarsherlock.app.ActionBar.Tab)getItem(i));
                return view;
            }
        }

        private TabAdapter()
        {
            this$0 = ScrollingTabContainerView.this;
            super();
        }

        TabAdapter(TabAdapter tabadapter)
        {
            this();
        }
    }

    private class TabClickListener
        implements android.view.View.OnClickListener
    {

        final ScrollingTabContainerView this$0;

        public void onClick(View view)
        {
            ((TabView)view).getTab().select();
            int i = mTabLayout.getChildCount();
            int j = 0;
            do
            {
                if (j >= i)
                {
                    return;
                }
                View view1 = mTabLayout.getChildAt(j);
                boolean flag;
                if (view1 == view)
                {
                    flag = true;
                } else
                {
                    flag = false;
                }
                view1.setSelected(flag);
                j++;
            } while (true);
        }

        private TabClickListener()
        {
            this$0 = ScrollingTabContainerView.this;
            super();
        }

        TabClickListener(TabClickListener tabclicklistener)
        {
            this();
        }
    }

    public static class TabView extends LinearLayout
    {

        private View mCustomView;
        private ImageView mIconView;
        private ScrollingTabContainerView mParent;
        private com.actionbarsherlock.app.ActionBar.Tab mTab;
        private CapitalizingTextView mTextView;

        public void bindTab(com.actionbarsherlock.app.ActionBar.Tab tab)
        {
            mTab = tab;
            update();
        }

        public com.actionbarsherlock.app.ActionBar.Tab getTab()
        {
            return mTab;
        }

        public void init(ScrollingTabContainerView scrollingtabcontainerview, com.actionbarsherlock.app.ActionBar.Tab tab, boolean flag)
        {
            mParent = scrollingtabcontainerview;
            mTab = tab;
            if (flag)
            {
                setGravity(19);
            }
            update();
        }

        public void onMeasure(int i, int j)
        {
            super.onMeasure(i, j);
            if (mParent.mMaxTabWidth > 0 && getMeasuredWidth() > mParent.mMaxTabWidth)
            {
                super.onMeasure(android.view.View.MeasureSpec.makeMeasureSpec(mParent.mMaxTabWidth, 0x40000000), j);
            }
        }

        public void update()
        {
            com.actionbarsherlock.app.ActionBar.Tab tab = mTab;
            View view = tab.getCustomView();
            if (view != null)
            {
                android.view.ViewParent viewparent = view.getParent();
                if (viewparent != this)
                {
                    if (viewparent != null)
                    {
                        ((ViewGroup)viewparent).removeView(view);
                    }
                    addView(view);
                }
                mCustomView = view;
                if (mTextView != null)
                {
                    mTextView.setVisibility(8);
                }
                if (mIconView != null)
                {
                    mIconView.setVisibility(8);
                    mIconView.setImageDrawable(null);
                }
            } else
            {
                if (mCustomView != null)
                {
                    removeView(mCustomView);
                    mCustomView = null;
                }
                android.graphics.drawable.Drawable drawable = tab.getIcon();
                CharSequence charsequence = tab.getText();
                if (drawable != null)
                {
                    if (mIconView == null)
                    {
                        ImageView imageview = new ImageView(getContext());
                        android.widget.LinearLayout.LayoutParams layoutparams1 = new android.widget.LinearLayout.LayoutParams(-2, -2);
                        layoutparams1.gravity = 16;
                        imageview.setLayoutParams(layoutparams1);
                        addView(imageview, 0);
                        mIconView = imageview;
                    }
                    mIconView.setImageDrawable(drawable);
                    mIconView.setVisibility(0);
                } else
                if (mIconView != null)
                {
                    mIconView.setVisibility(8);
                    mIconView.setImageDrawable(null);
                }
                if (charsequence != null)
                {
                    if (mTextView == null)
                    {
                        CapitalizingTextView capitalizingtextview = new CapitalizingTextView(getContext(), null, com.actionbarsherlock.R.attr.actionBarTabTextStyle);
                        capitalizingtextview.setEllipsize(android.text.TextUtils.TruncateAt.END);
                        android.widget.LinearLayout.LayoutParams layoutparams = new android.widget.LinearLayout.LayoutParams(-2, -2);
                        layoutparams.gravity = 16;
                        capitalizingtextview.setLayoutParams(layoutparams);
                        addView(capitalizingtextview);
                        mTextView = capitalizingtextview;
                    }
                    mTextView.setTextCompat(charsequence);
                    mTextView.setVisibility(0);
                } else
                if (mTextView != null)
                {
                    mTextView.setVisibility(8);
                    mTextView.setText(null);
                }
                if (mIconView != null)
                {
                    mIconView.setContentDescription(tab.getContentDescription());
                    return;
                }
            }
        }

        public TabView(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }

    protected class VisibilityAnimListener
        implements com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
    {

        private boolean mCanceled;
        private int mFinalVisibility;
        final ScrollingTabContainerView this$0;

        public void onAnimationCancel(Animator animator)
        {
            mCanceled = true;
        }

        public void onAnimationEnd(Animator animator)
        {
            if (mCanceled)
            {
                return;
            } else
            {
                mVisibilityAnim = null;
                setVisibility(mFinalVisibility);
                return;
            }
        }

        public void onAnimationRepeat(Animator animator)
        {
        }

        public void onAnimationStart(Animator animator)
        {
            setVisibility(0);
            mVisibilityAnim = animator;
            mCanceled = false;
        }

        public VisibilityAnimListener withFinalVisibility(int i)
        {
            mFinalVisibility = i;
            return this;
        }

        protected VisibilityAnimListener()
        {
            this$0 = ScrollingTabContainerView.this;
            super();
            mCanceled = false;
        }
    }


    private static final int FADE_DURATION = 200;
    private static final Interpolator sAlphaInterpolator = new DecelerateInterpolator();
    private boolean mAllowCollapse;
    private int mContentHeight;
    private LayoutInflater mInflater;
    int mMaxTabWidth;
    private int mSelectedTabIndex;
    private TabClickListener mTabClickListener;
    private IcsLinearLayout mTabLayout;
    Runnable mTabSelector;
    private IcsSpinner mTabSpinner;
    protected final VisibilityAnimListener mVisAnimListener = new VisibilityAnimListener();
    protected Animator mVisibilityAnim;

    public ScrollingTabContainerView(Context context)
    {
        super(context);
        setHorizontalScrollBarEnabled(false);
        TypedArray typedarray = getContext().obtainStyledAttributes(null, com.actionbarsherlock.R.styleable.SherlockActionBar, com.actionbarsherlock.R.attr.actionBarStyle, 0);
        setContentHeight(typedarray.getLayoutDimension(4, 0));
        typedarray.recycle();
        mInflater = LayoutInflater.from(context);
        mTabLayout = createTabLayout();
        addView(mTabLayout, new android.view.ViewGroup.LayoutParams(-2, -1));
    }

    private IcsSpinner createSpinner()
    {
        IcsSpinner icsspinner = new IcsSpinner(getContext(), null, com.actionbarsherlock.R.attr.actionDropDownStyle);
        icsspinner.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-2, -1));
        icsspinner.setOnItemSelectedListener(this);
        return icsspinner;
    }

    private IcsLinearLayout createTabLayout()
    {
        IcsLinearLayout icslinearlayout = (IcsLinearLayout)LayoutInflater.from(getContext()).inflate(com.actionbarsherlock.R.layout.abs__action_bar_tab_bar_view, null);
        icslinearlayout.setMeasureWithLargestChildEnabled(true);
        icslinearlayout.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-2, -1));
        return icslinearlayout;
    }

    private TabView createTabView(com.actionbarsherlock.app.ActionBar.Tab tab, boolean flag)
    {
        TabView tabview = (TabView)mInflater.inflate(com.actionbarsherlock.R.layout.abs__action_bar_tab, null);
        tabview.init(this, tab, flag);
        if (flag)
        {
            tabview.setBackgroundDrawable(null);
            tabview.setLayoutParams(new android.widget.AbsListView.LayoutParams(-1, mContentHeight));
            return tabview;
        }
        tabview.setFocusable(true);
        if (mTabClickListener == null)
        {
            mTabClickListener = new TabClickListener(null);
        }
        tabview.setOnClickListener(mTabClickListener);
        return tabview;
    }

    private boolean isCollapsed()
    {
        return mTabSpinner != null && mTabSpinner.getParent() == this;
    }

    private void performCollapse()
    {
        if (isCollapsed())
        {
            return;
        }
        if (mTabSpinner == null)
        {
            mTabSpinner = createSpinner();
        }
        removeView(mTabLayout);
        addView(mTabSpinner, new android.view.ViewGroup.LayoutParams(-2, -1));
        if (mTabSpinner.getAdapter() == null)
        {
            mTabSpinner.setAdapter(new TabAdapter(null));
        }
        if (mTabSelector != null)
        {
            removeCallbacks(mTabSelector);
            mTabSelector = null;
        }
        mTabSpinner.setSelection(mSelectedTabIndex);
    }

    private boolean performExpand()
    {
        if (!isCollapsed())
        {
            return false;
        } else
        {
            removeView(mTabSpinner);
            addView(mTabLayout, new android.view.ViewGroup.LayoutParams(-2, -1));
            setTabSelected(mTabSpinner.getSelectedItemPosition());
            return false;
        }
    }

    public void addTab(com.actionbarsherlock.app.ActionBar.Tab tab, int i, boolean flag)
    {
        TabView tabview = createTabView(tab, false);
        mTabLayout.addView(tabview, i, new android.widget.LinearLayout.LayoutParams(0, -1, 1.0F));
        if (mTabSpinner != null)
        {
            ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
        }
        if (flag)
        {
            tabview.setSelected(true);
        }
        if (mAllowCollapse)
        {
            requestLayout();
        }
    }

    public void addTab(com.actionbarsherlock.app.ActionBar.Tab tab, boolean flag)
    {
        TabView tabview = createTabView(tab, false);
        mTabLayout.addView(tabview, new android.widget.LinearLayout.LayoutParams(0, -1, 1.0F));
        if (mTabSpinner != null)
        {
            ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
        }
        if (flag)
        {
            tabview.setSelected(true);
        }
        if (mAllowCollapse)
        {
            requestLayout();
        }
    }

    public void animateToTab(int i)
    {
        final View tabView = mTabLayout.getChildAt(i);
        if (mTabSelector != null)
        {
            removeCallbacks(mTabSelector);
        }
        mTabSelector = new Runnable() {

            final ScrollingTabContainerView this$0;
            private final View val$tabView;

            public void run()
            {
                int j = tabView.getLeft() - (getWidth() - tabView.getWidth()) / 2;
                smoothScrollTo(j, 0);
                mTabSelector = null;
            }

            
            {
                this$0 = ScrollingTabContainerView.this;
                tabView = view;
                super();
            }
        };
        post(mTabSelector);
    }

    public void animateToVisibility(int i)
    {
        if (mVisibilityAnim != null)
        {
            mVisibilityAnim.cancel();
        }
        if (i == 0)
        {
            if (getVisibility() != 0)
            {
                setAlpha(0.0F);
            }
            ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(this, "alpha", new float[] {
                1.0F
            });
            objectanimator1.setDuration(200L);
            objectanimator1.setInterpolator(sAlphaInterpolator);
            objectanimator1.addListener(mVisAnimListener.withFinalVisibility(i));
            objectanimator1.start();
            return;
        } else
        {
            ObjectAnimator objectanimator = ObjectAnimator.ofFloat(this, "alpha", new float[] {
                0.0F
            });
            objectanimator.setDuration(200L);
            objectanimator.setInterpolator(sAlphaInterpolator);
            objectanimator.addListener(mVisAnimListener.withFinalVisibility(i));
            objectanimator.start();
            return;
        }
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (mTabSelector != null)
        {
            post(mTabSelector);
        }
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        TypedArray typedarray = getContext().obtainStyledAttributes(null, com.actionbarsherlock.R.styleable.SherlockActionBar, com.actionbarsherlock.R.attr.actionBarStyle, 0);
        setContentHeight(typedarray.getLayoutDimension(4, 0));
        typedarray.recycle();
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mTabSelector != null)
        {
            removeCallbacks(mTabSelector);
        }
    }

    public void onItemSelected(IcsAdapterView icsadapterview, View view, int i, long l)
    {
        ((TabView)view).getTab().select();
    }

    public void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        boolean flag;
        int l;
        int i1;
        boolean flag1;
        if (k == 0x40000000)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        setFillViewport(flag);
        l = mTabLayout.getChildCount();
        if (l > 1 && (k == 0x40000000 || k == 0x80000000))
        {
            if (l > 2)
            {
                mMaxTabWidth = (int)(0.4F * (float)android.view.View.MeasureSpec.getSize(i));
            } else
            {
                mMaxTabWidth = android.view.View.MeasureSpec.getSize(i) / 2;
            }
        } else
        {
            mMaxTabWidth = -1;
        }
        i1 = android.view.View.MeasureSpec.makeMeasureSpec(mContentHeight, 0x40000000);
        if (!flag && mAllowCollapse)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        if (flag1)
        {
            mTabLayout.measure(0, i1);
            int j1;
            int k1;
            if (mTabLayout.getMeasuredWidth() > android.view.View.MeasureSpec.getSize(i))
            {
                performCollapse();
            } else
            {
                performExpand();
            }
        } else
        {
            performExpand();
        }
        j1 = getMeasuredWidth();
        super.onMeasure(i, i1);
        k1 = getMeasuredWidth();
        if (flag && j1 != k1)
        {
            setTabSelected(mSelectedTabIndex);
        }
    }

    public void onNothingSelected(IcsAdapterView icsadapterview)
    {
    }

    public void removeAllTabs()
    {
        mTabLayout.removeAllViews();
        if (mTabSpinner != null)
        {
            ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
        }
        if (mAllowCollapse)
        {
            requestLayout();
        }
    }

    public void removeTabAt(int i)
    {
        mTabLayout.removeViewAt(i);
        if (mTabSpinner != null)
        {
            ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
        }
        if (mAllowCollapse)
        {
            requestLayout();
        }
    }

    public void setAllowCollapse(boolean flag)
    {
        mAllowCollapse = flag;
    }

    public void setContentHeight(int i)
    {
        mContentHeight = i;
        requestLayout();
    }

    public void setTabSelected(int i)
    {
        mSelectedTabIndex = i;
        int j = mTabLayout.getChildCount();
        int k = 0;
        do
        {
            if (k >= j)
            {
                return;
            }
            View view = mTabLayout.getChildAt(k);
            boolean flag;
            if (k == i)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            view.setSelected(flag);
            if (flag)
            {
                animateToTab(i);
            }
            k++;
        } while (true);
    }

    public void updateTab(int i)
    {
        ((TabView)mTabLayout.getChildAt(i)).update();
        if (mTabSpinner != null)
        {
            ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
        }
        if (mAllowCollapse)
        {
            requestLayout();
        }
    }



}
