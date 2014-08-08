// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;


// Referenced classes of package com.isaacwaller.wikipedia:
//            WelcomeActivity, PageReference

class val.reference
    implements Runnable
{

    final WelcomeActivity this$0;
    private final PageReference val$reference;

    public void run()
    {
        try
        {
            mCurrentPage = val$reference.loadPage(WelcomeActivity.this);
            WelcomeActivity.access$3(WelcomeActivity.this);
            return;
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
        WelcomeActivity.access$4(WelcomeActivity.this);
    }

    ()
    {
        this$0 = final_welcomeactivity;
        val$reference = PageReference.this;
        super();
    }
}
