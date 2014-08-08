// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.math;


public class IEEE754rUtils
{

    public IEEE754rUtils()
    {
    }

    public static double max(double d, double d1)
    {
        if (Double.isNaN(d))
        {
            return d1;
        }
        if (Double.isNaN(d1))
        {
            return d;
        } else
        {
            return Math.max(d, d1);
        }
    }

    public static double max(double d, double d1, double d2)
    {
        return max(max(d, d1), d2);
    }

    public static double max(double ad[])
    {
        if (ad == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (ad.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        double d = ad[0];
        int i = 1;
        do
        {
            if (i >= ad.length)
            {
                return d;
            }
            d = max(ad[i], d);
            i++;
        } while (true);
    }

    public static float max(float f, float f1)
    {
        if (Float.isNaN(f))
        {
            return f1;
        }
        if (Float.isNaN(f1))
        {
            return f;
        } else
        {
            return Math.max(f, f1);
        }
    }

    public static float max(float f, float f1, float f2)
    {
        return max(max(f, f1), f2);
    }

    public static float max(float af[])
    {
        if (af == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (af.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        float f = af[0];
        int i = 1;
        do
        {
            if (i >= af.length)
            {
                return f;
            }
            f = max(af[i], f);
            i++;
        } while (true);
    }

    public static double min(double d, double d1)
    {
        if (Double.isNaN(d))
        {
            return d1;
        }
        if (Double.isNaN(d1))
        {
            return d;
        } else
        {
            return Math.min(d, d1);
        }
    }

    public static double min(double d, double d1, double d2)
    {
        return min(min(d, d1), d2);
    }

    public static double min(double ad[])
    {
        if (ad == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (ad.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        double d = ad[0];
        int i = 1;
        do
        {
            if (i >= ad.length)
            {
                return d;
            }
            d = min(ad[i], d);
            i++;
        } while (true);
    }

    public static float min(float f, float f1)
    {
        if (Float.isNaN(f))
        {
            return f1;
        }
        if (Float.isNaN(f1))
        {
            return f;
        } else
        {
            return Math.min(f, f1);
        }
    }

    public static float min(float f, float f1, float f2)
    {
        return min(min(f, f1), f2);
    }

    public static float min(float af[])
    {
        if (af == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (af.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        float f = af[0];
        int i = 1;
        do
        {
            if (i >= af.length)
            {
                return f;
            }
            f = min(af[i], f);
            i++;
        } while (true);
    }
}
