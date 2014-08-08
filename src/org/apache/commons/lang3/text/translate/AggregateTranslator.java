// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;
import org.apache.commons.lang3.ArrayUtils;

// Referenced classes of package org.apache.commons.lang3.text.translate:
//            CharSequenceTranslator

public class AggregateTranslator extends CharSequenceTranslator
{

    private final CharSequenceTranslator translators[];

    public transient AggregateTranslator(CharSequenceTranslator acharsequencetranslator[])
    {
        translators = (CharSequenceTranslator[])ArrayUtils.clone(acharsequencetranslator);
    }

    public int translate(CharSequence charsequence, int i, Writer writer)
        throws IOException
    {
        CharSequenceTranslator acharsequencetranslator[];
        int j;
        int k;
        acharsequencetranslator = translators;
        j = acharsequencetranslator.length;
        k = 0;
_L6:
        if (k < j) goto _L2; else goto _L1
_L1:
        int l = 0;
_L4:
        return l;
_L2:
        l = acharsequencetranslator[k].translate(charsequence, i, writer);
        if (l != 0) goto _L4; else goto _L3
_L3:
        k++;
        if (true) goto _L6; else goto _L5
_L5:
    }
}
