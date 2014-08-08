// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineFrameLayout;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            IcsColorDrawable, ActionBarView, ScrollingTabContainerView

public class ActionBarContainer extends NineFrameLayout
{

    private ActionBarView mActionBarView;
    private Drawable mBackground;
    private boolean mIsSplit;
    private boolean mIsStacked;
    private boolean mIsTransitioning;
    private Drawable mSplitBackground;
    private Drawable mStackedBackground;
    private View mTabContainer;

    public ActionBarContainer(Context context)
    {
        this(context, null);
    }

    public ActionBarContainer(Context context, AttributeSet attributeset)
    {
        boolean flag;
        flag = true;
        super(context, attributeset);
        setBackgroundDrawable(null);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockActionBar);
        mBackground = typedarray.getDrawable(2);
        mStackedBackground = typedarray.getDrawable(12);
        if ((mStackedBackground instanceof ColorDrawable) && android.os.Build.VERSION.SDK_INT < 11)
        {
            Bitmap bitmap = Bitmap.createBitmap(flag, flag, android.graphics.Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            mStackedBackground.draw(canvas);
            int i = bitmap.getPixel(0, 0);
            bitmap.recycle();
            mStackedBackground = new IcsColorDrawable(i);
        }
        if (getId() == com.actionbarsherlock.R.id.abs__split_action_bar)
        {
            mIsSplit = flag;
            mSplitBackground = typedarray.getDrawable(3);
        }
        typedarray.recycle();
        if (!mIsSplit) goto _L2; else goto _L1
_L1:
        if (mSplitBackground != null)
        {
            flag = false;
        }
_L4:
        setWillNotDraw(flag);
        return;
_L2:
        if (mBackground != null || mStackedBackground != null)
        {
            flag = false;
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public View getTabContainer()
    {
        return mTabContainer;
    }

    public void onDraw(Canvas canvas)
    {
        if (getWidth() != 0 && getHeight() != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if (!mIsSplit)
        {
            break; /* Loop/switch isn't completed */
        }
        if (mSplitBackground != null)
        {
            mSplitBackground.draw(canvas);
            return;
        }
        if (true) goto _L1; else goto _L3
_L3:
        if (mBackground != null)
        {
            mBackground.draw(canvas);
        }
        if (mStackedBackground != null && mIsStacked)
        {
            mStackedBackground.draw(canvas);
            return;
        }
        if (true) goto _L1; else goto _L4
_L4:
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        mActionBarView = (ActionBarView)findViewById(com.actionbarsherlock.R.id.abs__action_bar);
    }

    public boolean onHoverEvent(MotionEvent motionevent)
    {
        super.onHoverEvent(motionevent);
        return true;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mIsTransitioning || super.onInterceptTouchEvent(motionevent);
    }

    public void onLayout(boolean flag, int i, int j, int k, int l)
    {
        boolean flag1;
        int i1;
        int j1;
        int l1;
        super.onLayout(flag, i, j, k, l);
        Drawable drawable1;
        int k1;
        if (mTabContainer != null && mTabContainer.getVisibility() != 8)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        if (mTabContainer == null || mTabContainer.getVisibility() == 8) goto _L2; else goto _L1
_L1:
        i1 = getMeasuredHeight();
        j1 = mTabContainer.getMeasuredHeight();
        if ((2 & mActionBarView.getDisplayOptions()) != 0)
        {
            break MISSING_BLOCK_LABEL_208;
        }
        k1 = getChildCount();
        l1 = 0;
_L5:
        if (l1 < k1) goto _L4; else goto _L3
_L3:
        mTabContainer.layout(i, 0, k, j1);
_L2:
        boolean flag2;
        View view;
        if (mIsSplit)
        {
            drawable1 = mSplitBackground;
            flag2 = false;
            if (drawable1 != null)
            {
                mSplitBackground.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
                flag2 = true;
            }
        } else
        {
            Drawable drawable = mBackground;
            flag2 = false;
            if (drawable != null)
            {
                mBackground.setBounds(mActionBarView.getLeft(), mActionBarView.getTop(), mActionBarView.getRight(), mActionBarView.getBottom());
                flag2 = true;
            }
            boolean flag3;
            if (flag1 && mStackedBackground != null)
            {
                flag3 = true;
            } else
            {
                flag3 = false;
            }
            mIsStacked = flag3;
            if (flag3)
            {
                mStackedBackground.setBounds(mTabContainer.getLeft(), mTabContainer.getTop(), mTabContainer.getRight(), mTabContainer.getBottom());
                flag2 = true;
            }
        }
        if (flag2)
        {
            invalidate();
        }
        return;
_L4:
        view = getChildAt(l1);
        if (view != mTabContainer && !mActionBarView.isCollapsed())
        {
            view.offsetTopAndBottom(j1);
        }
        l1++;
          goto _L5
        mTabContainer.layout(i, i1 - j1, k, i1);
          goto _L2
    }

    public void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        if (mActionBarView != null)
        {
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mActionBarView.getLayoutParams();
            int k;
            if (mActionBarView.isCollapsed())
            {
                k = 0;
            } else
            {
                k = mActionBarView.getMeasuredHeight() + layoutparams.topMargin + layoutparams.bottomMargin;
            }
            if (mTabContainer != null && mTabContainer.getVisibility() != 8 && android.view.View.MeasureSpec.getMode(j) == 0x80000000)
            {
                int l = android.view.View.MeasureSpec.getSize(j);
                setMeasuredDimension(getMeasuredWidth(), Math.min(k + mTabContainer.getMeasuredHeight(), l));
                return;
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        super.onTouchEvent(motionevent);
        return true;
    }

    public void setPrimaryBackground(Drawable drawable)
    {
        mBackground = drawable;
        invalidate();
    }

    public void setSplitBackground(Drawable drawable)
    {
        mSplitBackground = drawable;
        invalidate();
    }

    public void setStackedBackground(Drawable drawable)
    {
        mStackedBackground = drawable;
        invalidate();
    }

    public void setTabContainer(ScrollingTabContainerView scrollingtabcontainerview)
    {
        if (mTabContainer != null)
        {
            removeView(mTabContainer);
        }
        mTabContainer = scrollingtabcontainerview;
        if (scrollingtabcontainerview != null)
        {
            addView(scrollingtabcontainerview);
            android.view.ViewGroup.LayoutParams layoutparams = scrollingtabcontainerview.getLayoutParams();
            layoutparams.width = -1;
            layoutparams.height = -2;
            scrollingtabcontainerview.setAllowCollapse(false);
        }
    }

    public void setTransitioning(boolean flag)
    {
        mIsTransitioning = flag;
        int i;
        if (flag)
        {
            i = 0x60000;
        } else
        {
            i = 0x40000;
        }
        setDescendantFocusability(i);
    }
}
