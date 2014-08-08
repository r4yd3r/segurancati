// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib.app;

import android.app.Activity;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.slidingmenu.lib.SlidingMenu;

public class SlidingActivityHelper
{

    private Activity mActivity;
    private boolean mBroadcasting;
    private boolean mEnableSlide;
    private boolean mOnPostCreateCalled;
    private SlidingMenu mSlidingMenu;
    private View mViewAbove;
    private View mViewBehind;

    public SlidingActivityHelper(Activity activity)
    {
        mBroadcasting = false;
        mOnPostCreateCalled = false;
        mEnableSlide = true;
        mActivity = activity;
    }

    public View findViewById(int i)
    {
        if (mSlidingMenu != null)
        {
            View view = mSlidingMenu.findViewById(i);
            if (view != null)
            {
                return view;
            }
        }
        return null;
    }

    public SlidingMenu getSlidingMenu()
    {
        return mSlidingMenu;
    }

    public void onCreate(Bundle bundle)
    {
        mSlidingMenu = (SlidingMenu)LayoutInflater.from(mActivity).inflate(com.slidingmenu.lib.R.layout.slidingmenumain, null);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        if (i == 4 && mSlidingMenu.isMenuShowing())
        {
            showContent();
            return true;
        } else
        {
            return false;
        }
    }

    public void onPostCreate(Bundle bundle)
    {
        if (mViewBehind == null || mViewAbove == null)
        {
            throw new IllegalStateException("Both setBehindContentView must be called in onCreate in addition to setContentView.");
        }
        mOnPostCreateCalled = true;
        TypedArray typedarray = mActivity.getTheme().obtainStyledAttributes(new int[] {
            0x1010054
        });
        int i = typedarray.getResourceId(0, 0);
        typedarray.recycle();
        if (mEnableSlide)
        {
            ViewGroup viewgroup1 = (ViewGroup)mActivity.getWindow().getDecorView();
            ViewGroup viewgroup2 = (ViewGroup)viewgroup1.getChildAt(0);
            viewgroup2.setBackgroundResource(i);
            viewgroup1.removeView(viewgroup2);
            mSlidingMenu.setContent(viewgroup2);
            viewgroup1.addView(mSlidingMenu);
        } else
        {
            ViewGroup viewgroup = (ViewGroup)mViewAbove.getParent();
            if (viewgroup != null)
            {
                viewgroup.removeView(mViewAbove);
            }
            if (mViewAbove.getBackground() == null)
            {
                mViewAbove.setBackgroundResource(i);
            }
            mSlidingMenu.setContent(mViewAbove);
            viewgroup.addView(mSlidingMenu, new android.view.ViewGroup.LayoutParams(-1, -1));
        }
        showContent();
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        bundle.putBoolean("menuOpen", mSlidingMenu.isMenuShowing());
    }

    public void registerAboveContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (!mBroadcasting)
        {
            mViewAbove = view;
        }
    }

    public void setBehindContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        mViewBehind = view;
        mSlidingMenu.setMenu(mViewBehind);
    }

    public void setContentView(View view)
    {
        mBroadcasting = true;
        mActivity.setContentView(view);
    }

    public void setSlidingActionBarEnabled(boolean flag)
    {
        if (mOnPostCreateCalled)
        {
            throw new IllegalStateException("enableSlidingActionBar must be called in onCreate.");
        } else
        {
            mEnableSlide = flag;
            return;
        }
    }

    public void showContent()
    {
        mSlidingMenu.showContent();
    }

    public void showMenu()
    {
        mSlidingMenu.showMenu();
    }

    public void showSecondaryMenu()
    {
        mSlidingMenu.showSecondaryMenu();
    }

    public void toggle()
    {
        mSlidingMenu.toggle();
    }
}
