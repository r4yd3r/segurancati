// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.widget.PopupWindow;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            IcsListPopupWindow

private class <init>
    implements Runnable
{

    final IcsListPopupWindow this$0;

    public void run()
    {
        if (IcsListPopupWindow.access$0(IcsListPopupWindow.this) != null && IcsListPopupWindow.access$0(IcsListPopupWindow.this).Count() > IcsListPopupWindow.access$0(IcsListPopupWindow.this).ChildCount() && IcsListPopupWindow.access$0(IcsListPopupWindow.this).ChildCount() <= IcsListPopupWindow.access$1(IcsListPopupWindow.this))
        {
            IcsListPopupWindow.access$2(IcsListPopupWindow.this).setInputMethodMode(2);
            show();
        }
    }

    private ()
    {
        this$0 = IcsListPopupWindow.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
