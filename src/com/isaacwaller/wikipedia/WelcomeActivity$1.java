// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import com.slidingmenu.lib.SlidingMenu;
import java.util.TimerTask;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity

class this._cls0 extends TimerTask
{

    final WelcomeActivity this$0;

    public void run()
    {
        mSlidingMenu.postInvalidate();
    }

    ()
    {
        this$0 = WelcomeActivity.this;
        super();
    }
}
