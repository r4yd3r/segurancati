// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;

public class IcsListPopupWindow
{
    private static class DropDownListView extends ListView
    {

        private boolean mHijackFocus;
        private boolean mListSelectionHidden;

        public boolean hasFocus()
        {
            return mHijackFocus || super.hasFocus();
        }

        public boolean hasWindowFocus()
        {
            return mHijackFocus || super.hasWindowFocus();
        }

        public boolean isFocused()
        {
            return mHijackFocus || super.isFocused();
        }

        public boolean isInTouchMode()
        {
            return mHijackFocus && mListSelectionHidden || super.isInTouchMode();
        }


        public DropDownListView(Context context, boolean flag)
        {
            super(context, null, com.actionbarsherlock.R.attr.dropDownListViewStyle);
            mHijackFocus = flag;
            setCacheColorHint(0);
        }
    }

    private class ListSelectorHider
        implements Runnable
    {

        final IcsListPopupWindow this$0;

        public void run()
        {
            clearListSelection();
        }

        private ListSelectorHider()
        {
            this$0 = IcsListPopupWindow.this;
            super();
        }

        ListSelectorHider(ListSelectorHider listselectorhider)
        {
            this();
        }
    }

    private class PopupDataSetObserver extends DataSetObserver
    {

        final IcsListPopupWindow this$0;

        public void onChanged()
        {
            if (isShowing())
            {
                show();
            }
        }

        public void onInvalidated()
        {
            dismiss();
        }

        private PopupDataSetObserver()
        {
            this$0 = IcsListPopupWindow.this;
            super();
        }

        PopupDataSetObserver(PopupDataSetObserver popupdatasetobserver)
        {
            this();
        }
    }

    private class PopupScrollListener
        implements android.widget.AbsListView.OnScrollListener
    {

        final IcsListPopupWindow this$0;

        public void onScroll(AbsListView abslistview, int i, int j, int k)
        {
        }

        public void onScrollStateChanged(AbsListView abslistview, int i)
        {
            if (i == 1 && !isInputMethodNotNeeded() && mPopup.getContentView() != null)
            {
                mHandler.removeCallbacks(mResizePopupRunnable);
                mResizePopupRunnable.run();
            }
        }

        private PopupScrollListener()
        {
            this$0 = IcsListPopupWindow.this;
            super();
        }

        PopupScrollListener(PopupScrollListener popupscrolllistener)
        {
            this();
        }
    }

    private class PopupTouchInterceptor
        implements android.view.View.OnTouchListener
    {

        final IcsListPopupWindow this$0;

        public boolean onTouch(View view, MotionEvent motionevent)
        {
            int i;
            int j;
            int k;
            i = motionevent.getAction();
            j = (int)motionevent.getX();
            k = (int)motionevent.getY();
            if (i != 0 || mPopup == null || !mPopup.isShowing() || j < 0 || j >= mPopup.getWidth() || k < 0 || k >= mPopup.getHeight()) goto _L2; else goto _L1
_L1:
            mHandler.postDelayed(mResizePopupRunnable, 250L);
_L4:
            return false;
_L2:
            if (i == 1)
            {
                mHandler.removeCallbacks(mResizePopupRunnable);
            }
            if (true) goto _L4; else goto _L3
_L3:
        }

        private PopupTouchInterceptor()
        {
            this$0 = IcsListPopupWindow.this;
            super();
        }

        PopupTouchInterceptor(PopupTouchInterceptor popuptouchinterceptor)
        {
            this();
        }
    }

    private class ResizePopupRunnable
        implements Runnable
    {

        final IcsListPopupWindow this$0;

        public void run()
        {
            if (mDropDownList != null && mDropDownList.getCount() > mDropDownList.getChildCount() && mDropDownList.getChildCount() <= mListItemExpandMaximum)
            {
                mPopup.setInputMethodMode(2);
                show();
            }
        }

        private ResizePopupRunnable()
        {
            this$0 = IcsListPopupWindow.this;
            super();
        }

        ResizePopupRunnable(ResizePopupRunnable resizepopuprunnable)
        {
            this();
        }
    }


