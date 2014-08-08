// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.Serializable;
import java.util.Comparator;

public final class Range
    implements Serializable
{
    private static class ComparableComparator
        implements Comparator, Serializable
    {

        public static final ComparableComparator INSTANCE = new ComparableComparator();
        private static final long serialVersionUID = 1L;

        public static ComparableComparator getInstance()
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


        public ComparableComparator()
        {
        }
    }


    private static final long serialVersionUID = 1L;
    private final Comparator comparator;
    private transient int hashCode;
    private final Object maximum;
    private final Object minimum;
    private transient String toString;

    private Range(Object obj, Object obj1, Comparator comparator1)
    {
        hashCode = 0;
        toString = null;
        if (obj == null || obj1 == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Elements in a range must not be null: element1=")).append(obj).append(", element2=").append(obj1).toString());
        }
        if (comparator1 == null)
        {
            throw new IllegalArgumentException("Comparator must not be null");
        }
        if (comparator1.compare(obj, obj1) < 1)
        {
            minimum = obj;
            maximum = obj1;
        } else
        {
            minimum = obj1;
            maximum = obj;
        }
        comparator = comparator1;
    }

    public static Range between(Comparable comparable, Comparable comparable1)
    {
        return new Range(comparable, comparable1, ComparableComparator.getInstance());
    }

    public static Range between(Object obj, Object obj1, Comparator comparator1)
    {
        return new Range(obj, obj1, comparator1);
    }

    public static Range is(Comparable comparable)
    {
        return new Range(comparable, comparable, ComparableComparator.getInstance());
    }

    public static Range is(Object obj, Comparator comparator1)
    {
        return new Range(obj, obj, comparator1);
    }

    public boolean contains(Object obj)
    {
        while (obj == null || comparator.compare(obj, minimum) <= -1 || comparator.compare(obj, maximum) >= 1) 
        {
            return false;
        }
        return true;
    }

    public boolean containsRange(Range range)
    {
        while (range == null || !contains(range.getMinimum()) || !contains(range.getMaximum())) 
        {
            return false;
        }
        return true;
    }

    public boolean elementAfter(Object obj)
    {
        while (obj == null || comparator.compare(obj, maximum) <= 0) 
        {
            return false;
        }
        return true;
    }

    public boolean elementBefore(Object obj)
    {
        while (obj == null || comparator.compare(obj, minimum) >= 0) 
        {
            return false;
        }
        return true;
    }

    public int elementCompareTo(Object obj)
    {
        if (obj == null)
        {
            throw new NullPointerException("Element is null");
        }
        if (elementBefore(obj))
        {
            return -1;
        }
        return !elementAfter(obj) ? 0 : 1;
    }

    public boolean equals(Object obj)
    {
        if (obj != this)
        {
            if (obj == null || obj.getClass() != getClass())
            {
                return false;
            }
            Range range = (Range)obj;
            if (!getMinimum().equals(range.getMinimum()) || !getMaximum().equals(range.getMaximum()))
            {
                return false;
            }
        }
        return true;
    }

    public Comparator getComparator()
    {
        return comparator;
    }

    public Object getMaximum()
    {
        return maximum;
    }

    public Object getMinimum()
    {
        return minimum;
    }

    public int hashCode()
    {
        int i = hashCode;
        if (hashCode == 0)
        {
            i = 37 * (37 * (629 + getClass().hashCode()) + minimum.hashCode()) + maximum.hashCode();
            hashCode = i;
        }
        return i;
    }

    public boolean isDefaultNaturalOrdering()
    {
        return comparator == ComparableComparator.INSTANCE;
    }

    public boolean overlapsRange(Range range)
    {
        while (range == null || !range.contains(minimum) && !range.contains(maximum) && !contains(range.getMinimum())) 
        {
            return false;
        }
        return true;
    }

    public String toString()
    {
        String s = toString;
        if (s == null)
        {
            StringBuilder stringbuilder = new StringBuilder(32);
            stringbuilder.append("Range[");
            stringbuilder.append(minimum);
            stringbuilder.append(',');
            stringbuilder.append(maximum);
            stringbuilder.append(']');
            s = stringbuilder.toString();
            toString = s;
        }
        return s;
    }
}
