// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia.newloader;

import android.net.Uri;
import java.io.Serializable;

public class Wiki
    implements Serializable
{

    private boolean isMinecraftWiki;
    private String languagePart;

    public Wiki(String s)
    {
        languagePart = s;
    }

    public Wiki(boolean flag)
    {
        isMinecraftWiki = flag;
    }

    public Uri getFullScriptPath()
    {
        android.net.Uri.Builder builder = Uri.parse(getServer()).buildUpon();
        builder.path(getScriptPath());
        return builder.build();
    }

    public String getLanguagePart()
    {
        return languagePart;
    }

    public String getRights()
    {
        if (isMinecraftWiki)
        {
            return "<a href='http://www.curse.com/content/TermsofService.aspx'>Curse Terms Of Service</a>";
        } else
        {
            return "Creative Commons Attribution-ShareAlike License";
        }
    }

    public String getScript()
    {
        if (isMinecraftWiki)
        {
            return "/api.php";
        } else
        {
            return "/w/api.php";
        }
    }

    public String getScriptPath()
    {
        if (isMinecraftWiki)
        {
            return "/";
        } else
        {
            return "/w/";
        }
    }

    public String getServer()
    {
        if (isMinecraftWiki)
        {
            return "http://www.minecraftwiki.net";
        } else
        {
            return (new StringBuilder("http://")).append(languagePart).append(".wikipedia.org").toString();
        }
    }

    public Uri getUrlOfAPIPage()
    {
        android.net.Uri.Builder builder = Uri.parse(getServer()).buildUpon();
        builder.path(getScriptPath());
        builder.appendEncodedPath("api.php");
        return builder.build();
    }

    public String toString()
    {
        if (isMinecraftWiki)
        {
            return "MINECRAFTWIKI";
        } else
        {
            return languagePart;
        }
    }
}
