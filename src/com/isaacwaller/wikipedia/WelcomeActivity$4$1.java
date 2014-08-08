// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.webkit.WebView;
import com.isaacwaller.wikipedia.newloader.WikiManager;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PageReference, WelcomeActivity

class val.randomPage
    implements Runnable
{

    final val.randomPage this$1;
    private final String val$randomPage;

    public void run()
    {
        WelcomeActivity.access$1(_fld0, new PageReference(pe.WIKI_PAGE, WikiManager.getCurrentWiki(_fld0), val$randomPage));
    }

    is._cls0()
    {
        this$1 = final__pcls0;
        val$randomPage = String.this;
        super();
    }

    // Unreferenced inner class com/isaacwaller/wikipedia/WelcomeActivity$4

/* anonymous class */
    class WelcomeActivity._cls4
        implements Runnable
    {

        final WelcomeActivity this$0;

        public void run()
        {
            try
            {
                String s = WikiManager.queryWikiForRandomPage(WikiManager.getCurrentWiki(WelcomeActivity.this));
                runOnUiThread(s. new WelcomeActivity._cls4._cls1());
                return;
            }
            catch (Exception exception)
            {
                exception.printStackTrace();
            }
            mWebView.loadUrl("file:///android_asset/loadingerror.html");
        }


            
            {
                this$0 = WelcomeActivity.this;
                super();
            }
    }

}
