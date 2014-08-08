// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;

// Referenced classes of package org.apache.commons.lang3.text.translate:
//            CharSequenceTranslator

public class LookupTranslator extends CharSequenceTranslator
{

    private final int longest;
    private final HashMap lookupMap = new HashMap();
    private final int shortest;

    public LookupTranslator(CharSequence acharsequence[][])
    {
        int i = 0x7fffffff;
        int j = 0;
        int k = acharsequence.length;
        int l = 0;
        do
        {
            if (l >= k)
            {
                shortest = i;
                longest = j;
                return;
            }
            CharSequence acharsequence1[] = acharsequence[l];
            lookupMap.put(acharsequence1[0], acharsequence1[1]);
            int i1 = acharsequence1[0].length();
            if (i1 < i)
            {
                i = i1;
            }
            if (i1 > j)
            {
                j = i1;
            }
            l++;
        } while (true);
    }

    public int translate(CharSequence charsequence, int i, Writer writer)
        throws IOException
    {
        int j = longest;
        if (i + longest > charsequence.length())
        {
            j = charsequence.length() - i;
        }
        int k = j;
        do
        {
            if (k < shortest)
            {
                return 0;
            }
            CharSequence charsequence1 = charsequence.subSequence(i, i + k);
            CharSequence charsequence2 = (CharSequence)lookupMap.get(charsequence1);
            if (charsequence2 != null)
            {
                writer.write(charsequence2.toString());
                return k;
            }
            k--;
        } while (true);
    }
}
