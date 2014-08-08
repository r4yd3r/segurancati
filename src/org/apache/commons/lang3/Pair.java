// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.Serializable;
import org.apache.commons.lang3.builder.HashCodeBuilder;

// Referenced classes of package org.apache.commons.lang3:
//            ObjectUtils

public final class Pair
    implements Serializable
{

    private static final long serialVersionUID = 0x44c3687a6deaffd1L;
    public final Object left;
    public final Object right;

    public Pair(Object obj, Object obj1)
    {
        left = obj;
        right = obj1;
    }

    public static Pair of(Object obj, Object obj1)
    {
        return new Pair(obj, obj1);
    }

    public boolean equals(Object obj)
    {
        if (obj != this)
        {
            if (!(obj instanceof Pair))
            {
                return false;
            }
            Pair pair = (Pair)obj;
            if (!ObjectUtils.equals(left, pair.left) || !ObjectUtils.equals(right, pair.right))
            {
                return false;
            }
        }
        return true;
    }

    public int hashCode()
    {
        return (new HashCodeBuilder()).append(left).append(right).toHashCode();
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("(");
        stringbuilder.append(left);
        stringbuilder.append(",");
        stringbuilder.append(right);
        stringbuilder.append(")");
        return stringbuilder.toString();
    }
}
