// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Locale;

// Referenced classes of package org.apache.commons.lang3.text.translate:
//            AggregateTranslator

public abstract class CharSequenceTranslator
{

    public CharSequenceTranslator()
    {
    }

    public static String hex(int i)
    {
        return Integer.toHexString(i).toUpperCase(Locale.ENGLISH);
    }

    public abstract int translate(CharSequence charsequence, int i, Writer writer)
        throws IOException;

    public final String translate(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            return null;
        }
        String s;
        try
        {
            StringWriter stringwriter = new StringWriter(2 * charsequence.length());
            translate(charsequence, ((Writer) (stringwriter)));
            s = stringwriter.toString();
        }
        catch (IOException ioexception)
        {
            throw new RuntimeException(ioexception);
        }
        return s;
    }

    public final void translate(CharSequence charsequence, Writer writer)
        throws IOException
    {
        if (writer == null)
        {
            throw new IllegalArgumentException("The Writer must not be null");
        }
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i;
        int j;
        i = Character.codePointCount(charsequence, 0, charsequence.length());
        j = 0;
_L6:
        if (j >= i) goto _L1; else goto _L3
_L3:
        int k = translate(charsequence, j, writer);
        if (k != 0) goto _L5; else goto _L4
_L4:
        writer.write(Character.toChars(Character.codePointAt(charsequence, j)));
_L7:
        j++;
          goto _L6
_L5:
        int l = 0;
_L8:
label0:
        {
            if (l < k)
            {
                break label0;
            }
            j--;
        }
          goto _L7
        if (j < i - 2)
        {
            j += Character.charCount(Character.codePointAt(charsequence, j));
        } else
        {
            j++;
        }
        l++;
          goto _L8
    }

    public final transient CharSequenceTranslator with(CharSequenceTranslator acharsequencetranslator[])
    {
        CharSequenceTranslator acharsequencetranslator1[] = new CharSequenceTranslator[1 + acharsequencetranslator.length];
        acharsequencetranslator1[0] = this;
        System.arraycopy(acharsequencetranslator, 0, acharsequencetranslator1, 1, acharsequencetranslator.length);
        return new AggregateTranslator(acharsequencetranslator1);
    }
}
