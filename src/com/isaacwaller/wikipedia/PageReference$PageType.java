// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;


// Referenced classes of package com.isaacwaller.wikipedia:
//            PageReference

public static final class  extends Enum
{

    private static final ENUM.VALUES ENUM$VALUES[];
    public static final ENUM.VALUES HOME_PAGE;
    public static final ENUM.VALUES OFFLINE_PAGE;
    public static final ENUM.VALUES SEARCH_RESULTS;
    public static final ENUM.VALUES WIKI_PAGE;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(com/isaacwaller/wikipedia/PageReference$PageType, s);
    }

    public static [] values()
    {
         a[] = ENUM$VALUES;
        int i = a.length;
         a1[] = new ENUM.VALUES[i];
        System.arraycopy(a, 0, a1, 0, i);
        return a1;
    }

    static 
    {
        HOME_PAGE = new <init>("HOME_PAGE", 0);
        SEARCH_RESULTS = new <init>("SEARCH_RESULTS", 1);
        WIKI_PAGE = new <init>("WIKI_PAGE", 2);
        OFFLINE_PAGE = new <init>("OFFLINE_PAGE", 3);
        ENUM.VALUES avalues[] = new <init>[4];
        avalues[0] = HOME_PAGE;
        avalues[1] = SEARCH_RESULTS;
        avalues[2] = WIKI_PAGE;
        avalues[3] = OFFLINE_PAGE;
        ENUM$VALUES = avalues;
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
