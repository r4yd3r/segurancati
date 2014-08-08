// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineLinearLayout;

public class IcsLinearLayout extends NineLinearLayout
{

    private static final int LinearLayout_divider = 0;
    private static final int LinearLayout_dividerPadding = 3;
    private static final int LinearLayout_measureWithLargestChild = 1;
    private static final int LinearLayout_showDividers = 2;
    private static final int R_styleable_LinearLayout[] = {
        0x1010129, 0x10102d4, 0x1010329, 0x101032a
    };
    public static final int SHOW_DIVIDER_BEGINNING = 1;
    public static final int SHOW_DIVIDER_END = 4;
    public static final int SHOW_DIVIDER_MIDDLE = 2;
    public static final int SHOW_DIVIDER_NONE;
    private Drawable mDivider;
    private int mDividerHeight;
    private int mDividerPadding;
    private int mDividerWidth;
    private int mShowDividers;
    private boolean mUseLargestChild;

    public IcsLinearLayout(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, R_styleable_LinearLayout);
        setDividerDrawable(typedarray.getDrawable(0));
        mShowDividers = typedarray.getInt(2, 0);
        mDividerPadding = typedarray.getDimensionPixelSize(3, 0);
        mUseLargestChild = typedarray.getBoolean(1, false);
        typedarray.recycle();
    }

    private void useLargestChildHorizontal()
    {
        int i;
        int j;
        int k;
        i = getChildCount();
        j = 0;
        k = 0;
_L3:
        if (k < i) goto _L2; else goto _L1
_L1:
        int l;
        int i1;
        l = 0;
        i1 = 0;
_L4:
        if (i1 >= i)
        {
            setMeasuredDimension(l + (getPaddingLeft() + getPaddingRight()), getMeasuredHeight());
            return;
        }
        break MISSING_BLOCK_LABEL_66;
_L2:
        j = Math.max(getChildAt(k).getMeasuredWidth(), j);
        k++;
          goto _L3
        View view = getChildAt(i1);
        if (view != null && view.getVisibility() != 8)
        {
            android.widget.LinearLayout.LayoutParams layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
            int j1;
            if (layoutparams.weight > 0.0F)
            {
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(view.getMeasuredHeight(), 0x40000000));
                j1 = l + j;
            } else
            {
                j1 = l + view.getMeasuredWidth();
            }
            l = j1 + (layoutparams.leftMargin + layoutparams.rightMargin);
        }
        i1++;
          goto _L4
    }

    private void useLargestChildVertical()
    {
        int i;
        int j;
        int k;
        i = getChildCount();
        j = 0;
        k = 0;
_L3:
        if (k < i) goto _L2; else goto _L1
_L1:
        int l;
        int i1;
        l = 0;
        i1 = 0;
_L4:
        if (i1 >= i)
        {
            int k1 = l + (getPaddingLeft() + getPaddingRight());
            setMeasuredDimension(getMeasuredWidth(), k1);
            return;
        }
        break MISSING_BLOCK_LABEL_70;
_L2:
        j = Math.max(getChildAt(k).getMeasuredHeight(), j);
        k++;
          goto _L3
        View view = getChildAt(i1);
        if (view != null && view.getVisibility() != 8)
        {
            android.widget.LinearLayout.LayoutParams layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
            int j1;
            if (layoutparams.weight > 0.0F)
            {
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(view.getMeasuredWidth(), 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000));
                j1 = l + j;
            } else
            {
                j1 = l + view.getMeasuredHeight();
            }
            l = j1 + (layoutparams.leftMargin + layoutparams.rightMargin);
        }
        i1++;
          goto _L4
    }

    void drawDividersHorizontal(Canvas canvas)
    {
        int i = getChildCount();
        int j = 0;
        do
        {
            if (j >= i)
            {
                if (hasDividerBeforeChildAt(i))
                {
                    View view1 = getChildAt(i - 1);
                    View view;
                    android.widget.LinearLayout.LayoutParams layoutparams;
                    int k;
                    if (view1 == null)
                    {
                        k = getWidth() - getPaddingRight() - mDividerWidth;
                    } else
                    {
                        k = view1.getRight();
                    }
                    drawVerticalDivider(canvas, k);
                }
                return;
            }
            view = getChildAt(j);
            if (view != null && view.getVisibility() != 8 && hasDividerBeforeChildAt(j))
            {
                layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
                drawVerticalDivider(canvas, view.getLeft() - layoutparams.leftMargin);
            }
            j++;
        } while (true);
    }

    void drawDividersVertical(Canvas canvas)
    {
        int i = getChildCount();
        int j = 0;
        do
        {
            if (j >= i)
            {
                if (hasDividerBeforeChildAt(i))
                {
                    View view1 = getChildAt(i - 1);
                    View view;
                    android.widget.LinearLayout.LayoutParams layoutparams;
                    int k;
                    if (view1 == null)
                    {
                        k = getHeight() - getPaddingBottom() - mDividerHeight;
                    } else
                    {
                        k = view1.getBottom();
                    }
                    drawHorizontalDivider(canvas, k);
                }
                return;
            }
            view = getChildAt(j);
            if (view != null && view.getVisibility() != 8 && hasDividerBeforeChildAt(j))
            {
                layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
                drawHorizontalDivider(canvas, view.getTop() - layoutparams.topMargin);
            }
            j++;
        } while (true);
    }

    void drawHorizontalDivider(Canvas canvas, int i)
    {
        mDivider.setBounds(getPaddingLeft() + mDividerPadding, i, getWidth() - getPaddingRight() - mDividerPadding, i + mDividerHeight);
        mDivider.draw(canvas);
    }

    void drawVerticalDivider(Canvas canvas, int i)
    {
        mDivider.setBounds(i, getPaddingTop() + mDividerPadding, i + mDividerWidth, getHeight() - getPaddingBottom() - mDividerPadding);
        mDivider.draw(canvas);
    }

    public int getDividerPadding()
    {
        return mDividerPadding;
    }

    public int getDividerWidth()
    {
        return mDividerWidth;
    }

    public int getShowDividers()
    {
        return mShowDividers;
    }

    protected boolean hasDividerBeforeChildAt(int i)
    {
        boolean flag = true;
        if (i != 0) goto _L2; else goto _L1
_L1:
        if ((1 & mShowDividers) == 0) goto _L4; else goto _L3
_L3:
        return flag;
_L4:
        return false;
_L2:
        if (i != getChildCount())
        {
            break; /* Loop/switch isn't completed */
        }
        if ((4 & mShowDividers) == 0)
        {
            return false;
        }
        if (true) goto _L3; else goto _L5
_L5:
label0:
        {
            if ((2 & mShowDividers) == 0)
            {
                break label0;
            }
            int j = i - 1;
            do
            {
                flag = false;
                if (j < 0)
                {
                    break;
                }
                if (getChildAt(j).getVisibility() != 8)
                {
                    return true;
                }
                j--;
            } while (true);
        }
        if (true) goto _L3; else goto _L6
_L6:
        return false;
    }

    public boolean isMeasureWithLargestChildEnabled()
    {
        return mUseLargestChild;
    }

    protected void measureChildWithMargins(View view, int i, int j, int k, int l)
    {
        int i1 = indexOfChild(view);
        int j1 = getOrientation();
        android.widget.LinearLayout.LayoutParams layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
        int k1;
        if (hasDividerBeforeChildAt(i1))
        {
            if (j1 == 1)
            {
                layoutparams.topMargin = mDividerHeight;
            } else
            {
                layoutparams.leftMargin = mDividerWidth;
            }
        }
        k1 = getChildCount();
        if (i1 == k1 - 1 && hasDividerBeforeChildAt(k1))
        {
            if (j1 == 1)
            {
                layoutparams.bottomMargin = mDividerHeight;
            } else
            {
                layoutparams.rightMargin = mDividerWidth;
            }
        }
        super.measureChildWithMargins(view, i, j, k, l);
    }

    protected void onDraw(Canvas canvas)
    {
        if (mDivider != null)
        {
            if (getOrientation() == 1)
            {
                drawDividersVertical(canvas);
            } else
            {
                drawDividersHorizontal(canvas);
            }
        }
        super.onDraw(canvas);
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        if (!mUseLargestChild) goto _L2; else goto _L1
_L1:
        getOrientation();
        JVM INSTR tableswitch 0 1: default 40
    //                   0 41
    //                   1 46;
           goto _L2 _L3 _L4
_L2:
        return;
_L3:
        useLargestChildHorizontal();
        return;
_L4:
        useLargestChildVertical();
        return;
    }

    public void setDividerDrawable(Drawable drawable)
    {
        if (drawable == mDivider)
        {
            return;
        }
        mDivider = drawable;
        boolean flag;
        if (drawable != null)
        {
            mDividerWidth = drawable.getIntrinsicWidth();
            mDividerHeight = drawable.getIntrinsicHeight();
        } else
        {
            mDividerWidth = 0;
            mDividerHeight = 0;
        }
        flag = false;
        if (drawable == null)
        {
            flag = true;
        }
        setWillNotDraw(flag);
        requestLayout();
    }

    public void setDividerPadding(int i)
    {
        mDividerPadding = i;
    }

    public void setMeasureWithLargestChildEnabled(boolean flag)
    {
        mUseLargestChild = flag;
    }

    public void setShowDividers(int i)
    {
        if (i != mShowDividers)
        {
            requestLayout();
            invalidate();
        }
        mShowDividers = i;
    }

}
