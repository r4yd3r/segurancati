// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import java.io.IOException;
import java.io.InputStream;

public class Utils
{

    public Utils()
    {
    }

    public static String slurp(InputStream inputstream)
        throws IOException
    {
        StringBuffer stringbuffer = new StringBuffer();
        byte abyte0[] = new byte[4096];
        do
        {
            int i = inputstream.read(abyte0);
            if (i == -1)
            {
                inputstream.close();
                return stringbuffer.toString();
            }
            stringbuffer.append(new String(abyte0, 0, i));
        } while (true);
    }
}