    private static final int EXPAND_LIST_TIMEOUT = 250;
    public static final int POSITION_PROMPT_ABOVE = 0;
    public static final int POSITION_PROMPT_BELOW = 1;
    private ListAdapter mAdapter;
    private Context mContext;
    private View mDropDownAnchorView;
    private int mDropDownHeight;
    private int mDropDownHorizontalOffset;
    private DropDownListView mDropDownList;
    private Drawable mDropDownListHighlight;
    private int mDropDownVerticalOffset;
    private boolean mDropDownVerticalOffsetSet;
    private int mDropDownWidth;
    private Handler mHandler;
    private final ListSelectorHider mHideSelector;
    private android.widget.AdapterView.OnItemClickListener mItemClickListener;
    private android.widget.AdapterView.OnItemSelectedListener mItemSelectedListener;
    private int mListItemExpandMaximum;
    private boolean mModal;
    private DataSetObserver mObserver;
    private PopupWindow mPopup;
    private int mPromptPosition;
    private View mPromptView;
    private final ResizePopupRunnable mResizePopupRunnable;
    private final PopupScrollListener mScrollListener;
    private Rect mTempRect;
    private final PopupTouchInterceptor mTouchInterceptor;

    public IcsListPopupWindow(Context context)
    {
        this(context, null, com.actionbarsherlock.R.attr.listPopupWindowStyle);
    }

    public IcsListPopupWindow(Context context, AttributeSet attributeset, int i)
    {
        mDropDownHeight = -2;
        mDropDownWidth = -2;
        mListItemExpandMaximum = 0x7fffffff;
        mPromptPosition = 0;
        mResizePopupRunnable = new ResizePopupRunnable(null);
        mTouchInterceptor = new PopupTouchInterceptor(null);
        mScrollListener = new PopupScrollListener(null);
        mHideSelector = new ListSelectorHider(null);
        mHandler = new Handler();
        mTempRect = new Rect();
        mContext = context;
        mPopup = new PopupWindow(context, attributeset, i);
        mPopup.setInputMethodMode(1);
    }

    public IcsListPopupWindow(Context context, AttributeSet attributeset, int i, int j)
    {
        mDropDownHeight = -2;
        mDropDownWidth = -2;
        mListItemExpandMaximum = 0x7fffffff;
        mPromptPosition = 0;
        mResizePopupRunnable = new ResizePopupRunnable(null);
        mTouchInterceptor = new PopupTouchInterceptor(null);
        mScrollListener = new PopupScrollListener(null);
        mHideSelector = new ListSelectorHider(null);
        mHandler = new Handler();
        mTempRect = new Rect();
        mContext = context;
        if (android.os.Build.VERSION.SDK_INT < 11)
        {
            mPopup = new PopupWindow(new ContextThemeWrapper(context, j), attributeset, i);
        } else
        {
            mPopup = new PopupWindow(context, attributeset, i, j);
        }
        mPopup.setInputMethodMode(1);
    }

