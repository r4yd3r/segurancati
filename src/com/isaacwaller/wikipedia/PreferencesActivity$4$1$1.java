// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.preference.Preference;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PreferencesActivity

class val.dialog
    implements Runnable
{

    final val.dialog this$2;
    private final ProgressDialog val$dialog;

    public void run()
    {
        val$dialog.dismiss();
    }

    ._cls0()
    {
        this$2 = final__pcls0;
        val$dialog = ProgressDialog.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/PreferencesActivity$4

/* anonymous class */
    class PreferencesActivity._cls4
        implements android.preference.Preference.OnPreferenceClickListener
    {

        final PreferencesActivity this$0;

        public boolean onPreferenceClick(final Preference preference)
        {
            String s = getString(0x7f0b0015);
            String s1 = getString(0x7f0b003f);
            (new Thread(ProgressDialog.show(PreferencesActivity.this, s, s1, true, false). new PreferencesActivity._cls4._cls1())).start();
            return true;
        }


            
            {
                this$0 = PreferencesActivity.this;
                super();
            }
    }


    // Unreferenced inner class com/isaacwaller/wikipedia/PreferencesActivity$4$1

/* anonymous class */
    class PreferencesActivity._cls4._cls1
        implements Runnable
    {

        final PreferencesActivity._cls4 this$1;
        private final ProgressDialog val$dialog;
        private final Preference val$preference;

        public void run()
        {
            PreferencesActivity.access$0(this$0, preference.getKey());
            runOnUiThread(dialog. new PreferencesActivity._cls4._cls1._cls1());
        }

            
            {
                this$1 = final__pcls4;
                preference = preference1;
                dialog = ProgressDialog.this;
                super();
            }
    }

}
