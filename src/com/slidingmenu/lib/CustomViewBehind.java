// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

// Referenced classes of package com.slidingmenu.lib:
//            CustomViewAbove

public class CustomViewBehind extends ViewGroup
{

    private static final int MARGIN_THRESHOLD = 20;
    private static final String TAG = "CustomViewBehind";
    private boolean mChildrenEnabled;
    private View mContent;
    private float mFadeDegree;
    private boolean mFadeEnabled;
    private final Paint mFadePaint;
    private int mMarginThreshold;
    private int mMode;
    private float mScrollScale;
    private View mSecondaryContent;
    private Drawable mSecondaryShadowDrawable;
    private Drawable mShadowDrawable;
    private int mShadowWidth;
    private SlidingMenu.CanvasTransformer mTransformer;
    private CustomViewAbove mViewAbove;
    private int mWidthOffset;

    public CustomViewBehind(Context context)
    {
        this(context, null);
    }

    public CustomViewBehind(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mFadePaint = new Paint();
        mMarginThreshold = (int)TypedValue.applyDimension(1, 20F, getResources().getDisplayMetrics());
    }

    protected void dispatchDraw(Canvas canvas)
    {
        if (mTransformer != null)
        {
            canvas.save();
            mTransformer.transformCanvas(canvas, mViewAbove.getPercentOpen());
            super.dispatchDraw(canvas);
            canvas.restore();
            return;
        } else
        {
            super.dispatchDraw(canvas);
            return;
        }
    }

