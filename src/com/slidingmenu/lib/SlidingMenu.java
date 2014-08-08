// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.lang.reflect.Method;

// Referenced classes of package com.slidingmenu.lib:
//            CustomViewBehind, CustomViewAbove

public class SlidingMenu extends RelativeLayout
{
    public static interface CanvasTransformer
    {

        public abstract void transformCanvas(Canvas canvas, float f);
    }

    public static interface OnCloseListener
    {

        public abstract void onClose();
    }

    public static interface OnClosedListener
    {

        public abstract void onClosed();
    }

    public static interface OnOpenListener
    {

        public abstract void onOpen();
    }

    public static interface OnOpenedListener
    {

        public abstract void onOpened();
    }

    public static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel, null);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        };
        private final boolean mBehindShowing;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            byte byte0;
            if (mBehindShowing)
            {
                byte0 = 1;
            } else
            {
                byte0 = 0;
            }
            parcel.writeByte(byte0);
        }



        private SavedState(Parcel parcel)
        {
            super(parcel);
            boolean flag;
            if (parcel.readByte() != 0)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            mBehindShowing = flag;
        }

        SavedState(Parcel parcel, SavedState savedstate)
        {
            this(parcel);
        }

        public SavedState(Parcelable parcelable, boolean flag)
        {
            super(parcelable);
            mBehindShowing = flag;
        }
    }


    public static final int LEFT = 0;
    public static final int LEFT_RIGHT = 2;
    public static final int RIGHT = 1;
    public static final int SLIDING_CONTENT = 1;
    public static final int SLIDING_WINDOW = 0;
    public static final int TOUCHMODE_FULLSCREEN = 1;
    public static final int TOUCHMODE_MARGIN = 0;
    public static final int TOUCHMODE_NONE = 2;
    private OnCloseListener mCloseListener;
    private OnOpenListener mOpenListener;
    private CustomViewAbove mViewAbove;
    private CustomViewBehind mViewBehind;

    public SlidingMenu(Activity activity, int i)
    {
        this(((Context) (activity)), ((AttributeSet) (null)));
        attachToActivity(activity, i);
    }

    public SlidingMenu(Context context)
    {
        this(context, ((AttributeSet) (null)));
    }

    public SlidingMenu(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SlidingMenu(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        android.widget.RelativeLayout.LayoutParams layoutparams = new android.widget.RelativeLayout.LayoutParams(-1, -1);
        CustomViewBehind customviewbehind = new CustomViewBehind(context);
        mViewBehind = customviewbehind;
        addView(mViewBehind, layoutparams);
        android.widget.RelativeLayout.LayoutParams layoutparams1 = new android.widget.RelativeLayout.LayoutParams(-1, -1);
        layoutparams1.addRule(11);
        CustomViewAbove customviewabove = new CustomViewAbove(context);
        mViewAbove = customviewabove;
        addView(mViewAbove, layoutparams1);
        mViewAbove.setCustomViewBehind(mViewBehind);
        mViewBehind.setCustomViewAbove(mViewAbove);
        mViewAbove.setOnPageChangeListener(new CustomViewAbove.OnPageChangeListener() {

            public static final int POSITION_CLOSE = 1;
            public static final int POSITION_OPEN;
            final SlidingMenu this$0;

            public void onPageScrolled(int l1, float f, int i2)
            {
            }

            public void onPageSelected(int l1)
            {
                if (l1 == 0 && mOpenListener != null)
                {
                    mOpenListener.onOpen();
                } else
                if (l1 == 1 && mCloseListener != null)
                {
                    mCloseListener.onClose();
                    return;
                }
            }

            
            {
                this$0 = SlidingMenu.this;
                super();
            }
        });
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, R.styleable.SlidingMenu);
        setMode(typedarray.getInt(0, 0));
        int j = typedarray.getResourceId(1, -1);
        int k;
        int l;
        int i1;
        if (j != -1)
        {
            setContent(j);
        } else
        {
            FrameLayout framelayout = new FrameLayout(context);
            setContent(framelayout);
        }
        k = typedarray.getResourceId(2, -1);
        if (k != -1)
        {
            setMenu(k);
        } else
        {
            FrameLayout framelayout1 = new FrameLayout(context);
            setMenu(framelayout1);
        }
        setTouchModeAbove(typedarray.getInt(6, 0));
        l = (int)typedarray.getDimension(3, -1F);
        i1 = (int)typedarray.getDimension(4, -1F);
        if (l != -1 && i1 != -1)
        {
            throw new IllegalStateException("Cannot set both behindOffset and behindWidth for a SlidingMenu");
        }
        int j1;
        int k1;
        if (l != -1)
        {
            setBehindOffset(l);
        } else
        if (i1 != -1)
        {
            setBehindWidth(i1);
        } else
        {
            setBehindOffset(0);
        }
        setBehindScrollScale(typedarray.getFloat(5, 0.33F));
        j1 = typedarray.getResourceId(7, -1);
        if (j1 != -1)
        {
            setShadowDrawable(j1);
        }
        setShadowWidth((int)typedarray.getDimension(8, 0.0F));
        setFadeEnabled(typedarray.getBoolean(9, true));
        setFadeDegree(typedarray.getFloat(10, 0.66F));
        setSelectorEnabled(typedarray.getBoolean(11, false));
        k1 = typedarray.getResourceId(12, -1);
        if (k1 != -1)
        {
            setSelectorDrawable(k1);
        }
        typedarray.recycle();
    }

    public void addIgnoredView(View view)
    {
        mViewAbove.addIgnoredView(view);
    }

    public void attachToActivity(Activity activity, int i)
    {
        int j;
        if (i != 0 && i != 1)
        {
            throw new IllegalArgumentException("slideStyle must be either SLIDING_WINDOW or SLIDING_CONTENT");
        }
        if (getParent() != null)
        {
            throw new IllegalStateException("This SlidingMenu appears to already be attached");
        }
        TypedArray typedarray = activity.getTheme().obtainStyledAttributes(new int[] {
            0x1010054
        });
        j = typedarray.getResourceId(0, 0);
        typedarray.recycle();
        i;
        JVM INSTR tableswitch 0 1: default 88
    //                   0 89
    //                   1 139;
           goto _L1 _L2 _L3
_L1:
        return;
_L2:
        ViewGroup viewgroup1 = (ViewGroup)activity.getWindow().getDecorView();
        ViewGroup viewgroup2 = (ViewGroup)viewgroup1.getChildAt(0);
        viewgroup2.setBackgroundResource(j);
        viewgroup1.removeView(viewgroup2);
        setContent(viewgroup2);
        viewgroup1.addView(this);
        return;
_L3:
        View view = activity.findViewById(0x1020002);
        ViewGroup viewgroup = (ViewGroup)view.getParent();
        viewgroup.removeView(view);
        viewgroup.addView(this, new android.widget.RelativeLayout.LayoutParams(-1, -1));
        setContent(view);
        if (view.getBackground() == null)
        {
            view.setBackgroundResource(j);
            return;
        }
        if (true) goto _L1; else goto _L4
_L4:
    }

    public void clearIgnoredViews()
    {
        mViewAbove.clearIgnoredViews();
    }

    protected boolean fitSystemWindows(Rect rect)
    {
        int i = rect.left;
        int j = rect.right;
        setPadding(i, rect.top, j, rect.bottom);
        return true;
    }

    public int getBehindOffset()
    {
        return ((android.widget.RelativeLayout.LayoutParams)mViewBehind.getLayoutParams()).rightMargin;
    }

    public float getBehindScrollScale()
    {
        return mViewBehind.getScrollScale();
    }

    public View getContent()
    {
        return mViewAbove.getContent();
    }

    public View getMenu()
    {
        return mViewBehind.getContent();
    }

    public int getMode()
    {
        return mViewBehind.getMode();
    }

    public View getSecondaryMenu()
    {
        return mViewBehind.getSecondaryContent();
    }

    public int getTouchModeAbove()
    {
        return mViewAbove.getTouchMode();
    }

    public boolean isMenuShowing()
    {
        return mViewAbove.getCurrentItem() == 0 || mViewAbove.getCurrentItem() == 2;
    }

    public boolean isSecondaryMenuShowing()
    {
        return mViewAbove.getCurrentItem() == 2;
    }

    public boolean isSlidingEnabled()
    {
        return mViewAbove.isSlidingEnabled();
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        if (savedstate.mBehindShowing)
        {
            showMenu();
            return;
        } else
        {
            showContent();
            return;
        }
    }

    protected Parcelable onSaveInstanceState()
    {
        return new SavedState(super.onSaveInstanceState(), isMenuShowing());
    }

    public void removeIgnoredView(View view)
    {
        mViewAbove.removeIgnoredView(view);
    }

    public void setAboveOffset(int i)
    {
        mViewAbove.setAboveOffset(i);
    }

    public void setAboveOffsetRes(int i)
    {
        setAboveOffset((int)getContext().getResources().getDimension(i));
    }

    public void setBehindCanvasTransformer(CanvasTransformer canvastransformer)
    {
        mViewBehind.setCanvasTransformer(canvastransformer);
    }

    public void setBehindOffset(int i)
    {
        mViewBehind.setWidthOffset(i);
    }

    public void setBehindOffsetRes(int i)
    {
        setBehindOffset((int)getContext().getResources().getDimension(i));
    }

    public void setBehindScrollScale(float f)
    {
        if (f < 0.0F && f > 1.0F)
        {
            throw new IllegalStateException("ScrollScale must be between 0 and 1");
        } else
        {
            mViewBehind.setScrollScale(f);
            return;
        }
    }

    public void setBehindWidth(int i)
    {
        Display display = ((WindowManager)getContext().getSystemService("window")).getDefaultDisplay();
        int j;
        try
        {
            Class aclass[] = {
                android/graphics/Point
            };
            Point point = new Point();
            android/view/Display.getMethod("getSize", aclass).invoke(display, new Object[] {
                point
            });
            j = point.x;
        }
        catch (Exception exception)
        {
            j = display.getWidth();
        }
        setBehindOffset(j - i);
    }

    public void setBehindWidthRes(int i)
    {
        setBehindWidth((int)getContext().getResources().getDimension(i));
    }

    public void setContent(int i)
    {
        setContent(LayoutInflater.from(getContext()).inflate(i, null));
    }

    public void setContent(View view)
    {
        mViewAbove.setContent(view);
        showContent();
    }

    public void setFadeDegree(float f)
    {
        mViewBehind.setFadeDegree(f);
    }

    public void setFadeEnabled(boolean flag)
    {
        mViewBehind.setFadeEnabled(flag);
    }

    public void setMenu(int i)
    {
        setMenu(LayoutInflater.from(getContext()).inflate(i, null));
    }

    public void setMenu(View view)
    {
        mViewBehind.setContent(view);
    }

    public void setMode(int i)
    {
        if (i != 0 && i != 1 && i != 2)
        {
            throw new IllegalStateException("SlidingMenu mode must be LEFT, RIGHT, or LEFT_RIGHT");
        } else
        {
            mViewBehind.setMode(i);
            return;
        }
    }

    public void setOnCloseListener(OnCloseListener oncloselistener)
    {
        mCloseListener = oncloselistener;
    }

    public void setOnClosedListener(OnClosedListener onclosedlistener)
    {
        mViewAbove.setOnClosedListener(onclosedlistener);
    }

    public void setOnOpenListener(OnOpenListener onopenlistener)
    {
        mOpenListener = onopenlistener;
    }

    public void setOnOpenedListener(OnOpenedListener onopenedlistener)
    {
        mViewAbove.setOnOpenedListener(onopenedlistener);
    }

    public void setSecondaryMenu(int i)
    {
        setSecondaryMenu(LayoutInflater.from(getContext()).inflate(i, null));
    }

    public void setSecondaryMenu(View view)
    {
        mViewBehind.setSecondaryContent(view);
    }

    public void setSecondaryShadowDrawable(int i)
    {
        setSecondaryShadowDrawable(getContext().getResources().getDrawable(i));
    }

    public void setSecondaryShadowDrawable(Drawable drawable)
    {
        mViewBehind.setSecondaryShadowDrawable(drawable);
    }

    public void setSelectedView(View view)
    {
        mViewAbove.setSelectedView(view);
    }

    public void setSelectorBitmap(Bitmap bitmap)
    {
        mViewAbove.setSelectorBitmap(bitmap);
    }

    public void setSelectorDrawable(int i)
    {
        mViewAbove.setSelectorBitmap(BitmapFactory.decodeResource(getResources(), i));
    }

    public void setSelectorEnabled(boolean flag)
    {
        mViewAbove.setSelectorEnabled(true);
    }

    public void setShadowDrawable(int i)
    {
        setShadowDrawable(getContext().getResources().getDrawable(i));
    }

    public void setShadowDrawable(Drawable drawable)
    {
        mViewBehind.setShadowDrawable(drawable);
    }

    public void setShadowWidth(int i)
    {
        mViewBehind.setShadowWidth(i);
    }

    public void setShadowWidthRes(int i)
    {
        setShadowWidth((int)getResources().getDimension(i));
    }

    public void setSlidingEnabled(boolean flag)
    {
        mViewAbove.setSlidingEnabled(flag);
    }

    public void setStatic(boolean flag)
    {
        if (flag)
        {
            setSlidingEnabled(false);
            mViewAbove.setCustomViewBehind(null);
            mViewAbove.setCurrentItem(1);
            return;
        } else
        {
            mViewAbove.setCurrentItem(1);
            mViewAbove.setCustomViewBehind(mViewBehind);
            setSlidingEnabled(true);
            return;
        }
    }

    public void setTouchModeAbove(int i)
    {
        if (i != 1 && i != 0 && i != 2)
        {
            throw new IllegalStateException("TouchMode must be set to eitherTOUCHMODE_FULLSCREEN or TOUCHMODE_MARGIN or TOUCHMODE_NONE.");
        } else
        {
            mViewAbove.setTouchMode(i);
            return;
        }
    }

    public void showContent()
    {
        showContent(true);
    }

    public void showContent(boolean flag)
    {
        mViewAbove.setCurrentItem(1, flag);
    }

    public void showMenu()
    {
        showMenu(true);
    }

    public void showMenu(boolean flag)
    {
        mViewAbove.setCurrentItem(0, flag);
    }

    public void showSecondaryMenu()
    {
        showSecondaryMenu(true);
    }

    public void showSecondaryMenu(boolean flag)
    {
        mViewAbove.setCurrentItem(2, flag);
    }

    public void toggle()
    {
        toggle(true);
    }

    public void toggle(boolean flag)
    {
        if (isMenuShowing())
        {
            showContent(flag);
            return;
        } else
        {
            showMenu(flag);
            return;
        }
    }


}
