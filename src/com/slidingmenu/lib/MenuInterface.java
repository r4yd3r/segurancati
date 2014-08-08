// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.View;

// Referenced classes of package com.slidingmenu.lib:
//            CustomViewBehind

public abstract class MenuInterface
{

    public MenuInterface()
    {
    }

    public abstract void drawFade(Canvas canvas, int i, CustomViewBehind customviewbehind, View view);

    public abstract void drawShadow(Canvas canvas, Drawable drawable, int i);

    public abstract int getAbsLeftBound(CustomViewBehind customviewbehind, View view);

    public abstract int getAbsRightBound(CustomViewBehind customviewbehind, View view);

    public abstract int getMenuLeft(CustomViewBehind customviewbehind, View view);

    public abstract boolean marginTouchAllowed(View view, int i, int j);

    public abstract boolean menuClosedSlideAllowed(int i);

    public abstract boolean menuOpenSlideAllowed(int i);

    public abstract boolean menuOpenTouchAllowed(View view, int i);

    public abstract void scrollBehindTo(int i, int j, CustomViewBehind customviewbehind, float f);
}
