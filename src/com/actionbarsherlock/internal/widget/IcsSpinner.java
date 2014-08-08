// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SpinnerAdapter;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            IcsAbsSpinner, IcsListPopupWindow

public class IcsSpinner extends IcsAbsSpinner
    implements android.content.DialogInterface.OnClickListener
{
    private static class DropDownAdapter
        implements ListAdapter, SpinnerAdapter
    {

        private SpinnerAdapter mAdapter;
        private ListAdapter mListAdapter;

        public boolean areAllItemsEnabled()
        {
            ListAdapter listadapter = mListAdapter;
            if (listadapter != null)
            {
                return listadapter.areAllItemsEnabled();
            } else
            {
                return true;
            }
        }

        public int getCount()
        {
            if (mAdapter == null)
            {
                return 0;
            } else
            {
                return mAdapter.getCount();
            }
        }

        public View getDropDownView(int i, View view, ViewGroup viewgroup)
        {
            if (mAdapter == null)
            {
                return null;
            } else
            {
                return mAdapter.getDropDownView(i, view, viewgroup);
            }
        }

        public Object getItem(int i)
        {
            if (mAdapter == null)
            {
                return null;
            } else
            {
                return mAdapter.getItem(i);
            }
        }

        public long getItemId(int i)
        {
            if (mAdapter == null)
            {
                return -1L;
            } else
            {
                return mAdapter.getItemId(i);
            }
        }

        public int getItemViewType(int i)
        {
            return 0;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            return getDropDownView(i, view, viewgroup);
        }

        public int getViewTypeCount()
        {
            return 1;
        }

        public boolean hasStableIds()
        {
            return mAdapter != null && mAdapter.hasStableIds();
        }

        public boolean isEmpty()
        {
            return getCount() == 0;
        }

        public boolean isEnabled(int i)
        {
            ListAdapter listadapter = mListAdapter;
            if (listadapter != null)
            {
                return listadapter.isEnabled(i);
            } else
            {
                return true;
            }
        }

        public void registerDataSetObserver(DataSetObserver datasetobserver)
        {
            if (mAdapter != null)
            {
                mAdapter.registerDataSetObserver(datasetobserver);
            }
        }

        public void unregisterDataSetObserver(DataSetObserver datasetobserver)
        {
            if (mAdapter != null)
            {
                mAdapter.unregisterDataSetObserver(datasetobserver);
            }
        }

        public DropDownAdapter(SpinnerAdapter spinneradapter)
        {
            mAdapter = spinneradapter;
            if (spinneradapter instanceof ListAdapter)
            {
                mListAdapter = (ListAdapter)spinneradapter;
            }
        }
    }

    private class DropdownPopup extends IcsListPopupWindow
        implements SpinnerPopup
    {

        private ListAdapter mAdapter;
        private CharSequence mHintText;
        final IcsSpinner this$0;

        public CharSequence getHintText()
        {
            return mHintText;
        }

        public void setAdapter(ListAdapter listadapter)
        {
            super.setAdapter(listadapter);
            mAdapter = listadapter;
        }

        public void setPromptText(CharSequence charsequence)
        {
            mHintText = charsequence;
        }

        public void show()
        {
            int i = getPaddingLeft();
            Drawable drawable;
            int j;
            if (mDropDownWidth == -2)
            {
                int i1 = getWidth();
                int j1 = getPaddingRight();
                setContentWidth(Math.max(measureContentWidth((SpinnerAdapter)mAdapter, getBackground()), i1 - i - j1));
            } else
            if (mDropDownWidth == -1)
            {
                int k = getWidth();
                int l = getPaddingRight();
                setContentWidth(k - i - l);
            } else
            {
                setContentWidth(mDropDownWidth);
            }
            drawable = getBackground();
            j = 0;
            if (drawable != null)
            {
                drawable.getPadding(mTempRect);
                j = -mTempRect.left;
            }
            setHorizontalOffset(j + i);
            setInputMethodMode(2);
            super.show();
            getListView().setChoiceMode(1);
            setSelection(getSelectedItemPosition());
        }


        public DropdownPopup(Context context, AttributeSet attributeset, int i)
        {
            this$0 = IcsSpinner.this;
            super(context, attributeset, 0, i);
            setAnchorView(IcsSpinner.this);
            setModal(true);
            setPromptPosition(0);
            setOnItemClickListener(new _cls1());
        }
    }

    private static interface SpinnerPopup
    {

        public abstract void dismiss();

        public abstract CharSequence getHintText();

        public abstract boolean isShowing();

        public abstract void setAdapter(ListAdapter listadapter);

        public abstract void setPromptText(CharSequence charsequence);

        public abstract void show();
    }


    private static final int MAX_ITEMS_MEASURED = 15;
    public static final int MODE_DROPDOWN = 1;
    private boolean mDisableChildrenWhenDisabled;
    int mDropDownWidth;
    private int mGravity;
    private SpinnerPopup mPopup;
    private DropDownAdapter mTempAdapter;
    private Rect mTempRect;

    public IcsSpinner(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, com.actionbarsherlock.R.attr.actionDropDownStyle);
    }

    public IcsSpinner(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTempRect = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockSpinner, i, 0);
        DropdownPopup dropdownpopup = new DropdownPopup(context, attributeset, i);
        mDropDownWidth = typedarray.getLayoutDimension(4, -2);
        dropdownpopup.setBackgroundDrawable(typedarray.getDrawable(2));
        int j = typedarray.getDimensionPixelOffset(6, 0);
        if (j != 0)
        {
            dropdownpopup.setVerticalOffset(j);
        }
        int k = typedarray.getDimensionPixelOffset(5, 0);
        if (k != 0)
        {
            dropdownpopup.setHorizontalOffset(k);
        }
        mPopup = dropdownpopup;
        mGravity = typedarray.getInt(0, 17);
        mPopup.setPromptText(typedarray.getString(3));
        mDisableChildrenWhenDisabled = true;
        typedarray.recycle();
        if (mTempAdapter != null)
        {
            mPopup.setAdapter(mTempAdapter);
            mTempAdapter = null;
        }
    }

    private View makeAndAddView(int i)
    {
        if (!mDataChanged)
        {
            View view1 = mRecycler.get(i);
            if (view1 != null)
            {
                setUpChild(view1);
                return view1;
            }
        }
        View view = mAdapter.getView(i, null, this);
        setUpChild(view);
        return view;
    }

    private void setUpChild(View view)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams == null)
        {
            layoutparams = generateDefaultLayoutParams();
        }
        addViewInLayout(view, 0, layoutparams);
        view.setSelected(hasFocus());
        if (mDisableChildrenWhenDisabled)
        {
            view.setEnabled(isEnabled());
        }
        int i = ViewGroup.getChildMeasureSpec(mHeightMeasureSpec, mSpinnerPadding.top + mSpinnerPadding.bottom, layoutparams.height);
        view.measure(ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, mSpinnerPadding.left + mSpinnerPadding.right, layoutparams.width), i);
        int j = mSpinnerPadding.top + (getMeasuredHeight() - mSpinnerPadding.bottom - mSpinnerPadding.top - view.getMeasuredHeight()) / 2;
        int k = j + view.getMeasuredHeight();
        view.layout(0, j, 0 + view.getMeasuredWidth(), k);
    }

    public int getBaseline()
    {
        int i = -1;
        if (getChildCount() <= 0) goto _L2; else goto _L1
_L1:
        View view = getChildAt(0);
_L4:
        if (view != null)
        {
            int k = view.getBaseline();
            if (k >= 0)
            {
                i = k + view.getTop();
            }
        }
        return i;
_L2:
        SpinnerAdapter spinneradapter = mAdapter;
        view = null;
        if (spinneradapter != null)
        {
            int j = mAdapter.getCount();
            view = null;
            if (j > 0)
            {
                view = makeAndAddView(0);
                mRecycler.put(0, view);
                removeAllViewsInLayout();
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public CharSequence getPrompt()
    {
        return mPopup.getHintText();
    }

    void layout(int i, boolean flag)
    {
        int j;
        int k;
        View view;
        int l;
        int i1;
        j = mSpinnerPadding.left;
        k = getRight() - getLeft() - mSpinnerPadding.left - mSpinnerPadding.right;
        if (mDataChanged)
        {
            handleDataChanged();
        }
        if (mItemCount == 0)
        {
            resetList();
            return;
        }
        if (mNextSelectedPosition >= 0)
        {
            setSelectedPositionInt(mNextSelectedPosition);
        }
        recycleAllViews();
        removeAllViewsInLayout();
        mFirstPosition = mSelectedPosition;
        view = makeAndAddView(mSelectedPosition);
        l = view.getMeasuredWidth();
        i1 = j;
        7 & mGravity;
        JVM INSTR lookupswitch 2: default 144
    //                   1: 185
    //                   5: 201;
           goto _L1 _L2 _L3
_L1:
        view.offsetLeftAndRight(i1);
        mRecycler.clear();
        invalidate();
        checkSelectionChanged();
        mDataChanged = false;
        mNeedSync = false;
        setNextSelectedPositionInt(mSelectedPosition);
        return;
_L2:
        i1 = (j + k / 2) - l / 2;
        continue; /* Loop/switch isn't completed */
_L3:
        i1 = (j + k) - l;
        if (true) goto _L1; else goto _L4
_L4:
    }

    int measureContentWidth(SpinnerAdapter spinneradapter, Drawable drawable)
    {
        if (spinneradapter != null) goto _L2; else goto _L1
_L1:
        int i = 0;
_L4:
        return i;
_L2:
        i = 0;
        View view = null;
        int j = 0;
        int k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        int l = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        int i1 = Math.max(0, getSelectedItemPosition());
        int j1 = Math.min(spinneradapter.getCount(), i1 + 15);
        int k1 = Math.max(0, i1 - (15 - (j1 - i1)));
        do
        {
label0:
            {
                if (k1 < j1)
                {
                    break label0;
                }
                if (drawable != null)
                {
                    drawable.getPadding(mTempRect);
                    return i + (mTempRect.left + mTempRect.right);
                }
            }
            if (true)
            {
                continue;
            }
            int l1 = spinneradapter.getItemViewType(k1);
            if (l1 != j)
            {
                j = l1;
                view = null;
            }
            view = spinneradapter.getView(k1, view, this);
            if (view.getLayoutParams() == null)
            {
                view.setLayoutParams(new android.view.ViewGroup.LayoutParams(-2, -2));
            }
            view.measure(k, l);
            i = Math.max(i, view.getMeasuredWidth());
            k1++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        setSelection(i);
        dialoginterface.dismiss();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mPopup != null && mPopup.isShowing())
        {
            mPopup.dismiss();
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        mInLayout = true;
        layout(0, false);
        mInLayout = false;
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        if (mPopup != null && android.view.View.MeasureSpec.getMode(i) == 0x80000000)
        {
            setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), measureContentWidth(getAdapter(), getBackground())), android.view.View.MeasureSpec.getSize(i)), getMeasuredHeight());
        }
    }

    public boolean performClick()
    {
        boolean flag = super.performClick();
        if (!flag)
        {
            flag = true;
            if (!mPopup.isShowing())
            {
                mPopup.show();
            }
        }
        return flag;
    }

    public void setAdapter(SpinnerAdapter spinneradapter)
    {
        super.setAdapter(spinneradapter);
        if (mPopup != null)
        {
            mPopup.setAdapter(new DropDownAdapter(spinneradapter));
            return;
        } else
        {
            mTempAdapter = new DropDownAdapter(spinneradapter);
            return;
        }
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        if (!mDisableChildrenWhenDisabled) goto _L2; else goto _L1
_L1:
        int i;
        int j;
        i = getChildCount();
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        return;
_L3:
        getChildAt(j).setEnabled(flag);
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            if ((i & 7) == 0)
            {
                i |= 3;
            }
            mGravity = i;
            requestLayout();
        }
    }

    public void setOnItemClickListener(android.widget.AdapterView.OnItemClickListener onitemclicklistener)
    {
        throw new RuntimeException("setOnItemClickListener cannot be used with a spinner.");
    }

    public void setPrompt(CharSequence charsequence)
    {
        mPopup.setPromptText(charsequence);
    }

    public void setPromptId(int i)
    {
        setPrompt(getContext().getText(i));
    }


    // Unreferenced inner class com/actionbarsherlock/internal/widget/IcsSpinner$DropdownPopup$1

/* anonymous class */
    class DropdownPopup._cls1
        implements android.widget.AdapterView.OnItemClickListener
    {

        final DropdownPopup this$1;

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            setSelection(i);
            dismiss();
        }

            
            {
                this$1 = DropdownPopup.this;
                super();
            }
    }

}
