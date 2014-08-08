// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.preference.Preference;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PreferencesActivity

class this._cls0
    implements android.preference.eClickListener
{

    final PreferencesActivity this$0;

    public boolean onPreferenceClick(final Preference preference)
    {
        String s = getString(0x7f0b0015);
        String s1 = getString(0x7f0b003f);
        (new Thread(new Runnable() {

            final PreferencesActivity._cls4 this$1;
            private final ProgressDialog val$dialog;
            private final Preference val$preference;

            public void run()
            {
                PreferencesActivity.access$0(this$0, preference.getKey());
                runOnUiThread(dialog. new Runnable() {

                    final _cls1 this$2;
                    private final ProgressDialog val$dialog;

                    public void run()
                    {
                        dialog.dismiss();
                    }

            
            {
                this$2 = final__pcls1;
                dialog = ProgressDialog.this;
                super();
            }
                });
            }

            
            {
                this$1 = PreferencesActivity._cls4.this;
                preference = preference1;
                dialog = progressdialog;
                super();
            }
        })).start();
        return true;
    }


    _cls1.val.dialog()
    {
        this$0 = PreferencesActivity.this;
        super();
    }
}
