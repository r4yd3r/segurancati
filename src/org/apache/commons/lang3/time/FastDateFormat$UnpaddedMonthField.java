// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;

import java.util.Calendar;

// Referenced classes of package org.apache.commons.lang3.time:
//            FastDateFormat

private static class 
    implements 
{

    static final appendTo INSTANCE = new <init>();

    public final void appendTo(StringBuffer stringbuffer, int i)
    {
        if (i < 10)
        {
            stringbuffer.append((char)(i + 48));
            return;
        } else
        {
            stringbuffer.append((char)(48 + i / 10));
            stringbuffer.append((char)(48 + i % 10));
            return;
        }
    }

    public void appendTo(StringBuffer stringbuffer, Calendar calendar)
    {
        appendTo(stringbuffer, 1 + calendar.get(2));
    }

    public int estimateLength()
    {
        return 2;
    }


    ()
    {
    }
}
