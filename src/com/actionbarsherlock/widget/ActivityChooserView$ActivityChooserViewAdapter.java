// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.content.Context;
import android.content.pm.ResolveInfo;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

// Referenced classes of package com.actionbarsherlock.widget:
//            ActivityChooserModel, ActivityChooserView

private class <init> extends BaseAdapter
{

    private static final int ITEM_VIEW_TYPE_ACTIVITY = 0;
    private static final int ITEM_VIEW_TYPE_COUNT = 3;
    private static final int ITEM_VIEW_TYPE_FOOTER = 1;
    public static final int MAX_ACTIVITY_COUNT_DEFAULT = 4;
    public static final int MAX_ACTIVITY_COUNT_UNLIMITED = 0x7fffffff;
    private ActivityChooserModel mDataModel;
    private boolean mHighlightDefaultActivity;
    private int mMaxActivityCount;
    private boolean mShowDefaultActivity;
    private boolean mShowFooterView;
    final ActivityChooserView this$0;

    public int getActivityCount()
    {
        return mDataModel.getActivityCount();
    }

    public int getCount()
    {
        int i = mDataModel.getActivityCount();
        if (!mShowDefaultActivity && mDataModel.getDefaultActivity() != null)
        {
            i--;
        }
        int j = Math.min(i, mMaxActivityCount);
        if (mShowFooterView)
        {
            j++;
        }
        return j;
    }

    public ActivityChooserModel getDataModel()
    {
        return mDataModel;
    }

    public ResolveInfo getDefaultActivity()
    {
        return mDataModel.getDefaultActivity();
    }

    public int getHistorySize()
    {
        return mDataModel.getHistorySize();
    }

    public Object getItem(int i)
    {
        switch (getItemViewType(i))
        {
        default:
            throw new IllegalArgumentException();

        case 1: // '\001'
            return null;

        case 0: // '\0'
            break;
        }
        if (!mShowDefaultActivity && mDataModel.getDefaultActivity() != null)
        {
            i++;
        }
        return mDataModel.getActivity(i);
    }

    public long getItemId(int i)
    {
        return (long)i;
    }

    public int getItemViewType(int i)
    {
        return !mShowFooterView || i != -1 + getCount() ? 0 : 1;
    }

    public int getMaxActivityCount()
    {
        return mMaxActivityCount;
    }

    public boolean getShowDefaultActivity()
    {
        return mShowDefaultActivity;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        switch (getItemViewType(i))
        {
        default:
            throw new IllegalArgumentException();

        case 1: // '\001'
            if (view == null || view.getId() != 1)
            {
                view = LayoutInflater.from(getContext()).inflate(com.actionbarsherlock.dapter.getItemViewType, viewgroup, false);
                view.setId(1);
                ((TextView)view.findViewById(com.actionbarsherlock.dapter.getItemViewType)).setText(ActivityChooserView.access$4(ActivityChooserView.this).getString(com.actionbarsherlock.dapter.this._fld0));
            }
            return view;

        case 0: // '\0'
            break;
        }
        if (view == null || view.getId() != com.actionbarsherlock.dapter.this._fld0)
        {
            view = LayoutInflater.from(getContext()).inflate(com.actionbarsherlock.dapter.this._fld0, viewgroup, false);
        }
        android.content.pm.PackageManager packagemanager = ActivityChooserView.access$4(ActivityChooserView.this).getPackageManager();
        ImageView imageview = (ImageView)view.findViewById(com.actionbarsherlock.dapter.this._fld0);
        ResolveInfo resolveinfo = (ResolveInfo)getItem(i);
        imageview.setImageDrawable(resolveinfo.loadIcon(packagemanager));
        ((TextView)view.findViewById(com.actionbarsherlock.dapter.getItem)).setText(resolveinfo.loadLabel(packagemanager));
        if (ActivityChooserView.access$11())
        {
            if (mShowDefaultActivity && i == 0 && mHighlightDefaultActivity)
            {
                mHighlightDefaultActivity(view, true);
            } else
            {
                mHighlightDefaultActivity(view, false);
            }
        }
        return view;
    }

    public int getViewTypeCount()
    {
        return 3;
    }

    public int measureContentWidth()
    {
        int i = mMaxActivityCount;
        mMaxActivityCount = 0x7fffffff;
        int j = 0;
        View view = null;
        int k = android.view.oserViewAdapter.mMaxActivityCount(0, 0);
        int l = android.view.oserViewAdapter.mMaxActivityCount(0, 0);
        int i1 = getCount();
        int j1 = 0;
        do
        {
            if (j1 >= i1)
            {
                mMaxActivityCount = i;
                return j;
            }
            view = getView(j1, view, null);
            view.measure(k, l);
            j = Math.max(j, view.getMeasuredWidth());
            j1++;
        } while (true);
    }

    public void setDataModel(ActivityChooserModel activitychoosermodel)
    {
        ActivityChooserModel activitychoosermodel1 = ActivityChooserView.access$0(ActivityChooserView.this).getDataModel();
        if (activitychoosermodel1 != null && isShown())
        {
            try
            {
                activitychoosermodel1.unregisterObserver(ActivityChooserView.access$10(ActivityChooserView.this));
            }
            catch (IllegalStateException illegalstateexception) { }
        }
        mDataModel = activitychoosermodel;
        if (activitychoosermodel != null && isShown())
        {
            activitychoosermodel.registerObserver(ActivityChooserView.access$10(ActivityChooserView.this));
        }
        notifyDataSetChanged();
    }

    public void setMaxActivityCount(int i)
    {
        if (mMaxActivityCount != i)
        {
            mMaxActivityCount = i;
            notifyDataSetChanged();
        }
    }

    public void setShowDefaultActivity(boolean flag, boolean flag1)
    {
        if (mShowDefaultActivity != flag || mHighlightDefaultActivity != flag1)
        {
            mShowDefaultActivity = flag;
            mHighlightDefaultActivity = flag1;
            notifyDataSetChanged();
        }
    }

    public void setShowFooterView(boolean flag)
    {
        if (mShowFooterView != flag)
        {
            mShowFooterView = flag;
            notifyDataSetChanged();
        }
    }

    private Q()
    {
        this$0 = ActivityChooserView.this;
        super();
        mMaxActivityCount = 4;
    }

    mMaxActivityCount(mMaxActivityCount mmaxactivitycount)
    {
        this();
    }
}
