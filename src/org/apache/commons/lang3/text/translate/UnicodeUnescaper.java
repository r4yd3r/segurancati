// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import java.util.EnumSet;

// Referenced classes of package org.apache.commons.lang3.text.translate:
//            CharSequenceTranslator

public class UnicodeUnescaper extends CharSequenceTranslator
{
    public static final class OPTION extends Enum
    {

        private static final OPTION ENUM$VALUES[];
        public static final OPTION escapePlus;

        public static OPTION valueOf(String s)
        {
            return (OPTION)Enum.valueOf(org/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION, s);
        }

        public static OPTION[] values()
        {
            OPTION aoption[] = ENUM$VALUES;
            int i = aoption.length;
            OPTION aoption1[] = new OPTION[i];
            System.arraycopy(aoption, 0, aoption1, 0, i);
            return aoption1;
        }

        static 
        {
            escapePlus = new OPTION("escapePlus", 0);
            OPTION aoption[] = new OPTION[1];
            aoption[0] = escapePlus;
            ENUM$VALUES = aoption;
        }

        private OPTION(String s, int i)
        {
            super(s, i);
        }
    }


    private final EnumSet options;

    public transient UnicodeUnescaper(OPTION aoption[])
    {
        if (aoption.length > 0)
        {
            options = EnumSet.copyOf(Arrays.asList(aoption));
            return;
        } else
        {
            options = null;
            return;
        }
    }

    public boolean isSet(OPTION option)
    {
        if (options == null)
        {
            return false;
        } else
        {
            return options.contains(option);
        }
    }

    public int translate(CharSequence charsequence, int i, Writer writer)
        throws IOException
    {
        if (charsequence.charAt(i) == '\\' && i + 1 < charsequence.length() && charsequence.charAt(i + 1) == 'u')
        {
            int j = 2;
            do
            {
                if (i + j >= charsequence.length() || charsequence.charAt(i + j) != 'u')
                {
                    if (isSet(OPTION.escapePlus) && i + j < charsequence.length() && charsequence.charAt(i + j) == '+')
                    {
                        j++;
                    }
                    if (4 + (i + j) <= charsequence.length())
                    {
                        CharSequence charsequence1 = charsequence.subSequence(i + j, 4 + (i + j));
                        try
                        {
                            writer.write((char)Integer.parseInt(charsequence1.toString(), 16));
                        }
                        catch (NumberFormatException numberformatexception)
                        {
                            throw new IllegalArgumentException((new StringBuilder("Unable to parse unicode value: ")).append(charsequence1).toString(), numberformatexception);
                        }
                        return j + 4;
                    } else
                    {
                        throw new IllegalArgumentException((new StringBuilder("Less than 4 hex digits in unicode value: '")).append(charsequence.subSequence(i, charsequence.length())).append("' due to end of CharSequence").toString());
                    }
                }
                j++;
            } while (true);
        } else
        {
            return 0;
        }
    }
}
