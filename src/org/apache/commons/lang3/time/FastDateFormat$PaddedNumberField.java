// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;

import java.util.Calendar;
import org.apache.commons.lang3.Validate;

// Referenced classes of package org.apache.commons.lang3.time:
//            FastDateFormat

private static class mSize
    implements mSize
{

    private final int mField;
    private final int mSize;

    public final void appendTo(StringBuffer stringbuffer, int i)
    {
        if (i < 100)
        {
            int l = mSize;
            do
            {
                if (--l < 2)
                {
                    stringbuffer.append((char)(48 + i / 10));
                    stringbuffer.append((char)(48 + i % 10));
                    return;
                }
                stringbuffer.append('0');
            } while (true);
        }
        int j;
        int k;
        if (i < 1000)
        {
            j = 3;
        } else
        {
            boolean flag;
            if (i > -1)
            {
                flag = true;
            } else
            {
                flag = false;
            }
            Validate.isTrue(flag, "Negative values should not be possible", i);
            j = Integer.toString(i).length();
        }
        k = mSize;
        do
        {
            if (--k < j)
            {
                stringbuffer.append(Integer.toString(i));
                return;
            }
            stringbuffer.append('0');
        } while (true);
    }

    public void appendTo(StringBuffer stringbuffer, Calendar calendar)
    {
        appendTo(stringbuffer, calendar.get(mField));
    }

    public int estimateLength()
    {
        return 4;
    }

    (int i, int j)
    {
        if (j < 3)
        {
            throw new IllegalArgumentException();
        } else
        {
            mField = i;
            mSize = j;
            return;
        }
    }
}
