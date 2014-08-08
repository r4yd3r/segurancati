// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.newloader;

import java.util.Map;

// Referenced classes of package com.isaacwaller.wikipedia.newloader:
//            Wiki

public class Page
{

    protected String displayTitle;
    protected Map langlinks;
    protected String text;
    protected Wiki wiki;

    protected Page()
    {
    }

    public String getDisplayTitle()
    {
        return displayTitle;
    }

    public Map getLanglinks()
    {
        return langlinks;
    }

    public String getText()
    {
        return text;
    }

    public Wiki getWiki()
    {
        return wiki;
    }
}