    private int buildDropDown()
    {
        if (mDropDownList != null) goto _L2; else goto _L1
_L1:
        int i;
        Object obj;
        View view1;
        LinearLayout linearlayout;
        android.widget.LinearLayout.LayoutParams layoutparams1;
        Context context = mContext;
        Drawable drawable;
        boolean flag1;
        android.widget.LinearLayout.LayoutParams layoutparams2;
        if (mModal)
        {
            flag1 = false;
        } else
        {
            flag1 = true;
        }
        mDropDownList = new DropDownListView(context, flag1);
        if (mDropDownListHighlight != null)
        {
            mDropDownList.setSelector(mDropDownListHighlight);
        }
        mDropDownList.setAdapter(mAdapter);
        mDropDownList.setOnItemClickListener(mItemClickListener);
        mDropDownList.setFocusable(true);
        mDropDownList.setFocusableInTouchMode(true);
        mDropDownList.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {

            final IcsListPopupWindow this$0;

            public void onItemSelected(AdapterView adapterview, View view2, int i1, long l1)
            {
                if (i1 != -1)
                {
                    DropDownListView dropdownlistview = mDropDownList;
                    if (dropdownlistview != null)
                    {
                        dropdownlistview.mListSelectionHidden = false;
                    }
                }
            }

            public void onNothingSelected(AdapterView adapterview)
            {
            }

            
            {
                this$0 = IcsListPopupWindow.this;
                super();
            }
        });
        mDropDownList.setOnScrollListener(mScrollListener);
        if (mItemSelectedListener != null)
        {
            mDropDownList.setOnItemSelectedListener(mItemSelectedListener);
        }
        obj = mDropDownList;
        view1 = mPromptView;
        i = 0;
        if (view1 == null) goto _L4; else goto _L3
_L3:
        linearlayout = new LinearLayout(context);
        linearlayout.setOrientation(1);
        layoutparams1 = new android.widget.LinearLayout.LayoutParams(-1, 0, 1.0F);
        mPromptPosition;
        JVM INSTR tableswitch 0 1: default 212
    //                   0 400
    //                   1 381;
           goto _L5 _L6 _L7
_L5:
        view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(mDropDownWidth, 0x80000000), 0);
        layoutparams2 = (android.widget.LinearLayout.LayoutParams)view1.getLayoutParams();
        i = view1.getMeasuredHeight() + layoutparams2.topMargin + layoutparams2.bottomMargin;
        obj = linearlayout;
_L4:
        mPopup.setContentView(((View) (obj)));
        break MISSING_BLOCK_LABEL_268;
_L7:
        linearlayout.addView(((View) (obj)), layoutparams1);
        linearlayout.addView(view1);
        continue; /* Loop/switch isn't completed */
_L6:
        linearlayout.addView(view1);
        linearlayout.addView(((View) (obj)), layoutparams1);
        continue; /* Loop/switch isn't completed */
_L2:
        (ViewGroup)mPopup.getContentView();
        View view = mPromptView;
        i = 0;
        if (view != null)
        {
            android.widget.LinearLayout.LayoutParams layoutparams = (android.widget.LinearLayout.LayoutParams)view.getLayoutParams();
            i = view.getMeasuredHeight() + layoutparams.topMargin + layoutparams.bottomMargin;
        }
        drawable = mPopup.getBackground();
        int j = 0;
        if (drawable != null)
        {
            drawable.getPadding(mTempRect);
            j = mTempRect.top + mTempRect.bottom;
            if (!mDropDownVerticalOffsetSet)
            {
                mDropDownVerticalOffset = -mTempRect.top;
            }
        }
        boolean flag;
        int k;
        if (mPopup.getInputMethodMode() == 2)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        k = getMaxAvailableHeight(mDropDownAnchorView, mDropDownVerticalOffset, flag);
        if (mDropDownHeight == -1)
        {
            return k + j;
        }
        int l = measureHeightOfChildren(0, 0, -1, k - i, -1);
        if (l > 0)
        {
            i += j;
        }
        return l + i;
        if (true) goto _L5; else goto _L8
