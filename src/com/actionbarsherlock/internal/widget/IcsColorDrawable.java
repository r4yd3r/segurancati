// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;

public class IcsColorDrawable extends Drawable
{

    private int color;
    private final Paint paint = new Paint();

    public IcsColorDrawable(int i)
    {
        color = i;
    }

    public void draw(Canvas canvas)
    {
        if (color >>> 24 != 0)
        {
            paint.setColor(color);
            canvas.drawRect(getBounds(), paint);
        }
    }

    public int getOpacity()
    {
        return color >>> 24;
    }

    public void setAlpha(int i)
    {
        if (i != color >>> 24)
        {
            color = 0xffffff & color & i << 24;
            invalidateSelf();
        }
    }

    public void setColorFilter(ColorFilter colorfilter)
    {
    }
}
