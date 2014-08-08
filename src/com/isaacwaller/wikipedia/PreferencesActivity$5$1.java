// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.preference.Preference;
import android.widget.Toast;
import java.io.IOException;

// Referenced classes of package com.isaacwaller.wikipedia:
//            BookmarkExporter, PreferencesActivity

class this._cls1
    implements Runnable
{

    final _cls1.val.toastMessage this$1;

    public void run()
    {
        boolean flag = false;
        PreferencesActivity preferencesactivity;
        int i;
        final String toastMessage;
        try
        {
            BookmarkExporter.saveBookmarks(_fld0);
        }
        catch (IOException ioexception)
        {
            ioexception.printStackTrace();
            flag = true;
        }
        preferencesactivity = _fld0;
        if (flag)
        {
            i = 0x7f0b0032;
        } else
        {
            i = 0x7f0b0033;
        }
        toastMessage = preferencesactivity.getString(i);
        runOnUiThread(new Runnable() {

            final PreferencesActivity._cls5._cls1 this$2;
            private final String val$toastMessage;

            public void run()
            {
                Toast.makeText(this$0, toastMessage, 1).show();
            }

            
            {
                this$2 = PreferencesActivity._cls5._cls1.this;
                toastMessage = s;
                super();
            }
        });
    }


    is._cls0()
    {
        this$1 = this._cls1.this;
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

}
