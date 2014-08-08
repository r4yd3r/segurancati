// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.preference.Preference;
import android.widget.Toast;
import java.io.IOException;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PreferencesActivity, BookmarkExporter

class val.toastMessage
    implements Runnable
{

    final val.toastMessage this$2;
    private final String val$toastMessage;

    public void run()
    {
        Toast.makeText(_fld0, val$toastMessage, 1).show();
    }

    ._cls0()
    {
        this$2 = final__pcls0;
        val$toastMessage = String.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/PreferencesActivity$5

/* anonymous class */
    class PreferencesActivity._cls5
        implements android.preference.Preference.OnPreferenceClickListener
    {

        final PreferencesActivity this$0;

        public boolean onPreferenceClick(Preference preference)
        {
            (new Thread(new PreferencesActivity._cls5._cls1())).start();
            return false;
        }


            
            {
                this$0 = PreferencesActivity.this;
                super();
            }
    }


    // Unreferenced inner class com/isaacwaller/wikipedia/PreferencesActivity$5$1

/* anonymous class */
    class PreferencesActivity._cls5._cls1
        implements Runnable
    {

        final PreferencesActivity._cls5 this$1;

        public void run()
        {
            boolean flag = false;
            PreferencesActivity preferencesactivity;
            int i;
            String s;
            try
            {
                BookmarkExporter.saveBookmarks(this$0);
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                flag = true;
            }
            preferencesactivity = this$0;
            if (flag)
            {
                i = 0x7f0b0032;
            } else
            {
                i = 0x7f0b0033;
            }
            s = preferencesactivity.getString(i);
            runOnUiThread(s. new PreferencesActivity._cls5._cls1._cls1());
        }


            
            {
                this$1 = PreferencesActivity._cls5.this;
                super();
            }
    }

}
