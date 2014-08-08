// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.widget.Toast;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity

class val.dialog
    implements Runnable
{

    final this._cls1 this$1;
    private final String val$_toastText;
    private final ProgressDialog val$dialog;

    public void run()
    {
        Toast.makeText(cess._mth2(this._cls1.this), val$_toastText, 1).show();
        val$dialog.dismiss();
        WelcomeActivity.access$2(cess._mth2(this._cls1.this));
    }

    ()
    {
        this$1 = final_;
        val$_toastText = s;
        val$dialog = ProgressDialog.this;
        super();
    }
}
