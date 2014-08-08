// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text;


// Referenced classes of package org.apache.commons.lang3.text:
//            StrMatcher

static final class chars extends StrMatcher
{

    private final char chars[];

    public int isMatch(char ac[], int i, int j, int k)
    {
        int l = chars.length;
        if (i + l > k)
        {
            l = 0;
        } else
        {
            int i1 = 0;
            while (i1 < chars.length) 
            {
                if (chars[i1] != ac[i])
                {
                    return 0;
                }
                i1++;
                i++;
            }
        }
        return l;
    }

    (String s)
    {
        chars = s.toCharArray();
    }
}
