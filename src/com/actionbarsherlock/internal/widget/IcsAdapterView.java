// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Adapter;

public abstract class IcsAdapterView extends ViewGroup
{
    public static class AdapterContextMenuInfo
        implements android.view.ContextMenu.ContextMenuInfo
    {

        public long id;
        public int position;
        public View targetView;

        public AdapterContextMenuInfo(View view, int i, long l)
        {
            targetView = view;
            position = i;
            id = l;
        }
    }

    class AdapterDataSetObserver extends DataSetObserver
    {

        private Parcelable mInstanceState;
        final IcsAdapterView this$0;

        public void clearSavedState()
        {
            mInstanceState = null;
        }

        public void onChanged()
        {
            mDataChanged = true;
            mOldItemCount = mItemCount;
            mItemCount = getAdapter().getCount();
            if (getAdapter().hasStableIds() && mInstanceState != null && mOldItemCount == 0 && mItemCount > 0)
            {
                onRestoreInstanceState(mInstanceState);
                mInstanceState = null;
            } else
            {
                rememberSyncState();
            }
            checkFocus();
            requestLayout();
        }

        public void onInvalidated()
        {
            mDataChanged = true;
            if (getAdapter().hasStableIds())
            {
                mInstanceState = onSaveInstanceState();
            }
            mOldItemCount = mItemCount;
            mItemCount = 0;
            mSelectedPosition = -1;
            mSelectedRowId = 0x8000000000000000L;
            mNextSelectedPosition = -1;
            mNextSelectedRowId = 0x8000000000000000L;
            mNeedSync = false;
            checkFocus();
            requestLayout();
        }

        AdapterDataSetObserver()
        {
            this$0 = IcsAdapterView.this;
            super();
            mInstanceState = null;
        }
    }

    public static interface OnItemLongClickListener
    {

        public abstract boolean onItemLongClick(IcsAdapterView icsadapterview, View view, int i, long l);
    }

    public static interface OnItemSelectedListener
    {

        public abstract void onItemSelected(IcsAdapterView icsadapterview, View view, int i, long l);

        public abstract void onNothingSelected(IcsAdapterView icsadapterview);
    }

    private class SelectionNotifier
        implements Runnable
    {

        final IcsAdapterView this$0;

        public void run()
        {
            if (mDataChanged)
            {
                if (getAdapter() != null)
                {
                    post(this);
                }
                return;
            } else
            {
                fireOnSelected();
                return;
            }
        }

        private SelectionNotifier()
        {
            this$0 = IcsAdapterView.this;
            super();
        }

        SelectionNotifier(SelectionNotifier selectionnotifier)
        {
            this();
        }
    }


    public static final int INVALID_POSITION = -1;
    public static final long INVALID_ROW_ID = 0x8000000000000000L;
    public static final int ITEM_VIEW_TYPE_HEADER_OR_FOOTER = -2;
    public static final int ITEM_VIEW_TYPE_IGNORE = -1;
    static final int SYNC_FIRST_POSITION = 1;
    static final int SYNC_MAX_DURATION_MILLIS = 100;
    static final int SYNC_SELECTED_POSITION;
    boolean mBlockLayoutRequests;
    boolean mDataChanged;
    private boolean mDesiredFocusableInTouchModeState;
    private boolean mDesiredFocusableState;
    private View mEmptyView;
    int mFirstPosition;
    boolean mInLayout;
    int mItemCount;
    private int mLayoutHeight;
    boolean mNeedSync;
    int mNextSelectedPosition;
    long mNextSelectedRowId;
    int mOldItemCount;
    int mOldSelectedPosition;
    long mOldSelectedRowId;
    android.widget.AdapterView.OnItemClickListener mOnItemClickListener;
    OnItemLongClickListener mOnItemLongClickListener;
    OnItemSelectedListener mOnItemSelectedListener;
    int mSelectedPosition;
    long mSelectedRowId;
    private SelectionNotifier mSelectionNotifier;
    int mSpecificTop;
    long mSyncHeight;
    int mSyncMode;
    int mSyncPosition;
    long mSyncRowId;

