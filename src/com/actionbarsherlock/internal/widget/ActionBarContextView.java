// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.view.animation.AnimatorProxy;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineLinearLayout;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.view.ActionMode;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            AbsActionBarView, ActionBarContainer

public class ActionBarContextView extends AbsActionBarView
    implements com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
{

    private static final int ANIMATE_IDLE = 0;
    private static final int ANIMATE_IN = 1;
    private static final int ANIMATE_OUT = 2;
    private boolean mAnimateInOnLayout;
    private int mAnimationMode;
    private NineLinearLayout mClose;
    private Animator mCurrentAnimation;
    private View mCustomView;
    private Drawable mSplitBackground;
    private CharSequence mSubtitle;
    private int mSubtitleStyleRes;
    private TextView mSubtitleView;
    private CharSequence mTitle;
    private LinearLayout mTitleLayout;
    private int mTitleStyleRes;
    private TextView mTitleView;

    public ActionBarContextView(Context context)
    {
        this(context, null);
    }

    public ActionBarContextView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, com.actionbarsherlock.R.attr.actionModeStyle);
    }

    public ActionBarContextView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockActionMode, i, 0);
        setBackgroundDrawable(typedarray.getDrawable(2));
        mTitleStyleRes = typedarray.getResourceId(0, 0);
        mSubtitleStyleRes = typedarray.getResourceId(1, 0);
        mContentHeight = typedarray.getLayoutDimension(4, 0);
        mSplitBackground = typedarray.getDrawable(3);
        typedarray.recycle();
    }

    private void finishAnimation()
    {
        Animator animator = mCurrentAnimation;
        if (animator != null)
        {
            mCurrentAnimation = null;
            animator.end();
        }
    }

    private void initTitle()
    {
        byte byte0 = 8;
        if (mTitleLayout == null)
        {
            LayoutInflater.from(getContext()).inflate(com.actionbarsherlock.R.layout.abs__action_bar_title_item, this);
            mTitleLayout = (LinearLayout)getChildAt(-1 + getChildCount());
            mTitleView = (TextView)mTitleLayout.findViewById(com.actionbarsherlock.R.id.abs__action_bar_title);
            mSubtitleView = (TextView)mTitleLayout.findViewById(com.actionbarsherlock.R.id.abs__action_bar_subtitle);
            if (mTitleStyleRes != 0)
            {
                mTitleView.setTextAppearance(mContext, mTitleStyleRes);
            }
            if (mSubtitleStyleRes != 0)
            {
                mSubtitleView.setTextAppearance(mContext, mSubtitleStyleRes);
            }
        }
        mTitleView.setText(mTitle);
        mSubtitleView.setText(mSubtitle);
        boolean flag;
        boolean flag1;
        TextView textview;
        int i;
        LinearLayout linearlayout;
        if (TextUtils.isEmpty(mTitle))
        {
            flag = false;
        } else
        {
            flag = true;
        }
        if (TextUtils.isEmpty(mSubtitle))
        {
            flag1 = false;
        } else
        {
            flag1 = true;
        }
        textview = mSubtitleView;
        if (flag1)
        {
            i = 0;
        } else
        {
            i = byte0;
        }
        textview.setVisibility(i);
        linearlayout = mTitleLayout;
        if (flag || flag1)
        {
            byte0 = 0;
        }
        linearlayout.setVisibility(byte0);
        if (mTitleLayout.getParent() == null)
        {
            addView(mTitleLayout);
        }
    }

    private Animator makeInAnimation()
    {
        AnimatorSet animatorset;
        com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet.Builder builder;
        mClose.setTranslationX(-mClose.getWidth() - ((android.view.ViewGroup.MarginLayoutParams)mClose.getLayoutParams()).leftMargin);
        ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mClose, "translationX", new float[] {
            0.0F
        });
        objectanimator.setDuration(200L);
        objectanimator.addListener(this);
        objectanimator.setInterpolator(new DecelerateInterpolator());
        animatorset = new AnimatorSet();
        builder = animatorset.play(objectanimator);
        if (mMenuView == null) goto _L2; else goto _L1