    public void drawFade(View view, Canvas canvas, float f)
    {
        if (!mFadeEnabled)
        {
            return;
        }
        int i = (int)(255F * mFadeDegree * Math.abs(1.0F - f));
        mFadePaint.setColor(Color.argb(i, 0, 0, 0));
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        int k;
        int l;
        k = view.getLeft() - getBehindWidth();
        l = view.getLeft();
_L4:
        canvas.drawRect(k, 0.0F, l, getHeight(), mFadePaint);
        return;
_L2:
        if (mMode == 1)
        {
            k = view.getRight();
            l = view.getRight() + getBehindWidth();
        } else
        {
            int j = mMode;
            k = 0;
            l = 0;
            if (j == 2)
            {
                int i1 = view.getLeft() - getBehindWidth();
                int j1 = view.getLeft();
                canvas.drawRect(i1, 0.0F, j1, getHeight(), mFadePaint);
                k = view.getRight();
                l = view.getRight() + getBehindWidth();
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void drawShadow(View view, Canvas canvas)
    {
        if (mShadowDrawable == null || mShadowWidth <= 0)
        {
            return;
        }
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        int j = view.getLeft() - mShadowWidth;
_L4:
        mShadowDrawable.setBounds(j, 0, j + mShadowWidth, getHeight());
        mShadowDrawable.draw(canvas);
        return;
_L2:
        if (mMode == 1)
        {
            j = view.getRight();
        } else
        {
            int i = mMode;
            j = 0;
            if (i == 2)
            {
                if (mSecondaryShadowDrawable != null)
                {
                    int k = view.getRight();
                    mSecondaryShadowDrawable.setBounds(k, 0, k + mShadowWidth, getHeight());
                    mSecondaryShadowDrawable.draw(canvas);
                }
                j = view.getLeft() - mShadowWidth;
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public int getAbsLeftBound(View view)
    {
        if (mMode == 0 || mMode == 2)
        {
            return view.getLeft() - getBehindWidth();
        }
        if (mMode == 1)
        {
            return view.getLeft();
        } else
        {
            return 0;
        }
    }

    public int getAbsRightBound(View view)
    {
        if (mMode == 0)
        {
            return view.getLeft();
        }
        if (mMode == 1 || mMode == 2)
        {
            return view.getLeft() + getBehindWidth();
        } else
        {
            return 0;
        }
    }

    public int getBehindWidth()
    {
        return mContent.getWidth();
    }

    public View getContent()
    {
        return mContent;
    }

    public int getMenuLeft(View view, int i)
    {
        if (mMode == 0)
        {
            return view.getLeft() - getBehindWidth();
        }
        if (mMode == 1)
        {
            return view.getLeft() + getBehindWidth();
        }
        if (mMode != 2) goto _L2; else goto _L1
_L1:
        i;
        JVM INSTR tableswitch 0 2: default 72
    //                   0 74
    //                   1 72
    //                   2 84;
           goto _L2 _L3 _L2 _L4
_L2:
        return 0;
_L3:
        return view.getLeft() - getBehindWidth();
_L4:
        return view.getLeft() + getBehindWidth();
    }

    public int getMenuPage(int i)
    {
        if (i <= 1) goto _L2; else goto _L1
_L1:
        i = 2;
_L4:
        if (mMode == 0 && i > 1)
        {
            return 0;
        }
        break; /* Loop/switch isn't completed */
_L2:
        if (i < 1)
        {
            i = 0;
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (mMode == 1 && i < 1)
        {
            return 2;
        } else
        {
            return i;
        }
    }

    public int getMode()
    {
        return mMode;
    }

    public float getScrollScale()
    {
        return mScrollScale;
    }

    public View getSecondaryContent()
    {
        return mSecondaryContent;
    }

    public boolean marginTouchAllowed(View view, int i)
    {
        int j;
        int k;
        j = view.getLeft();
        k = view.getRight();
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        if (i < j || i > j + mMarginThreshold) goto _L4; else goto _L3
_L3:
        return true;
_L4:
        return false;
_L2:
        if (mMode != 1)
        {
            break; /* Loop/switch isn't completed */
        }
        if (i > k || i < k - mMarginThreshold)
        {
            return false;
        }
        if (true) goto _L3; else goto _L5
_L5:
        if (mMode == 2)
        {
            if ((i < j || i > j + mMarginThreshold) && (i > k || i < k - mMarginThreshold))
            {
                return false;
            }
        } else
        {
            return false;
        }
        if (true) goto _L3; else goto _L6
_L6:
    }

    public boolean menuClosedSlideAllowed(float f)
    {
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        if (f <= 0.0F) goto _L4; else goto _L3
_L3:
        return true;
_L4:
        return false;
_L2:
        if (mMode != 1)
        {
            continue; /* Loop/switch isn't completed */
        }
        if (f < 0.0F) goto _L3; else goto _L5
_L5:
        return false;
        if (mMode == 2) goto _L3; else goto _L6
_L6:
        return false;
    }

    public boolean menuOpenSlideAllowed(float f)
    {
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        if (f >= 0.0F) goto _L4; else goto _L3
_L3:
        return true;
_L4:
        return false;
_L2:
        if (mMode != 1)
        {
            continue; /* Loop/switch isn't completed */
        }
        if (f > 0.0F) goto _L3; else goto _L5
_L5:
        return false;
        if (mMode == 2) goto _L3; else goto _L6
_L6:
        return false;
    }

    public boolean menuOpenTouchAllowed(View view, int i, int j)
    {
        if (mMode != 0 && (mMode != 2 || i != 0)) goto _L2; else goto _L1
_L1:
        boolean flag;
        int k = view.getLeft();
        flag = false;
        if (j >= k)
        {
            flag = true;
        }
_L4:
        return flag;
_L2:
        if (mMode == 1)
        {
            break; /* Loop/switch isn't completed */
        }
        int i1 = mMode;
        flag = false;
        if (i1 != 2)
        {
            continue; /* Loop/switch isn't completed */
        }
        flag = false;
        if (i != 2) goto _L4; else goto _L3
_L3:
        int l = view.getRight();
        flag = false;
        if (j <= l)
        {
            return true;
        }
        if (true) goto _L4; else goto _L5
_L5:
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return false;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = k - i;
        int j1 = l - j;
        mContent.layout(0, 0, i1 - mWidthOffset, j1);
        if (mSecondaryContent != null)
        {
            mSecondaryContent.layout(0, 0, i1 - mWidthOffset, j1);
        }
    }

    protected void onMeasure(int i, int j)
    {
        int k = getDefaultSize(0, i);
        int l = getDefaultSize(0, j);
        setMeasuredDimension(k, l);
        int i1 = getChildMeasureSpec(i, 0, k - mWidthOffset);
        int j1 = getChildMeasureSpec(j, 0, l);
        mContent.measure(i1, j1);
        if (mSecondaryContent != null)
        {
            mSecondaryContent.measure(i1, j1);
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mChildrenEnabled;
    }

    public void scrollBehindTo(View view, int i, int j)
    {
        if (mMode != 0) goto _L2; else goto _L1
_L1:
        byte byte0;
        int i1 = view.getLeft();
        byte0 = 0;
        if (i >= i1)
        {
            byte0 = 8;
        }
        scrollTo((int)((float)(i + getBehindWidth()) * mScrollScale), j);
_L4:
        setVisibility(byte0);
        return;
_L2:
        if (mMode == 1)
        {
            int l = view.getLeft();
            byte0 = 0;
            if (i <= l)
            {
                byte0 = 8;
            }
            scrollTo((int)((float)(getBehindWidth() - getWidth()) + (float)(i - getBehindWidth()) * mScrollScale), j);
        } else
        {
            int k = mMode;
            byte0 = 0;
            if (k == 2)
            {
                View view1 = mContent;
                byte byte1;
                View view2;
                byte byte2;
                if (i >= view.getLeft())
                {
                    byte1 = 8;
                } else
                {
                    byte1 = 0;
                }
                view1.setVisibility(byte1);
                view2 = mSecondaryContent;
                if (i <= view.getLeft())
                {
                    byte2 = 8;
                } else
                {
                    byte2 = 0;
                }
                view2.setVisibility(byte2);
                if (i == 0)
                {
                    byte0 = 8;
                } else
                {
                    byte0 = 0;
                }
                if (i <= view.getLeft())
                {
                    scrollTo((int)((float)(i + getBehindWidth()) * mScrollScale), j);
                } else
                {
                    scrollTo((int)((float)(getBehindWidth() - getWidth()) + (float)(i - getBehindWidth()) * mScrollScale), j);
                }
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void scrollTo(int i, int j)
    {
        super.scrollTo(i, j);
        if (mTransformer != null)
        {
            invalidate();
        }
    }

    public void setCanvasTransformer(SlidingMenu.CanvasTransformer canvastransformer)
    {
        mTransformer = canvastransformer;
    }

    public void setChildrenEnabled(boolean flag)
    {
        mChildrenEnabled = flag;
    }

    public void setContent(View view)
    {
        if (mContent != null)
        {
            removeView(mContent);
        }
        mContent = view;
        addView(mContent);
    }

    public void setCustomViewAbove(CustomViewAbove customviewabove)
    {
        mViewAbove = customviewabove;
    }

    public void setFadeDegree(float f)
    {
        if (f > 1.0F || f < 0.0F)
        {
            throw new IllegalStateException("The BehindFadeDegree must be between 0.0f and 1.0f");
        } else
        {
            mFadeDegree = f;
            return;
        }
    }

    public void setFadeEnabled(boolean flag)
    {
        mFadeEnabled = flag;
    }

    public void setMode(int i)
    {
        if (i == 0 || i == 1)
        {
            if (mContent != null)
            {
                mContent.setVisibility(0);
            }
            if (mSecondaryContent != null)
            {
                mSecondaryContent.setVisibility(8);
            }
        }
        mMode = i;
    }

    public void setScrollScale(float f)
    {
        mScrollScale = f;
    }

    public void setSecondaryContent(View view)
    {
        if (mSecondaryContent != null)
        {
            removeView(mSecondaryContent);
        }
        mSecondaryContent = view;
        addView(mSecondaryContent);
    }

    public void setSecondaryShadowDrawable(Drawable drawable)
    {
        mSecondaryShadowDrawable = drawable;
        invalidate();
    }

    public void setShadowDrawable(Drawable drawable)
    {
        mShadowDrawable = drawable;
        invalidate();
    }

    public void setShadowWidth(int i)
    {
        mShadowWidth = i;
        invalidate();
    }

    public void setWidthOffset(int i)
    {
        mWidthOffset = i;
        requestLayout();
    }
}
