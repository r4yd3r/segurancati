// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.util.Random;

public class RandomStringUtils
{

    private static final Random RANDOM = new Random();

    public RandomStringUtils()
    {
    }

    public static String random(int i)
    {
        return random(i, false, false);
    }

    public static String random(int i, int j, int k, boolean flag, boolean flag1)
    {
        return random(i, j, k, flag, flag1, null, RANDOM);
    }

    public static String random(int i, int j, int k, boolean flag, boolean flag1, char ac[])
    {
        return random(i, j, k, flag, flag1, ac, RANDOM);
    }

    public static String random(int i, int j, int k, boolean flag, boolean flag1, char ac[], Random random1)
    {
        if (i == 0)
        {
            return "";
        }
        if (i < 0)
        {
            throw new IllegalArgumentException((new StringBuilder("Requested random string length ")).append(i).append(" is less than 0.").toString());
        }
        if (j == 0 && k == 0)
        {
            k = 123;
            j = 32;
            if (!flag && !flag1)
            {
                j = 0;
                k = 0x7fffffff;
            }
        }
        char ac1[] = new char[i];
        int l = k - j;
        int i1 = i;
        do
        {
            int j1 = i1 - 1;
            if (i1 == 0)
            {
                return new String(ac1);
            }
            char c;
            if (ac == null)
            {
                c = (char)(j + random1.nextInt(l));
            } else
            {
                c = ac[j + random1.nextInt(l)];
            }
            if (flag && Character.isLetter(c) || flag1 && Character.isDigit(c) || !flag && !flag1)
            {
                if (c >= '\uDC00' && c <= '\uDFFF')
                {
                    if (j1 == 0)
                    {
                        i1 = j1 + 1;
                    } else
                    {
                        ac1[j1] = c;
                        int l1 = j1 - 1;
                        ac1[l1] = (char)(55296 + random1.nextInt(128));
                        i1 = l1;
                    }
                } else
                if (c >= '\uD800' && c <= '\uDB7F')
                {
                    if (j1 == 0)
                    {
                        i1 = j1 + 1;
                    } else
                    {
                        ac1[j1] = (char)(56320 + random1.nextInt(128));
                        int k1 = j1 - 1;
                        ac1[k1] = c;
                        i1 = k1;
                    }
                } else
                if (c >= '\uDB80' && c <= '\uDBFF')
                {
                    i1 = j1 + 1;
                } else
                {
                    ac1[j1] = c;
                    i1 = j1;
                }
            } else
            {
                i1 = j1 + 1;
            }
        } while (true);
    }

    public static String random(int i, String s)
    {
        if (s == null)
        {
            return random(i, 0, 0, false, false, null, RANDOM);
        } else
        {
            return random(i, s.toCharArray());
        }
    }

    public static String random(int i, boolean flag, boolean flag1)
    {
        return random(i, 0, 0, flag, flag1);
    }

    public static String random(int i, char ac[])
    {
        if (ac == null)
        {
            return random(i, 0, 0, false, false, null, RANDOM);
        } else
        {
            return random(i, 0, ac.length, false, false, ac, RANDOM);
        }
    }

    public static String randomAlphabetic(int i)
    {
        return random(i, true, false);
    }

    public static String randomAlphanumeric(int i)
    {
        return random(i, true, true);
    }

    public static String randomAscii(int i)
    {
        return random(i, 32, 127, false, false);
    }

    public static String randomNumeric(int i)
    {
        return random(i, false, true);
    }

}
