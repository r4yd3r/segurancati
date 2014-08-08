// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;


// Referenced classes of package org.apache.commons.lang3:
//            StringUtils, ArrayUtils, CharSet

public class CharSetUtils
{

    public CharSetUtils()
    {
    }

    public static int count(String s, String s1)
    {
        if (StringUtils.isEmpty(s) || StringUtils.isEmpty(s1))
        {
            return 0;
        } else
        {
            return count(s, new String[] {
                s1
            });
        }
    }

    public static int count(String s, String as[])
    {
        int i;
        if (StringUtils.isEmpty(s) || ArrayUtils.isEmpty(as))
        {
            i = 0;
        } else
        {
            CharSet charset = CharSet.getInstance(as);
            i = 0;
            char ac[] = s.toCharArray();
            int j = ac.length;
            int k = 0;
            while (k < j) 
            {
                if (charset.contains(ac[k]))
                {
                    i++;
                }
                k++;
            }
        }
        return i;
    }

    public static String delete(String s, String s1)
    {
        if (StringUtils.isEmpty(s) || StringUtils.isEmpty(s1))
        {
            return s;
        } else
        {
            return delete(s, new String[] {
                s1
            });
        }
    }

    public static String delete(String s, String as[])
    {
        if (StringUtils.isEmpty(s) || ArrayUtils.isEmpty(as))
        {
            return s;
        } else
        {
            return modify(s, as, false);
        }
    }

    public static String keep(String s, String s1)
    {
        if (s == null)
        {
            return null;
        }
        if (s.length() == 0 || StringUtils.isEmpty(s1))
        {
            return "";
        } else
        {
            return keep(s, new String[] {
                s1
            });
        }
    }

    public static String keep(String s, String as[])
    {
        if (s == null)
        {
            return null;
        }
        if (s.length() == 0 || ArrayUtils.isEmpty(as))
        {
            return "";
        } else
        {
            return modify(s, as, true);
        }
    }

    private static String modify(String s, String as[], boolean flag)
    {
        CharSet charset = CharSet.getInstance(as);
        StringBuilder stringbuilder = new StringBuilder(s.length());
        char ac[] = s.toCharArray();
        int i = ac.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return stringbuilder.toString();
            }
            if (charset.contains(ac[j]) == flag)
            {
                stringbuilder.append(ac[j]);
            }
            j++;
        } while (true);
    }

    public static String squeeze(String s, String s1)
    {
        if (StringUtils.isEmpty(s) || StringUtils.isEmpty(s1))
        {
            return s;
        } else
        {
            return squeeze(s, new String[] {
                s1
            });
        }
    }

    public static String squeeze(String s, String as[])
    {
        if (StringUtils.isEmpty(s) || ArrayUtils.isEmpty(as))
        {
            return s;
        }
        CharSet charset = CharSet.getInstance(as);
        StringBuilder stringbuilder = new StringBuilder(s.length());
        char ac[] = s.toCharArray();
        int i = ac.length;
        char c = ' ';
        int j = 0;
        do
        {
            if (j >= i)
            {
                return stringbuilder.toString();
            }
            char c1 = ac[j];
            if (!charset.contains(c1) || c1 != c || j == 0)
            {
                stringbuilder.append(c1);
                c = c1;
            }
            j++;
        } while (true);
    }
}
