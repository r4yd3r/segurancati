// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.graphics.Canvas;
import android.view.animation.Interpolator;

public class CanvasTransformerBuilder
{

    private static Interpolator lin = new Interpolator() {

        public float getInterpolation(float f)
        {
            return f;
        }

    };
    private SlidingMenu.CanvasTransformer mTrans;

    public CanvasTransformerBuilder()
    {
    }

    private void initTransformer()
    {
        if (mTrans == null)
        {
            mTrans = new SlidingMenu.CanvasTransformer() {

                final CanvasTransformerBuilder this$0;

                public void transformCanvas(Canvas canvas, float f)
                {
                }

            
            {
                this$0 = CanvasTransformerBuilder.this;
                super();
            }
            };
        }
    }

    public SlidingMenu.CanvasTransformer concatTransformer(final SlidingMenu.CanvasTransformer t)
    {
        initTransformer();
        mTrans = new SlidingMenu.CanvasTransformer() {

            final CanvasTransformerBuilder this$0;
            private final SlidingMenu.CanvasTransformer val$t;

            public void transformCanvas(Canvas canvas, float f)
            {
                mTrans.transformCanvas(canvas, f);
                t.transformCanvas(canvas, f);
            }

            
            {
                this$0 = CanvasTransformerBuilder.this;
                t = canvastransformer;
                super();
            }
        };
        return mTrans;
    }

    public SlidingMenu.CanvasTransformer rotate(int i, int j, int k, int l)
    {
        return rotate(i, j, k, l, lin);
    }

    public SlidingMenu.CanvasTransformer rotate(final int openedDeg, final int closedDeg, final int px, final int py, final Interpolator interp)
    {
        initTransformer();
        mTrans = new SlidingMenu.CanvasTransformer() {

            final CanvasTransformerBuilder this$0;
            private final int val$closedDeg;
            private final Interpolator val$interp;
            private final int val$openedDeg;
            private final int val$px;
            private final int val$py;

            public void transformCanvas(Canvas canvas, float f)
            {
                mTrans.transformCanvas(canvas, f);
                canvas.rotate(interp.getInterpolation(f) * (float)(openedDeg - closedDeg) + (float)closedDeg, px, py);
            }

            
            {
                this$0 = CanvasTransformerBuilder.this;
                interp = interpolator;
                openedDeg = i;
                closedDeg = j;
                px = k;
                py = l;
                super();
            }
        };
        return mTrans;
    }

    public SlidingMenu.CanvasTransformer translate(int i, int j, int k, int l)
    {
        return translate(i, j, k, l, lin);
    }

    public SlidingMenu.CanvasTransformer translate(final int openedX, final int closedX, final int openedY, final int closedY, final Interpolator interp)
    {
        initTransformer();
        mTrans = new SlidingMenu.CanvasTransformer() {

            final CanvasTransformerBuilder this$0;
            private final int val$closedX;
            private final int val$closedY;
            private final Interpolator val$interp;
            private final int val$openedX;
            private final int val$openedY;

            public void transformCanvas(Canvas canvas, float f)
            {
                mTrans.transformCanvas(canvas, f);
                float f1 = interp.getInterpolation(f);
                canvas.translate(f1 * (float)(openedX - closedX) + (float)closedX, f1 * (float)(openedY - closedY) + (float)closedY);
            }

            
            {
                this$0 = CanvasTransformerBuilder.this;
                interp = interpolator;
                openedX = i;
                closedX = j;
                openedY = k;
                closedY = l;
                super();
            }
        };
        return mTrans;
    }

    public SlidingMenu.CanvasTransformer zoom(int i, int j, int k, int l, int i1, int j1)
    {
        return zoom(i, j, k, l, i1, j1, lin);
    }

    public SlidingMenu.CanvasTransformer zoom(final int openedX, final int closedX, final int openedY, final int closedY, final int px, final int py, final Interpolator interp)
    {
        initTransformer();
        mTrans = new SlidingMenu.CanvasTransformer() {

            final CanvasTransformerBuilder this$0;
            private final int val$closedX;
            private final int val$closedY;
            private final Interpolator val$interp;
            private final int val$openedX;
            private final int val$openedY;
            private final int val$px;
            private final int val$py;

            public void transformCanvas(Canvas canvas, float f)
            {
                mTrans.transformCanvas(canvas, f);
                float f1 = interp.getInterpolation(f);
                canvas.scale(f1 * (float)(openedX - closedX) + (float)closedX, f1 * (float)(openedY - closedY) + (float)closedY, px, py);
            }

            
            {
                this$0 = CanvasTransformerBuilder.this;
                interp = interpolator;
                openedX = i;
                closedX = j;
                openedY = k;
                closedY = l;
                px = i1;
                py = j1;
                super();
            }
        };
        return mTrans;
    }


}
