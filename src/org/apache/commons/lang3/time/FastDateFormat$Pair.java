// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;


// Referenced classes of package org.apache.commons.lang3.time:
//            FastDateFormat

private static class mObj2
{

    private final Object mObj1;
    private final Object mObj2;

    public boolean equals(Object obj)
    {
        if (this != obj) goto _L2; else goto _L1
_L1:
        return true;
_L2:
        mObj2 mobj2;
label0:
        {
            if (!(obj instanceof mObj2))
            {
                return false;
            }
            mobj2 = (mObj2)obj;
            if (mObj1 != null ? mObj1.equals(mobj2.mObj1) : mobj2.mObj1 == null)
            {
                break label0;
            } else
            {
                break; /* Loop/switch isn't completed */
            }
        }
        if (mObj2 != null) goto _L4; else goto _L3
_L3:
        if (mobj2.mObj2 == null) goto _L1; else goto _L5
_L5:
        return false;
_L4:
        if (mObj2.equals(mobj2.mObj2))
        {
            return true;
        }
        if (true) goto _L5; else goto _L6
_L6:
    }

    public int hashCode()
    {
        int i;
        Object obj;
        int j;
        if (mObj1 == null)
        {
            i = 0;
        } else
        {
            i = mObj1.hashCode();
        }
        obj = mObj2;
        j = 0;
        if (obj != null)
        {
            j = mObj2.hashCode();
        }
        return i + j;
    }

    public String toString()
    {
        return (new StringBuilder("[")).append(mObj1).append(':').append(mObj2).append(']').toString();
    }

    public (Object obj, Object obj1)
    {
        mObj1 = obj;
        mObj2 = obj1;
    }
}
