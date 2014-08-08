// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;

// Referenced classes of package org.apache.commons.lang3.text.translate:
//            CharSequenceTranslator

public class NumericEntityUnescaper extends CharSequenceTranslator
{

    public NumericEntityUnescaper()
    {
    }

    public int translate(CharSequence charsequence, int i, Writer writer)
        throws IOException
    {
        int j;
        char c;
        int k;
        j = 1;
        c = charsequence.charAt(i);
        k = 0;
        if (c != '&') goto _L2; else goto _L1
_L1:
        char c1;
        c1 = charsequence.charAt(i + 1);
        k = 0;
        if (c1 != '#') goto _L2; else goto _L3
_L3:
        int l;
        boolean flag;
        int i1;
label0:
        {
            l = i + 2;
            char c2 = charsequence.charAt(l);
            if (c2 != 'x')
            {
                flag = false;
                if (c2 != 'X')
                {
                    break label0;
                }
            }
            l++;
            flag = true;
        }
        i1 = l;
_L7:
        if (charsequence.charAt(i1) != ';') goto _L5; else goto _L4
_L4:
        int k1;
        {
            if (!flag)
            {
                break; /* Loop/switch isn't completed */
            }
            int j1;
            int l1;
            char ac[];
            int i2;
            try
            {
                i2 = Integer.parseInt(charsequence.subSequence(l, i1).toString(), 16);
            }
            catch (NumberFormatException numberformatexception)
            {
                return 0;
            }
            k1 = i2;
        }
        if (k1 > 65535)
        {
            ac = Character.toChars(k1);
            writer.write(ac[0]);
            writer.write(ac[j]);
        } else
        {
            writer.write(k1);
        }
        l1 = 2 + (i1 - l);
        if (!flag)
        {
            j = 0;
        }
        k = 1 + (j + l1);
_L2:
        return k;
_L5:
        i1++;
        if (true) goto _L7; else goto _L6
_L6:
        j1 = Integer.parseInt(charsequence.subSequence(l, i1).toString(), 10);
        k1 = j1;
        break MISSING_BLOCK_LABEL_129;
    }
}
