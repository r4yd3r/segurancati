// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;


// Referenced classes of package com.isaacwaller.wikipedia:
//            ApplicationManager

public static final class packageName extends Enum
{

    private static final ENUM.VALUES ENUM$VALUES[];
    public static final ENUM.VALUES MINECRAFT_WIKI;
    public static final ENUM.VALUES WIKIDROID;
    String packageName;

    public static packageName getApplicationFromPackageName(String s)
    {
        packageName apackagename[] = values();
        int i = apackagename.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                throw new IllegalArgumentException(s);
            }
            packageName packagename = apackagename[j];
            if (packagename.packageName.equals(s))
            {
                return packagename;
            }
            j++;
        } while (true);
    }

    public static packageName valueOf(String s)
    {
        return (packageName)Enum.valueOf(com/isaacwaller/wikipedia/ApplicationManager$Application, s);
    }

    public static packageName[] values()
    {
        packageName apackagename[] = ENUM$VALUES;
        int i = apackagename.length;
        packageName apackagename1[] = new ENUM.VALUES[i];
        System.arraycopy(apackagename, 0, apackagename1, 0, i);
        return apackagename1;
    }

    static 
    {
        MINECRAFT_WIKI = new <init>("MINECRAFT_WIKI", 0, "com.siriusapplications.minecraftwiki");
        WIKIDROID = new <init>("WIKIDROID", 1, "com.isaacwaller.wikipedia");
        ENUM.VALUES avalues[] = new <init>[2];
        avalues[0] = MINECRAFT_WIKI;
        avalues[1] = WIKIDROID;
        ENUM$VALUES = avalues;
    }

    private (String s, int i, String s1)
    {
        super(s, i);
        packageName = s1;
    }
}