_L1:
        int i = mMenuView.getChildCount();
        if (i <= 0) goto _L2; else goto _L3
_L3:
        int j;
        int k;
        j = i - 1;
        k = 0;
_L6:
        if (j >= 0) goto _L4; else goto _L2
_L2:
        return animatorset;
_L4:
        AnimatorProxy animatorproxy = AnimatorProxy.wrap(mMenuView.getChildAt(j));
        animatorproxy.setScaleY(0.0F);
        ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(animatorproxy, "scaleY", new float[] {
            0.0F, 1.0F
        });
        objectanimator1.setDuration(100L);
        objectanimator1.setStartDelay(k * 70);
        builder.with(objectanimator1);
        j--;
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private Animator makeOutAnimation()
    {
        AnimatorSet animatorset;
        com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet.Builder builder;
        NineLinearLayout ninelinearlayout = mClose;
        float af[] = new float[1];
        af[0] = -mClose.getWidth() - ((android.view.ViewGroup.MarginLayoutParams)mClose.getLayoutParams()).leftMargin;
        ObjectAnimator objectanimator = ObjectAnimator.ofFloat(ninelinearlayout, "translationX", af);
        objectanimator.setDuration(200L);
        objectanimator.addListener(this);
        objectanimator.setInterpolator(new DecelerateInterpolator());
        animatorset = new AnimatorSet();
        builder = animatorset.play(objectanimator);
        if (mMenuView == null || mMenuView.getChildCount() <= 0) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < 0) goto _L3; else goto _L2
_L2:
        return animatorset;
