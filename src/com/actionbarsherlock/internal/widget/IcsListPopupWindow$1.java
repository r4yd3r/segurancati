// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.widget;

import android.view.View;
import android.widget.AdapterView;

// Referenced classes of package com.actionbarsherlock.internal.widget:
//            IcsListPopupWindow

class this._cls0
    implements android.widget.ectedListener
{

    final IcsListPopupWindow this$0;

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        if (i != -1)
        {
            opDownListView opdownlistview = IcsListPopupWindow.access$0(IcsListPopupWindow.this);
            if (opdownlistview != null)
            {
                opDownListView.access._mth0(opdownlistview, false);
            }
        }
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }

    opDownListView()
    {
        this$0 = IcsListPopupWindow.this;
        super();
    }
}
