// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v4.view.KeyEventCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.FloatMath;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.slidingmenu.lib:
//            CustomViewBehind

public class CustomViewAbove extends ViewGroup
{
    public static interface OnPageChangeListener
    {

        public abstract void onPageScrolled(int i, float f, int j);

        public abstract void onPageSelected(int i);
    }

    public static class SimpleOnPageChangeListener
        implements OnPageChangeListener
    {

        public void onPageScrollStateChanged(int i)
        {
        }

        public void onPageScrolled(int i, float f, int j)
        {
        }

        public void onPageSelected(int i)
        {
        }

        public SimpleOnPageChangeListener()
        {
        }
    }


    private static final boolean DEBUG = false;
    private static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    private static final int MIN_DISTANCE_FOR_FLING = 25;
    private static final String TAG = "CustomViewAbove";
    private static final boolean USE_CACHE;
    private static final Interpolator sInterpolator = new Interpolator() {

        public float getInterpolation(float f)
        {
            float f1 = f - 1.0F;
            return 1.0F + f1 * (f1 * (f1 * (f1 * f1)));
        }

    };
    protected int mActivePointerId;
    private SlidingMenu.OnClosedListener mClosedListener;
    private View mContent;
    private int mCurItem;
    private CustomViewBehind mCustomViewBehind;
    private boolean mEnabled;
    private int mFlingDistance;
    private List mIgnoredViews;
    private float mInitialMotionX;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private float mLastMotionX;
    private float mLastMotionY;
    protected int mMaximumVelocity;
    private int mMinimumVelocity;
    private OnPageChangeListener mOnPageChangeListener;
    private SlidingMenu.OnOpenedListener mOpenedListener;
    private float mScrollX;
    private Scroller mScroller;
    private boolean mScrolling;
    private boolean mScrollingCacheEnabled;
    private View mSelectedView;
    private Bitmap mSelectorDrawable;
    private boolean mSelectorEnabled;
    protected int mTouchMode;
    private int mTouchSlop;
    protected VelocityTracker mVelocityTracker;

    public CustomViewAbove(Context context)
    {
        this(context, null);
    }

