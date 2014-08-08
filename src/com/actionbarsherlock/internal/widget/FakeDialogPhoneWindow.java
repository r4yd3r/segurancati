// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.LinearLayout;

public class FakeDialogPhoneWindow extends LinearLayout
{

    final TypedValue mMinWidthMajor = new TypedValue();
    final TypedValue mMinWidthMinor = new TypedValue();

    public FakeDialogPhoneWindow(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockTheme);
        typedarray.getValue(49, mMinWidthMajor);
        typedarray.getValue(50, mMinWidthMinor);
        typedarray.recycle();
    }

    protected void onMeasure(int i, int j)
    {
        DisplayMetrics displaymetrics = getContext().getResources().getDisplayMetrics();
        boolean flag;
        int k;
        int l;
        TypedValue typedvalue;
        int i1;
        boolean flag1;
        if (displaymetrics.widthPixels < displaymetrics.heightPixels)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        super.onMeasure(i, j);
        k = getMeasuredWidth();
        l = android.view.View.MeasureSpec.makeMeasureSpec(k, 0x40000000);
        if (flag)
        {
            typedvalue = mMinWidthMinor;
        } else
        {
            typedvalue = mMinWidthMajor;
        }
        i1 = typedvalue.type;
        flag1 = false;
        if (i1 != 0)
        {
            int j1;
            if (typedvalue.type == 5)
            {
                j1 = (int)typedvalue.getDimension(displaymetrics);
            } else
            if (typedvalue.type == 6)
            {
                j1 = (int)typedvalue.getFraction(displaymetrics.widthPixels, displaymetrics.widthPixels);
            } else
            {
                j1 = 0;
            }
            flag1 = false;
            if (k < j1)
            {
                l = android.view.View.MeasureSpec.makeMeasureSpec(j1, 0x40000000);
                flag1 = true;
            }
        }
        if (flag1)
        {
            super.onMeasure(l, j);
        }
    }
}
