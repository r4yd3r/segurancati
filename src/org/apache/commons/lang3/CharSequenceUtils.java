// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;


public class CharSequenceUtils
{

    public CharSequenceUtils()
    {
    }

    public static int length(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            return 0;
        } else
        {
            return charsequence.length();
        }
    }

    public static CharSequence subSequence(CharSequence charsequence, int i)
    {
        if (charsequence == null)
        {
            return null;
        } else
        {
            return charsequence.subSequence(i, charsequence.length());
        }
    }
}
