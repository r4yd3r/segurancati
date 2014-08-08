// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.Serializable;
import java.util.Comparator;

// Referenced classes of package org.apache.commons.lang3:
//            Range

private static class _cls9
    implements Comparator, Serializable
{

    public static final compare INSTANCE = new <init>();
    private static final long serialVersionUID = 1L;

    public static _cls9 getInstance()
    {
        return INSTANCE;
    }

    public int compare(Comparable comparable, Comparable comparable1)
    {
        return comparable.compareTo(comparable1);
    }

    public volatile int compare(Object obj, Object obj1)
    {
        return compare((Comparable)obj, (Comparable)obj1);
    }

    public boolean equals(Object obj)
    {
        return this == obj || obj != null && obj.getClass().equals(getClass());
    }

    public int hashCode()
    {
        return "ComparableComparator".hashCode();
    }


    public _cls9()
    {
    }
}
