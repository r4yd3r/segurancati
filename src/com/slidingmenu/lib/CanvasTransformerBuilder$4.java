// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.graphics.Canvas;
import android.view.animation.Interpolator;

// Referenced classes of package com.slidingmenu.lib:
//            CanvasTransformerBuilder

class val.py
    implements er
{

    final CanvasTransformerBuilder this$0;
    private final int val$closedDeg;
    private final Interpolator val$interp;
    private final int val$openedDeg;
    private final int val$px;
    private final int val$py;

    public void transformCanvas(Canvas canvas, float f)
    {
        CanvasTransformerBuilder.access$0(CanvasTransformerBuilder.this).transformCanvas(canvas, f);
        canvas.rotate(val$interp.getInterpolation(f) * (float)(val$openedDeg - val$closedDeg) + (float)val$closedDeg, val$px, val$py);
    }

    er()
    {
        this$0 = final_canvastransformerbuilder;
        val$interp = interpolator;
        val$openedDeg = i;
        val$closedDeg = j;
        val$px = k;
        val$py = I.this;
        super();
    }
}
