// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.net.Uri;
import android.view.View;
import android.webkit.WebView;
import android.widget.Toast;
import java.util.List;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity, HomeScreenShortcutActivity, QueueFragment

class this._cls0
    implements android.view.stener
{

    final WelcomeActivity this$0;

    public boolean onLongClick(View view)
    {
        android.webkit.ult ult = mWebView.getHitTestResult();
        if (ult.getType() == 7)
        {
            String s = ult.getExtra();
            Uri uri = Uri.parse(s);
            if (uri.getAuthority().endsWith("wikipedia.org") && ((String)uri.getPathSegments().get(0)).equals("wiki"))
            {
                String s1 = HomeScreenShortcutActivity.getArticleNameFromURL(WelcomeActivity.this, uri);
                Toast.makeText(getApplication(), (new StringBuilder("Added '")).append(s1).append("' to queue.").toString(), 0).show();
                mQueueFragment.addToQueue(s);
            }
            return true;
        } else
        {
            return false;
        }
    }

    Activity()
    {
        this$0 = WelcomeActivity.this;
        super();
    }
}
