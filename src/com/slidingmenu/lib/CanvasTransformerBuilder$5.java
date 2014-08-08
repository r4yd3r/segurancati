// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.graphics.Canvas;
import android.view.animation.Interpolator;

// Referenced classes of package com.slidingmenu.lib:
//            CanvasTransformerBuilder

class val.closedY
    implements er
{

    final CanvasTransformerBuilder this$0;
    private final int val$closedX;
    private final int val$closedY;
    private final Interpolator val$interp;
    private final int val$openedX;
    private final int val$openedY;

    public void transformCanvas(Canvas canvas, float f)
    {
        CanvasTransformerBuilder.access$0(CanvasTransformerBuilder.this).transformCanvas(canvas, f);
        float f1 = val$interp.getInterpolation(f);
        canvas.translate(f1 * (float)(val$openedX - val$closedX) + (float)val$closedX, f1 * (float)(val$openedY - val$closedY) + (float)val$closedY);
    }

    er()
    {
        this$0 = final_canvastransformerbuilder;
        val$interp = interpolator;
        val$openedX = i;
        val$closedX = j;
        val$openedY = k;
        val$closedY = I.this;
        super();
    }
}