_L3:
        AnimatorProxy animatorproxy = AnimatorProxy.wrap(mMenuView.getChildAt(i));
        animatorproxy.setScaleY(0.0F);
        ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(animatorproxy, "scaleY", new float[] {
            0.0F
        });
        objectanimator1.setDuration(100L);
        objectanimator1.setStartDelay(i * 70);
        builder.with(objectanimator1);
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public void closeMode()
    {
        if (mAnimationMode == 2)
        {
            return;
        }
        if (mClose == null)
        {
            killMode();
            return;
        } else
        {
            finishAnimation();
            mAnimationMode = 2;
            mCurrentAnimation = makeOutAnimation();
            mCurrentAnimation.start();
            return;
        }
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new android.view.ViewGroup.MarginLayoutParams(-1, -2);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new android.view.ViewGroup.MarginLayoutParams(getContext(), attributeset);
    }

    public CharSequence getSubtitle()
    {
        return mSubtitle;
    }

    public CharSequence getTitle()
    {
        return mTitle;
    }

    public boolean hideOverflowMenu()
    {
        if (mActionMenuPresenter != null)
        {
            return mActionMenuPresenter.hideOverflowMenu();
        } else
        {
            return false;
        }
    }

    public void initForMode(final ActionMode mode)
    {
        MenuBuilder menubuilder;
        android.view.ViewGroup.LayoutParams layoutparams;
        if (mClose == null)
        {
            mClose = (NineLinearLayout)LayoutInflater.from(mContext).inflate(com.actionbarsherlock.R.layout.abs__action_mode_close_item, this, false);
            addView(mClose);
        } else
        if (mClose.getParent() == null)
        {
            addView(mClose);
        }
        mClose.findViewById(com.actionbarsherlock.R.id.abs__action_mode_close_button).setOnClickListener(new android.view.View.OnClickListener() {

            final ActionBarContextView this$0;
            private final ActionMode val$mode;

            public void onClick(View view)
            {
                mode.finish();
            }

            
            {
                this$0 = ActionBarContextView.this;
                mode = actionmode;
                super();
            }
        });
        menubuilder = (MenuBuilder)mode.getMenu();
        if (mActionMenuPresenter != null)
        {
            mActionMenuPresenter.dismissPopupMenus();
        }
        mActionMenuPresenter = new ActionMenuPresenter(mContext);
        mActionMenuPresenter.setReserveOverflow(true);
        layoutparams = new android.view.ViewGroup.LayoutParams(-2, -1);
        if (!mSplitActionBar)
        {
            menubuilder.addMenuPresenter(mActionMenuPresenter);
            mMenuView = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
            mMenuView.setBackgroundDrawable(null);
            addView(mMenuView, layoutparams);
        } else
        {
            mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
            mActionMenuPresenter.setItemLimit(0x7fffffff);
            layoutparams.width = -1;
            layoutparams.height = mContentHeight;
            menubuilder.addMenuPresenter(mActionMenuPresenter);
            mMenuView = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
            mMenuView.setBackgroundDrawable(mSplitBackground);
            mSplitView.addView(mMenuView, layoutparams);
        }
        mAnimateInOnLayout = true;
    }

    public boolean isOverflowMenuShowing()
    {
        if (mActionMenuPresenter != null)
        {
            return mActionMenuPresenter.isOverflowMenuShowing();
        } else
        {
            return false;
        }
    }

    public void killMode()
    {
        finishAnimation();
        removeAllViews();
        if (mSplitView != null)
        {
            mSplitView.removeView(mMenuView);
        }
        mCustomView = null;
        mMenuView = null;
        mAnimateInOnLayout = false;
    }

    public void onAnimationCancel(Animator animator)
    {
    }

    public void onAnimationEnd(Animator animator)
    {
        if (mAnimationMode == 2)
        {
            killMode();
        }
        mAnimationMode = 0;
    }

    public void onAnimationRepeat(Animator animator)
    {
    }

    public void onAnimationStart(Animator animator)
    {
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

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (accessibilityevent.getEventType() == 32)
        {
            accessibilityevent.setClassName(getClass().getName());
            accessibilityevent.setPackageName(getContext().getPackageName());
            accessibilityevent.setContentDescription(mTitle);
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = getPaddingLeft();
        int j1 = getPaddingTop();
        int k1 = l - j - getPaddingTop() - getPaddingBottom();
        if (mClose != null && mClose.getVisibility() != 8)
        {
            android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)mClose.getLayoutParams();
            int i2 = i1 + marginlayoutparams.leftMargin;
            i1 = i2 + positionChild(mClose, i2, j1, k1) + marginlayoutparams.rightMargin;
            if (mAnimateInOnLayout)
            {
                mAnimationMode = 1;
                mCurrentAnimation = makeInAnimation();
                mCurrentAnimation.start();
                mAnimateInOnLayout = false;
            }
        }
        if (mTitleLayout != null && mCustomView == null)
        {
            i1 += positionChild(mTitleLayout, i1, j1, k1);
        }
        if (mCustomView != null)
        {
            int _tmp = i1 + positionChild(mCustomView, i1, j1, k1);
        }
        int l1 = k - i - getPaddingRight();
        if (mMenuView != null)
        {
            int _tmp1 = l1 - positionChildInverse(mMenuView, l1, j1, k1);
        }
    }

    protected void onMeasure(int i, int j)
    {
        if (android.view.View.MeasureSpec.getMode(i) != 0x40000000)
        {
            throw new IllegalStateException((new StringBuilder(String.valueOf(getClass().getSimpleName()))).append(" can only be used ").append("with android:layout_width=\"match_parent\" (or fill_parent)").toString());
        }
        if (android.view.View.MeasureSpec.getMode(j) == 0)
        {
            throw new IllegalStateException((new StringBuilder(String.valueOf(getClass().getSimpleName()))).append(" can only be used ").append("with android:layout_height=\"wrap_content\"").toString());
        }
        int k = android.view.View.MeasureSpec.getSize(i);
        int l;
        int i1;
        int j1;
        int k1;
        int l1;
        if (mContentHeight > 0)
        {
            l = mContentHeight;
        } else
        {
            l = android.view.View.MeasureSpec.getSize(j);
        }
        i1 = getPaddingTop() + getPaddingBottom();
        j1 = k - getPaddingLeft() - getPaddingRight();
        k1 = l - i1;
        l1 = android.view.View.MeasureSpec.makeMeasureSpec(k1, 0x80000000);
        if (mClose != null)
        {
            int i4 = measureChildView(mClose, j1, l1, 0);
            android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)mClose.getLayoutParams();
            j1 = i4 - (marginlayoutparams.leftMargin + marginlayoutparams.rightMargin);
        }
        if (mMenuView != null && mMenuView.getParent() == this)
        {
            j1 = measureChildView(mMenuView, j1, l1, 0);
        }
        if (mTitleLayout != null && mCustomView == null)
        {
            j1 = measureChildView(mTitleLayout, j1, l1, 0);
        }
        if (mCustomView != null)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mCustomView.getLayoutParams();
            int j2;
            int i3;
            int j3;
            int k3;
            int l3;
            if (layoutparams.width != -2)
            {
                i3 = 0x40000000;
            } else
            {
                i3 = 0x80000000;
            }
            if (layoutparams.width >= 0)
            {
                j3 = Math.min(layoutparams.width, j1);
            } else
            {
                j3 = j1;
            }
            if (layoutparams.height != -2)
            {
                k3 = 0x40000000;
            } else
            {
                k3 = 0x80000000;
            }
            if (layoutparams.height >= 0)
            {
                l3 = Math.min(layoutparams.height, k1);
            } else
            {
                l3 = k1;
            }
            mCustomView.measure(android.view.View.MeasureSpec.makeMeasureSpec(j3, i3), android.view.View.MeasureSpec.makeMeasureSpec(l3, k3));
        }
        if (mContentHeight <= 0)
        {
            int i2 = 0;
            j2 = getChildCount();
            int k2 = 0;
            do
            {
                if (k2 >= j2)
                {
                    setMeasuredDimension(k, i2);
                    return;
                }
                int l2 = i1 + getChildAt(k2).getMeasuredHeight();
                if (l2 > i2)
                {
                    i2 = l2;
                }
                k2++;
            } while (true);
        } else
        {
            setMeasuredDimension(k, l);
            return;
        }
    }

    public void setContentHeight(int i)
    {
        mContentHeight = i;
    }

    public void setCustomView(View view)
    {
        if (mCustomView != null)
        {
            removeView(mCustomView);
        }
        mCustomView = view;
        if (mTitleLayout != null)
        {
            removeView(mTitleLayout);
            mTitleLayout = null;
        }
        if (view != null)
        {
            addView(view);
        }
        requestLayout();
    }

    public void setSplitActionBar(boolean flag)
    {
        if (mSplitActionBar != flag)
        {
            if (mActionMenuPresenter != null)
            {
                android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -1);
                if (!flag)
                {
                    mMenuView = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
                    mMenuView.setBackgroundDrawable(null);
                    ViewGroup viewgroup1 = (ViewGroup)mMenuView.getParent();
                    if (viewgroup1 != null)
                    {
                        viewgroup1.removeView(mMenuView);
                    }
                    addView(mMenuView, layoutparams);
                } else
                {
                    mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
                    mActionMenuPresenter.setItemLimit(0x7fffffff);
                    layoutparams.width = -1;
                    layoutparams.height = mContentHeight;
                    mMenuView = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
                    mMenuView.setBackgroundDrawable(mSplitBackground);
                    ViewGroup viewgroup = (ViewGroup)mMenuView.getParent();
                    if (viewgroup != null)
                    {
                        viewgroup.removeView(mMenuView);
                    }
                    mSplitView.addView(mMenuView, layoutparams);
                }
            }
            super.setSplitActionBar(flag);
        }
    }

    public void setSubtitle(CharSequence charsequence)
    {
        mSubtitle = charsequence;
        initTitle();
    }

    public void setTitle(CharSequence charsequence)
    {
        mTitle = charsequence;
        initTitle();
    }

    public boolean shouldDelayChildPressedState()
    {
        return false;
    }

    public boolean showOverflowMenu()
    {
        if (mActionMenuPresenter != null)
        {
            return mActionMenuPresenter.showOverflowMenu();
        } else
        {
            return false;
        }
    }
}
