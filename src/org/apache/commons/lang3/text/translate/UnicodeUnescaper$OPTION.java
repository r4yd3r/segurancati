// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;


// Referenced classes of package org.apache.commons.lang3.text.translate:
//            UnicodeUnescaper

public static final class  extends Enum
{

    private static final ENUM.VALUES ENUM$VALUES[];
    public static final ENUM.VALUES escapePlus;

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(org/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION, s);
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
        escapePlus = new <init>("escapePlus", 0);
        ENUM.VALUES avalues[] = new <init>[1];
        avalues[0] = escapePlus;
        ENUM$VALUES = avalues;
    }

    private (String s, int i)
    {
        super(s, i);
    }
}
