// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.actionbarsherlock.internal.widget.IcsLinearLayout;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            MenuView, ActionMenuItemView, MenuBuilder, ActionMenuPresenter, 
//            MenuItemImpl

public class ActionMenuView extends IcsLinearLayout
    implements MenuBuilder.ItemInvoker, MenuView
{
    public static interface ActionMenuChildView
    {

        public abstract boolean needsDividerAfter();

        public abstract boolean needsDividerBefore();
    }

    public static class LayoutParams extends android.widget.LinearLayout.LayoutParams
    {

        public int cellsUsed;
        public boolean expandable;
        public boolean expanded;
        public int extraPixels;
        public boolean isOverflowButton;
        public boolean preventEdgeOffset;

        public LayoutParams(int i, int j)
        {
            super(i, j);
            isOverflowButton = false;
        }

        public LayoutParams(int i, int j, boolean flag)
        {
            super(i, j);
            isOverflowButton = flag;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            super(layoutparams);
            isOverflowButton = layoutparams.isOverflowButton;
        }
    }


    static final int GENERATED_ITEM_PADDING = 4;
    private static final boolean IS_FROYO = false;
    static final int MIN_CELL_SIZE = 56;
    private boolean mFirst;
    private boolean mFormatItems;
    private int mFormatItemsWidth;
    private int mGeneratedItemPadding;
    private MenuBuilder mMenu;
    private int mMinCellSize;
    private ActionMenuPresenter mPresenter;
    private boolean mReserveOverflow;

    public ActionMenuView(Context context)
    {
        this(context, null);
    }

    public ActionMenuView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mFirst = true;
        setBaselineAligned(false);
        float f = context.getResources().getDisplayMetrics().density;
        mMinCellSize = (int)(56F * f);
        mGeneratedItemPadding = (int)(4F * f);
    }

    static int measureChildForCells(View view, int i, int j, int k, int l)
    {
        LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
        int i1 = android.view.View.MeasureSpec.makeMeasureSpec(android.view.View.MeasureSpec.getSize(k) - l, android.view.View.MeasureSpec.getMode(k));
        int j1 = 0;
        if (j > 0)
        {
            view.measure(android.view.View.MeasureSpec.makeMeasureSpec(i * j, 0x80000000), i1);
            int k1 = view.getMeasuredWidth();
            j1 = k1 / i;
            if (k1 % i != 0)
            {
                j1++;
            }
        }
        ActionMenuItemView actionmenuitemview;
        boolean flag;
        if (view instanceof ActionMenuItemView)
        {
            actionmenuitemview = (ActionMenuItemView)view;
        } else
        {
            actionmenuitemview = null;
        }
        if (!layoutparams.isOverflowButton && actionmenuitemview != null && actionmenuitemview.hasText())
        {
            flag = true;
        } else
        {
            flag = false;
        }
        layoutparams.expandable = flag;
        layoutparams.cellsUsed = j1;
        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(j1 * i, 0x40000000), i1);
        return j1;
    }

    private void onMeasureExactFormat(int i, int j)
    {
        int k;
        int i1;
        int k1;
        int l1;
        int k2;
        int l2;
        int i3;
        int j3;
        int k3;
        int l3;
        boolean flag;
        long l4;
        int i4;
        int j4;
        k = android.view.View.MeasureSpec.getMode(j);
        int l = android.view.View.MeasureSpec.getSize(i);
        i1 = android.view.View.MeasureSpec.getSize(j);
        int j1 = getPaddingLeft() + getPaddingRight();
        k1 = getPaddingTop() + getPaddingBottom();
        l1 = l - j1;
        int i2 = l1 / mMinCellSize;
        int j2 = l1 % mMinCellSize;
        if (i2 == 0)
        {
            setMeasuredDimension(l1, 0);
            return;
        }
        k2 = mMinCellSize + j2 / i2;
        l2 = i2;
        i3 = 0;
        j3 = 0;
        k3 = 0;
        l3 = 0;
        flag = false;
        l4 = 0L;
        i4 = getChildCount();
        j4 = 0;
_L10:
        if (j4 < i4) goto _L2; else goto _L1
_L1:
        boolean flag3;
        boolean flag4;
        boolean flag5;
        int k5;
        int l5;
        int i6;
        int j6;
        View view;
        boolean flag1;
        LayoutParams layoutparams;
        boolean flag2;
        int k4;
        int i5;
        int j5;
        float f;
        if (flag && l3 == 2)
        {
            flag3 = true;
        } else
        {
            flag3 = false;
        }
        flag4 = false;
_L14:
        if (k3 > 0 && l2 > 0) goto _L4; else goto _L3
_L3:
        if (!flag && l3 == 1)
        {
            flag5 = true;
        } else
        {
            flag5 = false;
        }
        if (l2 <= 0 || l4 == 0L || l2 >= l3 - 1 && !flag5 && j3 <= 1) goto _L6; else goto _L5
_L5:
        f = Long.bitCount(l4);
        if (!flag5)
        {
            if ((1L & l4) != 0L && !((LayoutParams)getChildAt(0).getLayoutParams()).preventEdgeOffset)
            {
                f -= 0.5F;
            }
            if ((l4 & (long)(1 << i4 - 1)) != 0L && !((LayoutParams)getChildAt(i4 - 1).getLayoutParams()).preventEdgeOffset)
            {
                f -= 0.5F;
            }
        }
        int l6;
        long l7;
        int i7;
        int j7;
        LayoutParams layoutparams3;
        int k7;
        int i8;
        View view3;
        LayoutParams layoutparams4;
        if (f > 0.0F)
        {
            i6 = (int)((float)(l2 * k2) / f);
        } else
        {
            i6 = 0;
        }
        j6 = 0;
_L17:
        if (j6 < i4) goto _L7; else goto _L6
_L6:
        if (!flag4) goto _L9; else goto _L8
_L8:
        k5 = android.view.View.MeasureSpec.makeMeasureSpec(i1 - k1, k);
        l5 = 0;
_L18:
        if (l5 < i4)
        {
            break MISSING_BLOCK_LABEL_1038;
        }
_L9:
        if (k != 0x40000000)
        {
            i1 = i3;
        }
        setMeasuredDimension(l1, i1);
        return;
_L2:
        view = getChildAt(j4);
        if (view.getVisibility() != 8)
        {
            flag1 = view instanceof ActionMenuItemView;
            l3++;
            if (flag1)
            {
                view.setPadding(mGeneratedItemPadding, 0, mGeneratedItemPadding, 0);
            }
            layoutparams = (LayoutParams)view.getLayoutParams();
            layoutparams.expanded = false;
            layoutparams.extraPixels = 0;
            layoutparams.cellsUsed = 0;
            layoutparams.expandable = false;
            layoutparams.leftMargin = 0;
            layoutparams.rightMargin = 0;
            if (flag1 && ((ActionMenuItemView)view).hasText())
            {
                flag2 = true;
            } else
            {
                flag2 = false;
            }
            layoutparams.preventEdgeOffset = flag2;
            if (layoutparams.isOverflowButton)
            {
                k4 = 1;
            } else
            {
                k4 = l2;
            }
            i5 = measureChildForCells(view, k2, k4, j, k1);
            j3 = Math.max(j3, i5);
            if (layoutparams.expandable)
            {
                k3++;
            }
            if (layoutparams.isOverflowButton)
            {
                flag = true;
            }
            l2 -= i5;
            j5 = view.getMeasuredHeight();
            i3 = Math.max(i3, j5);
            if (i5 == 1)
            {
                l4 |= 1 << j4;
            }
        }
        j4++;
          goto _L10
_L4:
        l6 = 0x7fffffff;
        l7 = 0L;
        i7 = 0;
        j7 = 0;
_L15:
        if (j7 < i4) goto _L12; else goto _L11
_L11:
        l4 |= l7;
        if (i7 > l2) goto _L3; else goto _L13
_L13:
        k7 = l6 + 1;
        i8 = 0;
_L16:
        if (i8 < i4)
        {
            break MISSING_BLOCK_LABEL_745;
        }
        flag4 = true;
          goto _L14
_L12:
        layoutparams3 = (LayoutParams)getChildAt(j7).getLayoutParams();
        if (layoutparams3.expandable)
        {
            if (layoutparams3.cellsUsed < l6)
            {
                l6 = layoutparams3.cellsUsed;
                l7 = 1 << j7;
                i7 = 1;
            } else
            if (layoutparams3.cellsUsed == l6)
            {
                l7 |= 1 << j7;
                i7++;
            }
        }
        j7++;
          goto _L15
        view3 = getChildAt(i8);
        layoutparams4 = (LayoutParams)view3.getLayoutParams();
        if ((l7 & (long)(1 << i8)) == 0L)
        {
            if (layoutparams4.cellsUsed == k7)
            {
                l4 |= 1 << i8;
            }
        } else
        {
            if (flag3 && layoutparams4.preventEdgeOffset && l2 == 1)
            {
                view3.setPadding(k2 + mGeneratedItemPadding, 0, mGeneratedItemPadding, 0);
            }
            layoutparams4.cellsUsed = 1 + layoutparams4.cellsUsed;
            layoutparams4.expanded = true;
            l2--;
        }
        i8++;
          goto _L16
_L7:
        if ((l4 & (long)(1 << j6)) != 0L)
        {
            View view2 = getChildAt(j6);
            LayoutParams layoutparams2 = (LayoutParams)view2.getLayoutParams();
            if (view2 instanceof ActionMenuItemView)
            {
                layoutparams2.extraPixels = i6;
                layoutparams2.expanded = true;
                if (j6 == 0 && !layoutparams2.preventEdgeOffset)
                {
                    layoutparams2.leftMargin = -i6 / 2;
                }
                flag4 = true;
            } else
            if (layoutparams2.isOverflowButton)
            {
                layoutparams2.extraPixels = i6;
                layoutparams2.expanded = true;
                layoutparams2.rightMargin = -i6 / 2;
                flag4 = true;
            } else
            {
                if (j6 != 0)
                {
                    layoutparams2.leftMargin = i6 / 2;
                }
                int k6 = i4 - 1;
                if (j6 != k6)
                {
                    layoutparams2.rightMargin = i6 / 2;
                }
            }
        }
        j6++;
          goto _L17
        View view1 = getChildAt(l5);
        LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
        if (layoutparams1.expanded)
        {
            view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(k2 * layoutparams1.cellsUsed + layoutparams1.extraPixels, 0x40000000), k5);
        }
        l5++;
          goto _L18
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams != null && (layoutparams instanceof LayoutParams);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        return false;
    }

    protected volatile android.widget.LinearLayout.LayoutParams generateDefaultLayoutParams()
    {
        return generateDefaultLayoutParams();
    }

    protected LayoutParams generateDefaultLayoutParams()
    {
        LayoutParams layoutparams = new LayoutParams(-2, -2);
        layoutparams.gravity = 16;
        return layoutparams;
    }

    public volatile android.widget.LinearLayout.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected volatile android.widget.LinearLayout.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return generateLayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams instanceof LayoutParams)
        {
            LayoutParams layoutparams1 = new LayoutParams((LayoutParams)layoutparams);
            if (layoutparams1.gravity <= 0)
            {
                layoutparams1.gravity = 16;
            }
            return layoutparams1;
        } else
        {
            return generateDefaultLayoutParams();
        }
    }

    public LayoutParams generateOverflowButtonLayoutParams()
    {
        LayoutParams layoutparams = generateDefaultLayoutParams();
        layoutparams.isOverflowButton = true;
        return layoutparams;
    }

    public int getWindowAnimations()
    {
        return 0;
    }

    protected boolean hasDividerBeforeChildAt(int i)
    {
        boolean flag;
        if (i == 0)
        {
            flag = false;
        } else
        {
            View view = getChildAt(i - 1);
            View view1 = getChildAt(i);
            int j = getChildCount();
            flag = false;
            if (i < j)
            {
                boolean flag1 = view instanceof ActionMenuChildView;
                flag = false;
                if (flag1)
                {
                    flag = false | ((ActionMenuChildView)view).needsDividerAfter();
                }
            }
            if (i > 0 && (view1 instanceof ActionMenuChildView))
            {
                return flag | ((ActionMenuChildView)view1).needsDividerBefore();
            }
        }
        return flag;
    }

    public void initialize(MenuBuilder menubuilder)
    {
        mMenu = menubuilder;
    }

    public boolean invokeItem(MenuItemImpl menuitemimpl)
    {
        return mMenu.performItemAction(menuitemimpl, 0);
    }

    public boolean isExpandedFormat()
    {
        return mFormatItems;
    }

    public boolean isOverflowReserved()
    {
        return mReserveOverflow;
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        if (IS_FROYO)
        {
            super.onConfigurationChanged(configuration);
        }
        mPresenter.updateMenuView(false);
        if (mPresenter != null && mPresenter.isOverflowMenuShowing())
        {
            mPresenter.hideOverflowMenu();
            mPresenter.showOverflowMenu();
        }
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mPresenter.dismissPopupMenus();
    }

    protected void onDraw(Canvas canvas)
    {
        if (!IS_FROYO && mFirst)
        {
            mFirst = false;
            requestLayout();
            return;
        } else
        {
            super.onDraw(canvas);
            return;
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (mFormatItems) goto _L2; else goto _L1
_L1:
        super.onLayout(flag, i, j, k, l);
_L8:
        return;
_L2:
        int i1;
        int j1;
        int k1;
        int l1;
        boolean flag1;
        int i2;
        i1 = getChildCount();
        j1 = (j + l) / 2;
        k1 = 0;
        l1 = k - i - getPaddingRight() - getPaddingLeft();
        flag1 = false;
        i2 = 0;
_L4:
        View view;
        if (i2 >= i1)
        {
            if (i1 == 1 && !flag1)
            {
                View view2 = getChildAt(0);
                int i6 = view2.getMeasuredWidth();
                int j6 = view2.getMeasuredHeight();
                int k6 = (k - i) / 2 - i6 / 2;
                int l6 = j1 - j6 / 2;
                view2.layout(k6, l6, k6 + i6, l6 + j6);
                return;
            }
            break MISSING_BLOCK_LABEL_297;
        }
        view = getChildAt(i2);
        if (view.getVisibility() != 8)
        {
            break; /* Loop/switch isn't completed */
        }
_L5:
        i2++;
        if (true) goto _L4; else goto _L3
_L3:
        LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
        if (layoutparams.isOverflowButton)
        {
            int j2 = view.getMeasuredWidth();
            if (hasDividerBeforeChildAt(i2))
            {
                j2 += 0;
            }
            int k2 = view.getMeasuredHeight();
            int l2 = getWidth() - getPaddingRight() - layoutparams.rightMargin;
            int i3 = l2 - j2;
            int j3 = j1 - k2 / 2;
            view.layout(i3, j3, l2, j3 + k2);
            l1 -= j2;
            flag1 = true;
        } else
        {
            l1 -= view.getMeasuredWidth() + layoutparams.leftMargin + layoutparams.rightMargin;
            k1++;
        }
          goto _L5
        if (true) goto _L4; else goto _L6
_L6:
        int k3;
        int l3;
        int i4;
        int j4;
        int k4;
        int l4;
        if (flag1)
        {
            k3 = 0;
        } else
        {
            k3 = 1;
        }
        l3 = k1 - k3;
        if (l3 > 0)
        {
            i4 = l1 / l3;
        } else
        {
            i4 = 0;
        }
        j4 = Math.max(0, i4);
        k4 = getPaddingLeft();
        l4 = 0;
        while (l4 < i1) 
        {
            View view1 = getChildAt(l4);
            LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
            if (view1.getVisibility() != 8 && !layoutparams1.isOverflowButton)
            {
                int i5 = k4 + layoutparams1.leftMargin;
                int j5 = view1.getMeasuredWidth();
                int k5 = view1.getMeasuredHeight();
                int l5 = j1 - k5 / 2;
                view1.layout(i5, l5, i5 + j5, l5 + k5);
                k4 = i5 + (j4 + (j5 + layoutparams1.rightMargin));
            }
            l4++;
        }
        if (true) goto _L8; else goto _L7
_L7:
    }

    protected void onMeasure(int i, int j)
    {
        boolean flag = mFormatItems;
        boolean flag1;
        int k;
        if (android.view.View.MeasureSpec.getMode(i) == 0x40000000)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        mFormatItems = flag1;
        if (flag != mFormatItems)
        {
            mFormatItemsWidth = 0;
        }
        k = android.view.View.MeasureSpec.getMode(i);
        if (mFormatItems && mMenu != null && k != mFormatItemsWidth)
        {
            mFormatItemsWidth = k;
            mMenu.onItemsChanged(true);
        }
        if (mFormatItems)
        {
            onMeasureExactFormat(i, j);
            return;
        } else
        {
            super.onMeasure(i, j);
            return;
        }
    }

    public void setOverflowReserved(boolean flag)
    {
        mReserveOverflow = flag;
    }

    public void setPresenter(ActionMenuPresenter actionmenupresenter)
    {
        mPresenter = actionmenupresenter;
    }

    static 
    {
        boolean flag;
        if (android.os.Build.VERSION.SDK_INT >= 8)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        IS_FROYO = flag;
    }
}
