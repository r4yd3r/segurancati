// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.UnsupportedEncodingException;

// Referenced classes of package org.apache.commons.lang3:
//            ArrayUtils

public class CharEncoding
{

    public static final String ISO_8859_1 = "ISO-8859-1";
    public static final String US_ASCII = "US-ASCII";
    public static final String UTF_16 = "UTF-16";
    public static final String UTF_16BE = "UTF-16BE";
    public static final String UTF_16LE = "UTF-16LE";
    public static final String UTF_8 = "UTF-8";

    public CharEncoding()
    {
    }

    public static boolean isSupported(String s)
    {
        if (s == null)
        {
            return false;
        }
        try
        {
            new String(ArrayUtils.EMPTY_BYTE_ARRAY, s);
        }
        catch (UnsupportedEncodingException unsupportedencodingexception)
        {
            return false;
        }
        return true;
    }
}
