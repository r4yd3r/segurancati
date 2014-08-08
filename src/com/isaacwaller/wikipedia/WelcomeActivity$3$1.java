// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.widget.Toast;
import java.util.ArrayList;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity, BookmarksFragment, PageReference, OfflinePageSaver

class val.toastText
    implements Runnable
{

    final freshPages this$1;
    private final ProgressDialog val$progress;
    private final int val$toastText[];

    public void run()
    {
        val$progress.dismiss();
        Toast.makeText(_fld0, val$toastText[0], 1).show();
        mBookmarksFragment.refreshPages();
    }

    l.progress()
    {
        this$1 = final_progress1;
        val$progress = progressdialog;
        val$toastText = _5B_I.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/WelcomeActivity$3

/* anonymous class */
    class WelcomeActivity._cls3
        implements Runnable
    {

        final WelcomeActivity this$0;
        private final ProgressDialog val$progress;

        public void run()
        {
            int ai[] = {
                0x7f0b003d
            };
            try
            {
                OfflinePageSaver.savePage(WelcomeActivity.this, (PageReference)mHistory.get(-1 + mHistory.size()));
            }
            catch (OfflinePageSaver.PageAlreadyExistsException pagealreadyexistsexception)
            {
                pagealreadyexistsexception.printStackTrace();
                ai[0] = 0x7f0b003a;
            }
            catch (Exception exception)
            {
                exception.printStackTrace();
                ai[0] = 0x7f0b003b;
            }
            runOnUiThread(ai. new WelcomeActivity._cls3._cls1());
        }


            
            {
                this$0 = final_welcomeactivity;
                progress = ProgressDialog.this;
                super();
            }
    }

}
