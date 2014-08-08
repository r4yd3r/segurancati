// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Intent;
import android.net.Uri;
import android.webkit.WebView;
import android.webkit.WebViewClient;

// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity, PageReference

private class <init> extends WebViewClient
{

    final WelcomeActivity this$0;

    public boolean shouldOverrideUrlLoading(WebView webview, String s)
    {
        Uri uri = Uri.parse(s);
        if ("market.android.com".equals(uri.getAuthority()) || "play.google.com".equals(uri.getAuthority()))
        {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.addCategory("android.intent.category.BROWSABLE");
            intent.setData(Uri.parse((new StringBuilder("market://details?id=")).append(uri.getQueryParameter("id")).append("&referrer=utm_source%3Dwikidroid%26utm_medium%3Dbanner%26utm_campaign%3Dwikidroid").toString()));
            startActivity(intent);
            return true;
        }
        if ("googleads.g.doubleclick.net".equals(uri.getAuthority()))
        {
            mWebView.loadUrl(uri.toString());
            return true;
        }
        if (uri.getAuthority() != null && (uri.getAuthority().endsWith("wikipedia.org") || uri.getAuthority().endsWith("minecraftwiki.net")))
        {
            WelcomeActivity.access$1(WelcomeActivity.this, PageReference.fromUrl(WelcomeActivity.this, uri.toString()));
            return true;
        } else
        {
            Intent intent1 = new Intent("android.intent.action.VIEW");
            intent1.addCategory("android.intent.category.BROWSABLE");
            intent1.setData(Uri.parse(s));
            startActivity(intent1);
            return true;
        }
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
