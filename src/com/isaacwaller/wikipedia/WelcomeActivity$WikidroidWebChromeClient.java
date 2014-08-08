// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.text.Html;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import com.actionbarsherlock.app.ActionBar;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity

private class <init> extends WebChromeClient
{

    final WelcomeActivity this$0;

    public void onProgressChanged(WebView webview, int i)
    {
        WelcomeActivity.access$0(WelcomeActivity.this, i + 50, (new StringBuilder("onProgressChanged ")).append(i).toString());
    }

    public void onReceivedTitle(WebView webview, String s)
    {
        getSupportActionBar().setTitle(Html.fromHtml(s));
    }

    private ()
    {
        this$0 = WelcomeActivity.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