_L8:
    }

    private int getMaxAvailableHeight(View view, int i, boolean flag)
    {
        Rect rect = new Rect();
        view.getWindowVisibleDisplayFrame(rect);
        int ai[] = new int[2];
        view.getLocationOnScreen(ai);
        int j = rect.bottom;
        if (flag)
        {
            j = view.getContext().getResources().getDisplayMetrics().heightPixels;
        }
        int k = Math.max(j - (ai[1] + view.getHeight()) - i, i + (ai[1] - rect.top));
        if (mPopup.getBackground() != null)
        {
            mPopup.getBackground().getPadding(mTempRect);
            k -= mTempRect.top + mTempRect.bottom;
        }
        return k;
    }

    private boolean isInputMethodNotNeeded()
    {
        return mPopup.getInputMethodMode() == 2;
    }

    private int measureHeightOfChildren(int i, int j, int k, int l, int i1)
    {
        ListAdapter listadapter = mAdapter;
        if (listadapter != null) goto _L2; else goto _L1
_L1:
        int l1 = mDropDownList.getListPaddingTop() + mDropDownList.getListPaddingBottom();
_L4:
        return l1;
_L2:
        int j1 = mDropDownList.getListPaddingTop() + mDropDownList.getListPaddingBottom();
        int k1;
        int i2;
        if (mDropDownList.getDividerHeight() > 0 && mDropDownList.getDivider() != null)
        {
            k1 = mDropDownList.getDividerHeight();
        } else
        {
            k1 = 0;
        }
        l1 = 0;
        if (k == -1)
        {
            k = -1 + listadapter.getCount();
        }
        i2 = j;
        do
        {
label0:
            {
                if (i2 > k)
                {
                    return j1;
                }
                View view = mAdapter.getView(i2, null, mDropDownList);
                if (mDropDownList.getCacheColorHint() != 0)
                {
                    view.setDrawingCacheBackgroundColor(mDropDownList.getCacheColorHint());
                }
                measureScrapChild(view, i2, i);
                if (i2 > 0)
                {
                    j1 += k1;
                }
                j1 += view.getMeasuredHeight();
                if (j1 < l)
                {
                    break label0;
                }
                if (i1 < 0 || i2 <= i1 || l1 <= 0 || j1 == l)
                {
                    return l;
                }
            }
            if (true)
            {
                continue;
            }
            if (i1 >= 0 && i2 >= i1)
            {
                l1 = j1;
            }
            i2++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void measureScrapChild(View view, int i, int j)
    {
        android.widget.AbsListView.LayoutParams layoutparams = (android.widget.AbsListView.LayoutParams)view.getLayoutParams();
        if (layoutparams == null)
        {
            layoutparams = new android.widget.AbsListView.LayoutParams(-1, -2, 0);
            view.setLayoutParams(layoutparams);
        }
        int k = ViewGroup.getChildMeasureSpec(j, mDropDownList.getPaddingLeft() + mDropDownList.getPaddingRight(), layoutparams.width);
        int l = layoutparams.height;
        int i1;
        if (l > 0)
        {
            i1 = android.view.View.MeasureSpec.makeMeasureSpec(l, 0x40000000);
        } else
        {
            i1 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        }
        view.measure(k, i1);
    }

    public void clearListSelection()
    {
        DropDownListView dropdownlistview = mDropDownList;
        if (dropdownlistview != null)
        {
            dropdownlistview.mListSelectionHidden = true;
            dropdownlistview.requestLayout();
        }
    }

    public void dismiss()
    {
        mPopup.dismiss();
        if (mPromptView != null)
        {
            android.view.ViewParent viewparent = mPromptView.getParent();
            if (viewparent instanceof ViewGroup)
            {
                ((ViewGroup)viewparent).removeView(mPromptView);
            }
        }
        mPopup.setContentView(null);
        mDropDownList = null;
        mHandler.removeCallbacks(mResizePopupRunnable);
    }

    public ListView getListView()
    {
        return mDropDownList;
    }

    public boolean isShowing()
    {
        return mPopup.isShowing();
    }

    public void setAdapter(ListAdapter listadapter)
    {
        if (mObserver != null) goto _L2; else goto _L1
_L1:
        mObserver = new PopupDataSetObserver(null);
_L4:
        mAdapter = listadapter;
        if (mAdapter != null)
        {
            listadapter.registerDataSetObserver(mObserver);
        }
        if (mDropDownList != null)
        {
            mDropDownList.setAdapter(mAdapter);
        }
        return;
_L2:
        if (mAdapter != null)
        {
            mAdapter.unregisterDataSetObserver(mObserver);
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void setAnchorView(View view)
    {
        mDropDownAnchorView = view;
    }

    public void setBackgroundDrawable(Drawable drawable)
    {
        mPopup.setBackgroundDrawable(drawable);
    }

    public void setContentWidth(int i)
    {
        Drawable drawable = mPopup.getBackground();
        if (drawable != null)
        {
            drawable.getPadding(mTempRect);
            mDropDownWidth = i + (mTempRect.left + mTempRect.right);
            return;
        } else
        {
            mDropDownWidth = i;
            return;
        }
    }

    public void setHorizontalOffset(int i)
    {
        mDropDownHorizontalOffset = i;
    }

    public void setInputMethodMode(int i)
    {
        mPopup.setInputMethodMode(i);
    }

    public void setModal(boolean flag)
    {
        mModal = true;
        mPopup.setFocusable(flag);
    }

    public void setOnDismissListener(android.widget.PopupWindow.OnDismissListener ondismisslistener)
    {
        mPopup.setOnDismissListener(ondismisslistener);
    }

    public void setOnItemClickListener(android.widget.AdapterView.OnItemClickListener onitemclicklistener)
    {
        mItemClickListener = onitemclicklistener;
    }

    public void setPromptPosition(int i)
    {
        mPromptPosition = i;
    }

    public void setVerticalOffset(int i)
    {
        mDropDownVerticalOffset = i;
        mDropDownVerticalOffsetSet = true;
    }

    public void show()
    {
        byte byte0 = -1;
        int i = buildDropDown();
        boolean flag = isInputMethodNotNeeded();
        if (mPopup.isShowing())
        {
            int j;
            int k;
            if (mDropDownWidth == byte0)
            {
                j = -1;
            } else
            if (mDropDownWidth == -2)
            {
                j = mDropDownAnchorView.getWidth();
            } else
            {
                j = mDropDownWidth;
            }
            if (mDropDownHeight == byte0)
            {
                if (flag)
                {
                    k = i;
                } else
                {
                    k = byte0;
                }
                if (flag)
                {
                    PopupWindow popupwindow1 = mPopup;
                    if (mDropDownWidth != byte0)
                    {
                        byte0 = 0;
                    }
                    popupwindow1.setWindowLayoutMode(byte0, 0);
                } else
                {
                    PopupWindow popupwindow = mPopup;
                    int l = mDropDownWidth;
                    byte byte3 = 0;
                    if (l == byte0)
                    {
                        byte3 = byte0;
                    }
                    popupwindow.setWindowLayoutMode(byte3, byte0);
                }
            } else
            if (mDropDownHeight == -2)
            {
                k = i;
            } else
            {
                k = mDropDownHeight;
            }
            mPopup.setOutsideTouchable(true);
            mPopup.update(mDropDownAnchorView, mDropDownHorizontalOffset, mDropDownVerticalOffset, j, k);
        } else
        {
            byte byte1;
            byte byte2;
            if (mDropDownWidth == byte0)
            {
                byte1 = -1;
            } else
            if (mDropDownWidth == -2)
            {
                mPopup.setWidth(mDropDownAnchorView.getWidth());
                byte1 = 0;
            } else
            {
                mPopup.setWidth(mDropDownWidth);
                byte1 = 0;
            }
            if (mDropDownHeight == byte0)
            {
                byte2 = -1;
            } else
            if (mDropDownHeight == -2)
            {
                mPopup.setHeight(i);
                byte2 = 0;
            } else
            {
                mPopup.setHeight(mDropDownHeight);
                byte2 = 0;
            }
            mPopup.setWindowLayoutMode(byte1, byte2);
            mPopup.setOutsideTouchable(true);
            mPopup.setTouchInterceptor(mTouchInterceptor);
            mPopup.showAsDropDown(mDropDownAnchorView, mDropDownHorizontalOffset, mDropDownVerticalOffset);
            mDropDownList.setSelection(byte0);
            if (!mModal || mDropDownList.isInTouchMode())
            {
                clearListSelection();
            }
            if (!mModal)
            {
                mHandler.post(mHideSelector);
                return;
            }
        }
    }






}
