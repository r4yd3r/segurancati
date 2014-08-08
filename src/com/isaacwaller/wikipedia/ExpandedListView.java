// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ListView;

public class ExpandedListView extends ListView
{

    private int old_count;
    private android.view.ViewGroup.LayoutParams params;

    public ExpandedListView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        old_count = 0;
    }

    protected void onDraw(Canvas canvas)
    {
        if (getCount() != old_count)
        {
            old_count = getCount();
            params = getLayoutParams();
            android.view.ViewGroup.LayoutParams layoutparams = params;
            int i = getCount();
            int j = old_count;
            int k = 0;
            if (j > 0)
            {
                k = getChildAt(0).getHeight();
            }
            layoutparams.height = k * i;
            setLayoutParams(params);
        }
        super.onDraw(canvas);
    }
}
