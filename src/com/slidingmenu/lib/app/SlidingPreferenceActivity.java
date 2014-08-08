// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib.app;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import com.slidingmenu.lib.SlidingMenu;

// Referenced classes of package com.slidingmenu.lib.app:
//            SlidingActivityBase, SlidingActivityHelper

public class SlidingPreferenceActivity extends PreferenceActivity
    implements SlidingActivityBase
{

    private SlidingActivityHelper mHelper;

    public SlidingPreferenceActivity()
    {
    }

    public View findViewById(int i)
    {
        View view = super.findViewById(i);
        if (view != null)
        {
            return view;
        } else
        {
            return mHelper.findViewById(i);
        }
    }

    public SlidingMenu getSlidingMenu()
    {
        return mHelper.getSlidingMenu();
    }

    public void onCreate(Bundle bundle)
    {
        mHelper = new SlidingActivityHelper(this);
        super.onCreate(bundle);
        mHelper.onCreate(bundle);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        boolean flag = mHelper.onKeyUp(i, keyevent);
        if (flag)
        {
            return flag;
        } else
        {
            return super.onKeyUp(i, keyevent);
        }
    }

    public void onPostCreate(Bundle bundle)
    {
        super.onPostCreate(bundle);
        mHelper.onPostCreate(bundle);
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        mHelper.onSaveInstanceState(bundle);
    }

    public void setBehindContentView(int i)
    {
        setBehindContentView(getLayoutInflater().inflate(i, null));
    }

    public void setBehindContentView(View view)
    {
        setBehindContentView(view, new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    public void setBehindContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        mHelper.setBehindContentView(view, layoutparams);
    }

    public void setContentView(int i)
    {
        setContentView(getLayoutInflater().inflate(i, null));
    }

    public void setContentView(View view)
    {
        setContentView(view, new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    public void setContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        super.setContentView(view, layoutparams);
        mHelper.registerAboveContentView(view, layoutparams);
    }

    public void setSlidingActionBarEnabled(boolean flag)
    {
        mHelper.setSlidingActionBarEnabled(flag);
    }

    public void showContent()
    {
        mHelper.showContent();
    }

    public void showMenu()
    {
        mHelper.showMenu();
    }

    public void showSecondaryMenu()
    {
        mHelper.showSecondaryMenu();
    }

    public void toggle()
    {
        mHelper.toggle();
    }
}