    public CustomViewAbove(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, true);
    }

    public CustomViewAbove(Context context, AttributeSet attributeset, boolean flag)
    {
        super(context, attributeset);
        mActivePointerId = -1;
        mEnabled = true;
        mIgnoredViews = new ArrayList();
        mTouchMode = 0;
        mScrollX = 0.0F;
        mSelectorEnabled = true;
        initCustomViewAbove();
    }

    private void completeScroll()
    {
        if (!mScrolling) goto _L2; else goto _L1
_L1:
        setScrollingCacheEnabled(false);
        mScroller.abortAnimation();
        int i = getScrollX();
        int j = getScrollY();
        int k = mScroller.getCurrX();
        int l = mScroller.getCurrY();
        if (i != k || j != l)
        {
            scrollTo(k, l);
        }
        if (!isMenuOpen()) goto _L4; else goto _L3
_L3:
        if (mOpenedListener != null)
        {
            mOpenedListener.onOpened();
        }
_L2:
        mScrolling = false;
        return;
_L4:
        if (mClosedListener != null)
        {
            mClosedListener.onClosed();
        }
        if (true) goto _L2; else goto _L5
_L5:
    }

    private int determineTargetPage(float f, int i, int j)
    {
        int k;
        k = mCurItem;
        if (Math.abs(j) <= mFlingDistance || Math.abs(i) <= mMinimumVelocity)
        {
            break MISSING_BLOCK_LABEL_55;
        }
        if (i <= 0 || j <= 0) goto _L2; else goto _L1
_L1:
        k--;
_L4:
        return k;
_L2:
        if (i >= 0 || j >= 0) goto _L4; else goto _L3
_L3:
        return k + 1;
        return Math.round(f + (float)mCurItem);
    }

    private void endDrag()
    {
        mIsBeingDragged = false;
        mIsUnableToDrag = false;
        mActivePointerId = -1;
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    private int getLeftBound()
    {
        return mCustomViewBehind.getAbsLeftBound(mContent);
    }

    private int getPointerIndex(MotionEvent motionevent, int i)
    {
        int j = MotionEventCompat.findPointerIndex(motionevent, i);
        if (j == -1)
        {
            mActivePointerId = -1;
        }
        return j;
    }

    private int getRightBound()
    {
        return mCustomViewBehind.getAbsRightBound(mContent);
    }

    private int getSelectedTop()
    {
        return mSelectedView.getTop() + (mSelectedView.getHeight() - mSelectorDrawable.getHeight()) / 2;
    }

    private boolean isInIgnoredView(MotionEvent motionevent)
    {
        Rect rect = new Rect();
        Iterator iterator = mIgnoredViews.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return false;
            }
            ((View)iterator.next()).getHitRect(rect);
        } while (!rect.contains((int)motionevent.getX(), (int)motionevent.getY()));
        return true;
    }

    private void onDrawMenuSelector(Canvas canvas, float f)
    {
        if (mSelectorDrawable != null && mSelectedView != null && ((String)mSelectedView.getTag(R.id.selected_view)).equals("CustomViewAboveSelectedView"))
        {
            int i = getContentLeft();
            int j = (int)((float)i - f * (float)mSelectorDrawable.getWidth());
            canvas.save();
            canvas.clipRect(j, 0, i, getHeight());
            canvas.drawBitmap(mSelectorDrawable, j, getSelectedTop(), null);
            canvas.restore();
        }
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = MotionEventCompat.getActionIndex(motionevent);
        if (MotionEventCompat.getPointerId(motionevent, i) == mActivePointerId)
        {
            int j;
            if (i == 0)
            {
                j = 1;
            } else
            {
                j = 0;
            }
            mLastMotionX = MotionEventCompat.getX(motionevent, j);
            mActivePointerId = MotionEventCompat.getPointerId(motionevent, j);
            if (mVelocityTracker != null)
            {
                mVelocityTracker.clear();
            }
        }
    }

    private void pageScrolled(int i)
    {
        int j = getWidth();
        int k = i / j;
        int l = i % j;
        onPageScrolled(k, (float)l / (float)j, l);
    }

    private void setScrollingCacheEnabled(boolean flag)
    {
        if (mScrollingCacheEnabled != flag)
        {
            mScrollingCacheEnabled = flag;
        }
    }

    private boolean thisSlideAllowed(float f)
    {
        if (isMenuOpen())
        {
            return mCustomViewBehind.menuOpenSlideAllowed(f);
        } else
        {
            return mCustomViewBehind.menuClosedSlideAllowed(f);
        }
    }

    private boolean thisTouchAllowed(MotionEvent motionevent)
    {
        int i = (int)(motionevent.getX() + mScrollX);
        if (!isMenuOpen()) goto _L2; else goto _L1
_L1:
        boolean flag = mCustomViewBehind.menuOpenTouchAllowed(mContent, mCurItem, i);
_L4:
        return flag;
_L2:
        boolean flag1;
        int j = mTouchMode;
        flag = false;
        switch (j)
        {
        default:
            return false;

        case 2: // '\002'
            break;

        case 0: // '\0'
            return mCustomViewBehind.marginTouchAllowed(mContent, i);

        case 1: // '\001'
            flag1 = isInIgnoredView(motionevent);
            break; /* Loop/switch isn't completed */
        }
        if (true) goto _L4; else goto _L3
_L3:
        flag = false;
        if (!flag1)
        {
            return true;
        }
        if (true) goto _L4; else goto _L5
_L5:
    }

    public void addIgnoredView(View view)
    {
        if (!mIgnoredViews.contains(view))
        {
            mIgnoredViews.add(view);
        }
    }

    public boolean arrowScroll(int i)
    {
        View view;
        View view1;
        view = findFocus();
        if (view == this)
        {
            view = null;
        }
        view1 = FocusFinder.getInstance().findNextFocus(this, view, i);
        if (view1 == null || view1 == view) goto _L2; else goto _L1
_L1:
        if (i != 17) goto _L4; else goto _L3
_L3:
        boolean flag = view1.requestFocus();
_L6:
        if (flag)
        {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return flag;
_L4:
        flag = false;
        if (i == 66)
        {
            if (view != null && view1.getLeft() <= view.getLeft())
            {
                flag = pageRight();
            } else
            {
                flag = view1.requestFocus();
            }
        }
        continue; /* Loop/switch isn't completed */
_L2:
        if (i == 17 || i == 1)
        {
            flag = pageLeft();
            continue; /* Loop/switch isn't completed */
        }
        if (i != 66)
        {
            flag = false;
            if (i != 2)
            {
                continue; /* Loop/switch isn't completed */
            }
        }
        flag = pageRight();
        if (true) goto _L6; else goto _L5
_L5:
    }

    protected boolean canScroll(View view, boolean flag, int i, int j, int k)
    {
        if (!(view instanceof ViewGroup)) goto _L2; else goto _L1
_L1:
        ViewGroup viewgroup;
        int l;
        int i1;
        int j1;
        viewgroup = (ViewGroup)view;
        l = view.getScrollX();
        i1 = view.getScrollY();
        j1 = -1 + viewgroup.getChildCount();
_L5:
        if (j1 >= 0) goto _L3; else goto _L2
_L2:
        View view1;
        return flag && ViewCompat.canScrollHorizontally(view, -i);
_L3:
        view1 = viewgroup.getChildAt(j1);
        if (j + l >= view1.getLeft() && j + l < view1.getRight() && k + i1 >= view1.getTop() && k + i1 < view1.getBottom() && canScroll(view1, true, i, (j + l) - view1.getLeft(), (k + i1) - view1.getTop()))
        {
            return true;
        }
        j1--;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public void clearIgnoredViews()
    {
        mIgnoredViews.clear();
    }

    public void computeScroll()
    {
        if (!mScroller.isFinished() && mScroller.computeScrollOffset())
        {
            int i = getScrollX();
            int j = getScrollY();
            int k = mScroller.getCurrX();
            int l = mScroller.getCurrY();
            if (i != k || j != l)
            {
                scrollTo(k, l);
                pageScrolled(k);
            }
            invalidate();
            return;
        } else
        {
            completeScroll();
            return;
        }
    }

    protected void dispatchDraw(Canvas canvas)
    {
        super.dispatchDraw(canvas);
        mCustomViewBehind.drawShadow(mContent, canvas);
        mCustomViewBehind.drawFade(mContent, canvas, getPercentOpen());
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        return super.dispatchKeyEvent(keyevent) || executeKeyEvent(keyevent);
    }

    float distanceInfluenceForSnapDuration(float f)
    {
        return FloatMath.sin((float)(0.4712389167638204D * (double)(f - 0.5F)));
    }

    public boolean executeKeyEvent(KeyEvent keyevent)
    {
        if (keyevent.getAction() != 0) goto _L2; else goto _L1
_L1:
        keyevent.getKeyCode();
        JVM INSTR lookupswitch 3: default 44
    //                   21: 46
    //                   22: 53
    //                   61: 60;
           goto _L2 _L3 _L4 _L5
_L2:
        return false;
_L3:
        return arrowScroll(17);
_L4:
        return arrowScroll(66);
_L5:
        if (android.os.Build.VERSION.SDK_INT >= 11)
        {
            if (KeyEventCompat.hasNoModifiers(keyevent))
            {
                return arrowScroll(2);
            }
            if (KeyEventCompat.hasModifiers(keyevent, 1))
            {
                return arrowScroll(1);
            }
        }
        if (true) goto _L2; else goto _L6
_L6:
    }

    public int getBehindWidth()
    {
        if (mCustomViewBehind == null)
        {
            return 0;
        } else
        {
            return mCustomViewBehind.getBehindWidth();
        }
    }

    public int getChildWidth(int i)
    {
        switch (i)
        {
        default:
            return 0;

        case 0: // '\0'
            return getBehindWidth();

        case 1: // '\001'
            return mContent.getWidth();
        }
    }

    public View getContent()
    {
        return mContent;
    }

    public int getContentLeft()
    {
        return mContent.getLeft() + mContent.getPaddingLeft();
    }

    public int getCurrentItem()
    {
        return mCurItem;
    }

    public int getDestScrollX(int i)
    {
        switch (i)
        {
        default:
            return 0;

        case 0: // '\0'
        case 2: // '\002'
            return mCustomViewBehind.getMenuLeft(mContent, i);

        case 1: // '\001'
            return mContent.getLeft();
        }
    }

    protected float getPercentOpen()
    {
        return Math.abs(mScrollX) / (float)getBehindWidth();
    }

    public int getTouchMode()
    {
        return mTouchMode;
    }

    void initCustomViewAbove()
    {
        setWillNotDraw(false);
        setDescendantFocusability(0x40000);
        setFocusable(true);
        Context context = getContext();
        mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(viewconfiguration);
        mMinimumVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        setInternalPageChangeListener(new SimpleOnPageChangeListener() {

            final CustomViewAbove this$0;

            public void onPageSelected(int i)
            {
                if (mCustomViewBehind == null) goto _L2; else goto _L1
_L1:
                i;
                JVM INSTR tableswitch 0 2: default 36
            //                           0 37
            //                           1 49
            //                           2 37;
                   goto _L2 _L3 _L4 _L3
_L2:
                return;
_L3:
                mCustomViewBehind.setChildrenEnabled(true);
                return;
_L4:
                mCustomViewBehind.setChildrenEnabled(false);
                return;
            }

            
            {
                this$0 = CustomViewAbove.this;
                super();
            }
        });
        mFlingDistance = (int)(25F * context.getResources().getDisplayMetrics().density);
    }

    public boolean isMenuOpen()
    {
        return mCurItem == 0 || mCurItem == 2;
    }

    public boolean isSlidingEnabled()
    {
        return mEnabled;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i;
        if (!mEnabled)
        {
            return false;
        }
        i = 0xff & motionevent.getAction();
        if (i == 3 || i == 1 || i != 0 && mIsUnableToDrag)
        {
            endDrag();
            return false;
        }
        i;
        JVM INSTR lookupswitch 3: default 80
    //                   0: 249
    //                   2: 114
    //                   6: 340;
           goto _L1 _L2 _L3 _L4
_L1:
        if (!mIsBeingDragged)
        {
            if (mVelocityTracker == null)
            {
                mVelocityTracker = VelocityTracker.obtain();
            }
            mVelocityTracker.addMovement(motionevent);
        }
        return mIsBeingDragged;
_L3:
        int k = mActivePointerId;
        if (k != -1)
        {
            int l = getPointerIndex(motionevent, k);
            if (mActivePointerId != -1)
            {
                float f1 = MotionEventCompat.getX(motionevent, l);
                float f2 = f1 - mLastMotionX;
                float f3 = Math.abs(f2);
                float f4 = Math.abs(MotionEventCompat.getY(motionevent, l) - mLastMotionY);
                if (f3 > (float)mTouchSlop && f3 > f4 && thisSlideAllowed(f2))
                {
                    mIsBeingDragged = true;
                    mLastMotionX = f1;
                    setScrollingCacheEnabled(true);
                } else
                if (f4 > (float)mTouchSlop)
                {
                    mIsUnableToDrag = true;
                }
            }
        }
        continue; /* Loop/switch isn't completed */
_L2:
        int j = motionevent.getAction();
        if (android.os.Build.VERSION.SDK_INT < 8);
        mActivePointerId = j & 0xff00;
        float f = MotionEventCompat.getX(motionevent, mActivePointerId);
        mInitialMotionX = f;
        mLastMotionX = f;
        mLastMotionY = MotionEventCompat.getY(motionevent, mActivePointerId);
        if (thisTouchAllowed(motionevent))
        {
            mIsBeingDragged = false;
            mIsUnableToDrag = false;
            if (isMenuOpen())
            {
                return true;
            }
        } else
        {
            mIsUnableToDrag = true;
        }
        continue; /* Loop/switch isn't completed */
_L4:
        onSecondaryPointerUp(motionevent);
        if (true) goto _L1; else goto _L5
_L5:
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = k - i;
        int j1 = l - j;
        mContent.layout(0, 0, i1, j1);
    }

    protected void onMeasure(int i, int j)
    {
        int k = getDefaultSize(0, i);
        int l = getDefaultSize(0, j);
        setMeasuredDimension(k, l);
        int i1 = getChildMeasureSpec(i, 0, k);
        int j1 = getChildMeasureSpec(j, 0, l);
        mContent.measure(i1, j1);
    }

    protected void onPageScrolled(int i, float f, int j)
    {
        if (mOnPageChangeListener != null)
        {
            mOnPageChangeListener.onPageScrolled(i, f, j);
        }
        if (mInternalPageChangeListener != null)
        {
            mInternalPageChangeListener.onPageScrolled(i, f, j);
        }
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        if (i != k)
        {
            completeScroll();
            scrollTo(getDestScrollX(mCurItem), getScrollY());
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i;
        if (!mEnabled)
        {
            return false;
        }
        if (!mIsBeingDragged && !thisTouchAllowed(motionevent))
        {
            return false;
        }
        i = motionevent.getAction();
        if (mVelocityTracker == null)
        {
            mVelocityTracker = VelocityTracker.obtain();
        }
        mVelocityTracker.addMovement(motionevent);
        i & 0xff;
        JVM INSTR tableswitch 0 6: default 100
    //                   0 102
    //                   1 383
    //                   2 136
    //                   3 532
    //                   4 100
    //                   5 561
    //                   6 590;
           goto _L1 _L2 _L3 _L4 _L5 _L1 _L6 _L7
_L1:
        return true;
_L2:
        completeScroll();
        float f10 = motionevent.getX();
        mInitialMotionX = f10;
        mLastMotionX = f10;
        mActivePointerId = MotionEventCompat.getPointerId(motionevent, 0);
        continue; /* Loop/switch isn't completed */
_L4:
        float f3;
        float f4;
        float f5;
        if (!mIsBeingDragged)
        {
            int k1 = getPointerIndex(motionevent, mActivePointerId);
            if (mActivePointerId == -1)
            {
                continue; /* Loop/switch isn't completed */
            }
            float f6 = MotionEventCompat.getX(motionevent, k1);
            float f7 = f6 - mLastMotionX;
            float f8 = Math.abs(f7);
            float f9 = Math.abs(MotionEventCompat.getY(motionevent, k1) - mLastMotionY);
            if (f8 > (float)mTouchSlop && f8 > f9 && thisSlideAllowed(f7))
            {
                mIsBeingDragged = true;
                mLastMotionX = f6;
                setScrollingCacheEnabled(true);
            }
        }
        if (!mIsBeingDragged)
        {
            continue; /* Loop/switch isn't completed */
        }
        int j1 = getPointerIndex(motionevent, mActivePointerId);
        if (mActivePointerId == -1)
        {
            continue; /* Loop/switch isn't completed */
        }
        float f1 = MotionEventCompat.getX(motionevent, j1);
        float f2 = mLastMotionX - f1;
        mLastMotionX = f1;
        f3 = f2 + (float)getScrollX();
        f4 = getLeftBound();
        f5 = getRightBound();
        if (f3 >= f4) goto _L9; else goto _L8
_L8:
        f3 = f4;
_L10:
        mLastMotionX = mLastMotionX + (f3 - (float)(int)f3);
        scrollTo((int)f3, getScrollY());
        pageScrolled((int)f3);
        continue; /* Loop/switch isn't completed */
_L9:
        if (f3 > f5)
        {
            f3 = f5;
        }
        if (true) goto _L10; else goto _L3
_L3:
        if (mIsBeingDragged)
        {
            VelocityTracker velocitytracker = mVelocityTracker;
            velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
            int l = (int)VelocityTrackerCompat.getXVelocity(velocitytracker, mActivePointerId);
            float f = (float)(getScrollX() - getDestScrollX(mCurItem)) / (float)getBehindWidth();
            int i1 = getPointerIndex(motionevent, mActivePointerId);
            if (mActivePointerId != -1)
            {
                setCurrentItemInternal(determineTargetPage(f, l, (int)(MotionEventCompat.getX(motionevent, i1) - mInitialMotionX)), true, true, l);
            } else
            {
                setCurrentItemInternal(mCurItem, true, true, l);
            }
            mActivePointerId = -1;
            endDrag();
        } else
        if (isMenuOpen())
        {
            setCurrentItem(1);
        }
        continue; /* Loop/switch isn't completed */
_L5:
        if (mIsBeingDragged)
        {
            setCurrentItemInternal(mCurItem, true, true);
            mActivePointerId = -1;
            endDrag();
        }
        continue; /* Loop/switch isn't completed */
_L6:
        int k = MotionEventCompat.getActionIndex(motionevent);
        mLastMotionX = MotionEventCompat.getX(motionevent, k);
        mActivePointerId = MotionEventCompat.getPointerId(motionevent, k);
        continue; /* Loop/switch isn't completed */
_L7:
        onSecondaryPointerUp(motionevent);
        int j = getPointerIndex(motionevent, mActivePointerId);
        if (mActivePointerId != -1)
        {
            mLastMotionX = MotionEventCompat.getX(motionevent, j);
        }
        if (true) goto _L1; else goto _L11
_L11:
    }

    boolean pageLeft()
    {
        if (mCurItem > 0)
        {
            setCurrentItem(-1 + mCurItem, true);
            return true;
        } else
        {
            return false;
        }
    }

    boolean pageRight()
    {
        if (mCurItem < 1)
        {
            setCurrentItem(1 + mCurItem, true);
            return true;
        } else
        {
            return false;
        }
    }

    public void removeIgnoredView(View view)
    {
        mIgnoredViews.remove(view);
    }

    public void scrollTo(int i, int j)
    {
        super.scrollTo(i, j);
        mScrollX = i;
        if (mEnabled)
        {
            mCustomViewBehind.scrollBehindTo(mContent, i, j);
        }
    }

    public void setAboveOffset(int i)
    {
        mContent.setPadding(i, mContent.getPaddingTop(), mContent.getPaddingRight(), mContent.getPaddingBottom());
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

    public void setCurrentItem(int i)
    {
        setCurrentItemInternal(i, true, false);
    }

    public void setCurrentItem(int i, boolean flag)
    {
        setCurrentItemInternal(i, flag, false);
    }

    void setCurrentItemInternal(int i, boolean flag, boolean flag1)
    {
        setCurrentItemInternal(i, flag, flag1, 0);
    }

    void setCurrentItemInternal(int i, boolean flag, boolean flag1, int j)
    {
        if (!flag1 && mCurItem == i)
        {
            setScrollingCacheEnabled(false);
            return;
        }
        int k = mCustomViewBehind.getMenuPage(i);
        boolean flag2;
        int l;
        if (mCurItem != k)
        {
            flag2 = true;
        } else
        {
            flag2 = false;
        }
        mCurItem = k;
        l = getDestScrollX(mCurItem);
        if (flag2 && mOnPageChangeListener != null)
        {
            mOnPageChangeListener.onPageSelected(k);
        }
        if (flag2 && mInternalPageChangeListener != null)
        {
            mInternalPageChangeListener.onPageSelected(k);
        }
        if (flag)
        {
            smoothScrollTo(l, 0, j);
            return;
        } else
        {
            completeScroll();
            scrollTo(l, 0);
            return;
        }
    }

    public void setCustomViewBehind(CustomViewBehind customviewbehind)
    {
        mCustomViewBehind = customviewbehind;
    }

    OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener onpagechangelistener)
    {
        OnPageChangeListener onpagechangelistener1 = mInternalPageChangeListener;
        mInternalPageChangeListener = onpagechangelistener;
        return onpagechangelistener1;
    }

    public void setOnClosedListener(SlidingMenu.OnClosedListener onclosedlistener)
    {
        mClosedListener = onclosedlistener;
    }

    public void setOnOpenedListener(SlidingMenu.OnOpenedListener onopenedlistener)
    {
        mOpenedListener = onopenedlistener;
    }

    public void setOnPageChangeListener(OnPageChangeListener onpagechangelistener)
    {
        mOnPageChangeListener = onpagechangelistener;
    }

    public void setSelectedView(View view)
    {
        if (mSelectedView != null)
        {
            mSelectedView.setTag(R.id.selected_view, null);
            mSelectedView = null;
        }
        if (view.getParent() != null)
        {
            mSelectedView = view;
            mSelectedView.setTag(R.id.selected_view, "CustomViewAboveSelectedView");
            invalidate();
        }
    }

    public void setSelectorBitmap(Bitmap bitmap)
    {
        mSelectorDrawable = bitmap;
        refreshDrawableState();
    }

    public void setSelectorEnabled(boolean flag)
    {
        mSelectorEnabled = flag;
    }

    public void setSlidingEnabled(boolean flag)
    {
        mEnabled = flag;
    }

    public void setTouchMode(int i)
    {
        mTouchMode = i;
    }

    void smoothScrollTo(int i, int j)
    {
        smoothScrollTo(i, j, 0);
    }

    void smoothScrollTo(int i, int j, int k)
    {
        if (getChildCount() != 0) goto _L2; else goto _L1
_L1:
        setScrollingCacheEnabled(false);
_L4:
        return;
_L2:
        int l;
        int i1;
        int j1;
        int k1;
        l = getScrollX();
        i1 = getScrollY();
        j1 = i - l;
        k1 = j - i1;
        if (j1 != 0 || k1 != 0)
        {
            break MISSING_BLOCK_LABEL_92;
        }
        completeScroll();
        if (!isMenuOpen())
        {
            continue; /* Loop/switch isn't completed */
        }
        if (mOpenedListener == null) goto _L4; else goto _L3
_L3:
        mOpenedListener.onOpened();
        return;
        if (mClosedListener == null) goto _L4; else goto _L5
_L5:
        mClosedListener.onClosed();
        return;
        setScrollingCacheEnabled(true);
        mScrolling = true;
        int l1 = getBehindWidth();
        int i2 = l1 / 2;
        float f = Math.min(1.0F, (1.0F * (float)Math.abs(j1)) / (float)l1);
        float f1 = (float)i2 + (float)i2 * distanceInfluenceForSnapDuration(f);
        int j2 = Math.abs(k);
        int k2;
        int l2;
        if (j2 > 0)
        {
            k2 = 4 * Math.round(1000F * Math.abs(f1 / (float)j2));
        } else
        {
            (int)(100F * (1.0F + (float)Math.abs(j1) / (float)l1));
            k2 = 600;
        }
        l2 = Math.min(k2, 600);
        mScroller.startScroll(l, i1, j1, k1, l2);
        invalidate();
        return;
    }


}
