// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.view.View;

// Referenced classes of package com.actionbarsherlock.widget:
//            SearchView

class this._cls0
    implements android.view.angeListener
{

    final SearchView this$0;

    public void onFocusChange(View view, boolean flag)
    {
        if (SearchView.access$21(SearchView.this) != null)
        {
            SearchView.access$21(SearchView.this).onFocusChange(SearchView.this, flag);
        }
    }

    ()
    {
        this$0 = SearchView.this;
        super();
    }
}
