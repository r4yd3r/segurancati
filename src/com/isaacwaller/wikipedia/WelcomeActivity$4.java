// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.webkit.WebView;
import com.isaacwaller.wikipedia.newloader.WikiManager;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity, PageReference

class this._cls0
    implements Runnable
{

    final WelcomeActivity this$0;

    public void run()
    {
        try
        {
            final String randomPage = WikiManager.queryWikiForRandomPage(WikiManager.getCurrentWiki(WelcomeActivity.this));
            runOnUiThread(new Runnable() {

                final WelcomeActivity._cls4 this$1;
                private final String val$randomPage;

                public void run()
                {
                    WelcomeActivity.access$1(this$0, new PageReference(PageReference.PageType.WIKI_PAGE, WikiManager.getCurrentWiki(this$0), randomPage));
                }

            
            {
                this$1 = WelcomeActivity._cls4.this;
                randomPage = s;
                super();
            }
            });
            return;
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
        mWebView.loadUrl("file:///android_asset/loadingerror.html");
    }


    _cls1.val.randomPage()
    {
        this$0 = WelcomeActivity.this;
        super();
    }
}
