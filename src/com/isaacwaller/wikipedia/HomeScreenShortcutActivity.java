// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PickBookmarkActivity, WelcomeActivity

public class HomeScreenShortcutActivity extends Activity
{

    public HomeScreenShortcutActivity()
    {
    }

    static String getArticleNameFromURL(Context context, Uri uri)
    {
        String s = uri.getEncodedPath();
        if (s.equals("/"))
        {
            return "Main Page";
        }
        if (s.startsWith("/wiki"))
        {
            s = s.substring(5);
        }
        if (s.startsWith("/"))
        {
            s = s.substring(1);
        }
        if (uri.getQueryParameter("search") != null)
        {
            return (new StringBuilder(String.valueOf(context.getString(0x7f0b0014)))).append(": ").append(Uri.decode(uri.getQueryParameter("search"))).toString();
        } else
        {
            return Uri.decode(s).replace('_', ' ');
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            if (i == 0)
            {
                if (j != -1)
                {
                    break label0;
                }
                setupShortcut(intent.getDataString());
                finish();
            }
            return;
        }
        setResult(j, intent);
        finish();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = new Intent(this, com/isaacwaller/wikipedia/PickBookmarkActivity);
        intent.setAction("android.intent.action.PICK");
        startActivityForResult(intent, 0);
    }

    void setupShortcut(String s)
    {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setClass(this, com/isaacwaller/wikipedia/WelcomeActivity);
        intent.setData(Uri.parse(s));
        Intent intent1 = new Intent();
        intent1.putExtra("android.intent.extra.shortcut.INTENT", intent);
        intent1.putExtra("android.intent.extra.shortcut.NAME", getArticleNameFromURL(this, Uri.parse(s)));
        intent1.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", android.content.Intent.ShortcutIconResource.fromContext(this, 0x7f020079));
        setResult(-1, intent1);
    }
}