    public IcsAdapterView(Context context)
    {
        super(context);
        mFirstPosition = 0;
        mSyncRowId = 0x8000000000000000L;
        mNeedSync = false;
        mInLayout = false;
        mNextSelectedPosition = -1;
        mNextSelectedRowId = 0x8000000000000000L;
        mSelectedPosition = -1;
        mSelectedRowId = 0x8000000000000000L;
        mOldSelectedPosition = -1;
        mOldSelectedRowId = 0x8000000000000000L;
        mBlockLayoutRequests = false;
    }

    public IcsAdapterView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mFirstPosition = 0;
        mSyncRowId = 0x8000000000000000L;
        mNeedSync = false;
        mInLayout = false;
        mNextSelectedPosition = -1;
        mNextSelectedRowId = 0x8000000000000000L;
        mSelectedPosition = -1;
        mSelectedRowId = 0x8000000000000000L;
        mOldSelectedPosition = -1;
        mOldSelectedRowId = 0x8000000000000000L;
        mBlockLayoutRequests = false;
    }

    public IcsAdapterView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mFirstPosition = 0;
        mSyncRowId = 0x8000000000000000L;
        mNeedSync = false;
        mInLayout = false;
        mNextSelectedPosition = -1;
        mNextSelectedRowId = 0x8000000000000000L;
        mSelectedPosition = -1;
        mSelectedRowId = 0x8000000000000000L;
        mOldSelectedPosition = -1;
        mOldSelectedRowId = 0x8000000000000000L;
        mBlockLayoutRequests = false;
    }

    private void fireOnSelected()
    {
        if (mOnItemSelectedListener == null)
        {
            return;
        }
        int i = getSelectedItemPosition();
        if (i >= 0)
        {
            View view = getSelectedView();
            mOnItemSelectedListener.onItemSelected(this, view, i, getAdapter().getItemId(i));
            return;
        } else
        {
            mOnItemSelectedListener.onNothingSelected(this);
            return;
        }
    }

    private boolean isScrollableForAccessibility()
    {
        boolean flag;
label0:
        {
            Adapter adapter = getAdapter();
            flag = false;
            if (adapter == null)
            {
                break label0;
            }
            int i = adapter.getCount();
            flag = false;
            if (i <= 0)
            {
                break label0;
            }
            if (getFirstVisiblePosition() <= 0)
            {
                int j = getLastVisiblePosition();
                int k = i - 1;
                flag = false;
                if (j >= k)
                {
                    break label0;
                }
            }
            flag = true;
        }
        return flag;
    }

    private void updateEmptyStatus(boolean flag)
    {
        if (isInFilterMode())
        {
            flag = false;
        }
        if (flag)
        {
            if (mEmptyView != null)
            {
                mEmptyView.setVisibility(0);
                setVisibility(8);
            } else
            {
                setVisibility(0);
            }
            if (mDataChanged)
            {
                onLayout(false, getLeft(), getTop(), getRight(), getBottom());
            }
            return;
        }
        if (mEmptyView != null)
        {
            mEmptyView.setVisibility(8);
        }
        setVisibility(0);
    }

    public void addView(View view)
    {
        throw new UnsupportedOperationException("addView(View) is not supported in AdapterView");
    }

    public void addView(View view, int i)
    {
        throw new UnsupportedOperationException("addView(View, int) is not supported in AdapterView");
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutparams)
    {
        throw new UnsupportedOperationException("addView(View, int, LayoutParams) is not supported in AdapterView");
    }

    public void addView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        throw new UnsupportedOperationException("addView(View, LayoutParams) is not supported in AdapterView");
    }

    protected boolean canAnimate()
    {
        return super.canAnimate() && mItemCount > 0;
    }

    void checkFocus()
    {
        boolean flag4;
        Adapter adapter = getAdapter();
        boolean flag;
        boolean flag1;
        boolean flag2;
        boolean flag3;
        boolean flag5;
        if (adapter != null && adapter.getCount() != 0)
        {
            flag = false;
        } else
        {
            flag = true;
        }
        if (flag && !isInFilterMode())
        {
            flag1 = false;
        } else
        {
            flag1 = true;
        }
        if (flag1 && mDesiredFocusableInTouchModeState)
        {
            flag2 = true;
        } else
        {
            flag2 = false;
        }
        super.setFocusableInTouchMode(flag2);
        if (flag1 && mDesiredFocusableState)
        {
            flag3 = true;
        } else
        {
            flag3 = false;
        }
        super.setFocusable(flag3);
        if (mEmptyView == null) goto _L2; else goto _L1
_L1:
        if (adapter == null) goto _L4; else goto _L3
_L3:
        flag5 = adapter.isEmpty();
        flag4 = false;
        if (flag5) goto _L4; else goto _L5
_L5:
        updateEmptyStatus(flag4);
_L2:
        return;
_L4:
        flag4 = true;
        if (true) goto _L5; else goto _L6
_L6:
    }

    void checkSelectionChanged()
    {
        if (mSelectedPosition != mOldSelectedPosition || mSelectedRowId != mOldSelectedRowId)
        {
            selectionChanged();
            mOldSelectedPosition = mSelectedPosition;
            mOldSelectedRowId = mSelectedRowId;
        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        View view = getSelectedView();
        return view != null && view.getVisibility() == 0 && view.dispatchPopulateAccessibilityEvent(accessibilityevent);
    }

    protected void dispatchRestoreInstanceState(SparseArray sparsearray)
    {
        dispatchThawSelfOnly(sparsearray);
    }

    protected void dispatchSaveInstanceState(SparseArray sparsearray)
    {
        dispatchFreezeSelfOnly(sparsearray);
    }

    int findSyncPosition()
    {
        int i = mItemCount;
        if (i != 0) goto _L2; else goto _L1
_L1:
        int i1 = -1;
_L5:
        return i1;
_L2:
        long l;
        long l1;
        int j1;
        int k1;
        Adapter adapter;
        boolean flag;
        l = mSyncRowId;
        int j = mSyncPosition;
        if (l == 0x8000000000000000L)
        {
            return -1;
        }
        int k = Math.max(0, j);
        i1 = Math.min(i - 1, k);
        l1 = 100L + SystemClock.uptimeMillis();
        j1 = i1;
        k1 = i1;
        adapter = getAdapter();
        flag = false;
        if (adapter == null)
        {
            return -1;
        }
          goto _L3
_L8:
        if (adapter.getItemId(i1) == l) goto _L5; else goto _L4
_L4:
        boolean flag1;
        boolean flag2;
        if (k1 == i - 1)
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        if (j1 == 0)
        {
            flag2 = true;
        } else
        {
            flag2 = false;
        }
        if (!flag1 || !flag2) goto _L7; else goto _L6
_L6:
        return -1;
_L7:
        if (flag2 || flag && !flag1)
        {
            i1 = ++k1;
            flag = false;
        } else
        if (flag1 || !flag && !flag2)
        {
            i1 = --j1;
            flag = true;
        }
_L3:
        if (SystemClock.uptimeMillis() <= l1) goto _L8; else goto _L6
    }

    public abstract Adapter getAdapter();

    public int getCount()
    {
        return mItemCount;
    }

    public View getEmptyView()
    {
        return mEmptyView;
    }

    public int getFirstVisiblePosition()
    {
        return mFirstPosition;
    }

    public Object getItemAtPosition(int i)
    {
        Adapter adapter = getAdapter();
        if (adapter == null || i < 0)
        {
            return null;
        } else
        {
            return adapter.getItem(i);
        }
    }

    public long getItemIdAtPosition(int i)
    {
        Adapter adapter = getAdapter();
        if (adapter == null || i < 0)
        {
            return 0x8000000000000000L;
        } else
        {
            return adapter.getItemId(i);
        }
    }

    public int getLastVisiblePosition()
    {
        return -1 + (mFirstPosition + getChildCount());
    }

    public final android.widget.AdapterView.OnItemClickListener getOnItemClickListener()
    {
        return mOnItemClickListener;
    }

    public final OnItemLongClickListener getOnItemLongClickListener()
    {
        return mOnItemLongClickListener;
    }

    public final OnItemSelectedListener getOnItemSelectedListener()
    {
        return mOnItemSelectedListener;
    }

    public int getPositionForView(View view)
    {
        View view1 = view;
_L3:
        View view2;
        boolean flag;
        int i;
        int j;
        try
        {
            view2 = (View)view1.getParent();
            flag = view2.equals(this);
        }
        catch (ClassCastException classcastexception)
        {
            return -1;
        }
        if (!flag) goto _L2; else goto _L1
_L1:
        i = getChildCount();
        j = 0;
_L4:
        if (j >= i)
        {
            return -1;
        }
        break MISSING_BLOCK_LABEL_51;
_L2:
        view1 = view2;
          goto _L3
        if (getChildAt(j).equals(view1))
        {
            return j + mFirstPosition;
        }
        j++;
          goto _L4
    }

    public Object getSelectedItem()
    {
        Adapter adapter = getAdapter();
        int i = getSelectedItemPosition();
        if (adapter != null && adapter.getCount() > 0 && i >= 0)
        {
            return adapter.getItem(i);
        } else
        {
            return null;
        }
    }

    public long getSelectedItemId()
    {
        return mNextSelectedRowId;
    }

    public int getSelectedItemPosition()
    {
        return mNextSelectedPosition;
    }

    public abstract View getSelectedView();

    void handleDataChanged()
    {
        int i = mItemCount;
        boolean flag = false;
        if (i > 0)
        {
            boolean flag1 = mNeedSync;
            flag = false;
            if (flag1)
            {
                mNeedSync = false;
                int l = findSyncPosition();
                flag = false;
                if (l >= 0)
                {
                    int i1 = lookForSelectablePosition(l, true);
                    flag = false;
                    if (i1 == l)
                    {
                        setNextSelectedPositionInt(l);
                        flag = true;
                    }
                }
            }
            if (!flag)
            {
                int j = getSelectedItemPosition();
                if (j >= i)
                {
                    j = i - 1;
                }
                if (j < 0)
                {
                    j = 0;
                }
                int k = lookForSelectablePosition(j, true);
                if (k < 0)
                {
                    k = lookForSelectablePosition(j, false);
                }
                if (k >= 0)
                {
                    setNextSelectedPositionInt(k);
                    checkSelectionChanged();
                    flag = true;
                }
            }
        }
        if (!flag)
        {
            mSelectedPosition = -1;
            mSelectedRowId = 0x8000000000000000L;
            mNextSelectedPosition = -1;
            mNextSelectedRowId = 0x8000000000000000L;
            mNeedSync = false;
            checkSelectionChanged();
        }
    }

    boolean isInFilterMode()
    {
        return false;
    }

    int lookForSelectablePosition(int i, boolean flag)
    {
        return i;
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        removeCallbacks(mSelectionNotifier);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setScrollable(isScrollableForAccessibility());
        View view = getSelectedView();
        if (view != null)
        {
            accessibilityevent.setEnabled(view.isEnabled());
        }
        accessibilityevent.setCurrentItemIndex(getSelectedItemPosition());
        accessibilityevent.setFromIndex(getFirstVisiblePosition());
        accessibilityevent.setToIndex(getLastVisiblePosition());
        accessibilityevent.setItemCount(getCount());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setScrollable(isScrollableForAccessibility());
        View view = getSelectedView();
        if (view != null)
        {
            accessibilitynodeinfo.setEnabled(view.isEnabled());
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        mLayoutHeight = getHeight();
    }

    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (super.onRequestSendAccessibilityEvent(view, accessibilityevent))
        {
            AccessibilityEvent accessibilityevent1 = AccessibilityEvent.obtain();
            onInitializeAccessibilityEvent(accessibilityevent1);
            view.dispatchPopulateAccessibilityEvent(accessibilityevent1);
            accessibilityevent.appendRecord(accessibilityevent1);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean performItemClick(View view, int i, long l)
    {
        android.widget.AdapterView.OnItemClickListener onitemclicklistener = mOnItemClickListener;
        boolean flag = false;
        if (onitemclicklistener != null)
        {
            playSoundEffect(0);
            if (view != null)
            {
                view.sendAccessibilityEvent(1);
            }
            mOnItemClickListener.onItemClick(null, view, i, l);
            flag = true;
        }
        return flag;
    }

    void rememberSyncState()
    {
label0:
        {
            if (getChildCount() > 0)
            {
                mNeedSync = true;
                mSyncHeight = mLayoutHeight;
                if (mSelectedPosition < 0)
                {
                    break label0;
                }
                View view1 = getChildAt(mSelectedPosition - mFirstPosition);
                mSyncRowId = mNextSelectedRowId;
                mSyncPosition = mNextSelectedPosition;
                if (view1 != null)
                {
                    mSpecificTop = view1.getTop();
                }
                mSyncMode = 0;
            }
            return;
        }
        View view = getChildAt(0);
        Adapter adapter = getAdapter();
        if (mFirstPosition >= 0 && mFirstPosition < adapter.getCount())
        {
            mSyncRowId = adapter.getItemId(mFirstPosition);
        } else
        {
            mSyncRowId = -1L;
        }
        mSyncPosition = mFirstPosition;
        if (view != null)
        {
            mSpecificTop = view.getTop();
        }
        mSyncMode = 1;
    }

    public void removeAllViews()
    {
        throw new UnsupportedOperationException("removeAllViews() is not supported in AdapterView");
    }

    public void removeView(View view)
    {
        throw new UnsupportedOperationException("removeView(View) is not supported in AdapterView");
    }

    public void removeViewAt(int i)
    {
        throw new UnsupportedOperationException("removeViewAt(int) is not supported in AdapterView");
    }

    void selectionChanged()
    {
        if (mOnItemSelectedListener != null)
        {
            if (mInLayout || mBlockLayoutRequests)
            {
                if (mSelectionNotifier == null)
                {
                    mSelectionNotifier = new SelectionNotifier(null);
                }
                post(mSelectionNotifier);
            } else
            {
                fireOnSelected();
            }
        }
        if (mSelectedPosition != -1 && isShown() && !isInTouchMode())
        {
            sendAccessibilityEvent(4);
        }
    }

    public abstract void setAdapter(Adapter adapter);

    public void setEmptyView(View view)
    {
        mEmptyView = view;
        Adapter adapter = getAdapter();
        boolean flag;
        if (adapter != null && !adapter.isEmpty())
        {
            flag = false;
        } else
        {
            flag = true;
        }
        updateEmptyStatus(flag);
    }

    public void setFocusable(boolean flag)
    {
        boolean flag1 = true;
        Adapter adapter = getAdapter();
        boolean flag2;
        if (adapter != null && adapter.getCount() != 0)
        {
            flag2 = false;
        } else
        {
            flag2 = flag1;
        }
        mDesiredFocusableState = flag;
        if (!flag)
        {
            mDesiredFocusableInTouchModeState = false;
        }
        if (!flag || flag2 && !isInFilterMode())
        {
            flag1 = false;
        }
        super.setFocusable(flag1);
    }

    public void setFocusableInTouchMode(boolean flag)
    {
        boolean flag1 = true;
        Adapter adapter = getAdapter();
        boolean flag2;
        if (adapter != null && adapter.getCount() != 0)
        {
            flag2 = false;
        } else
        {
            flag2 = flag1;
        }
        mDesiredFocusableInTouchModeState = flag;
        if (flag)
        {
            mDesiredFocusableState = flag1;
        }
        if (!flag || flag2 && !isInFilterMode())
        {
            flag1 = false;
        }
        super.setFocusableInTouchMode(flag1);
    }

    void setNextSelectedPositionInt(int i)
    {
        mNextSelectedPosition = i;
        mNextSelectedRowId = getItemIdAtPosition(i);
        if (mNeedSync && mSyncMode == 0 && i >= 0)
        {
            mSyncPosition = i;
            mSyncRowId = mNextSelectedRowId;
        }
    }

    public void setOnClickListener(android.view.View.OnClickListener onclicklistener)
    {
        throw new RuntimeException("Don't call setOnClickListener for an AdapterView. You probably want setOnItemClickListener instead");
    }

    public void setOnItemClickListener(android.widget.AdapterView.OnItemClickListener onitemclicklistener)
    {
        mOnItemClickListener = onitemclicklistener;
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onitemlongclicklistener)
    {
        if (!isLongClickable())
        {
            setLongClickable(true);
        }
        mOnItemLongClickListener = onitemlongclicklistener;
    }

    public void setOnItemSelectedListener(OnItemSelectedListener onitemselectedlistener)
    {
        mOnItemSelectedListener = onitemselectedlistener;
    }

    void setSelectedPositionInt(int i)
    {
        mSelectedPosition = i;
        mSelectedRowId = getItemIdAtPosition(i);
    }

    public abstract void setSelection(int i);



}
