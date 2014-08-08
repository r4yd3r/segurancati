// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.SystemUtils;

public class WordUtils
{

    public WordUtils()
    {
    }

    public static String abbreviate(String s, int i, int j, String s1)
    {
        if (s == null)
        {
            return null;
        }
        if (s.length() == 0)
        {
            return "";
        }
        if (i > s.length())
        {
            i = s.length();
        }
        if (j == -1 || j > s.length())
        {
            j = s.length();
        }
        if (j < i)
        {
            j = i;
        }
        StringBuilder stringbuilder = new StringBuilder();
        int k = StringUtils.indexOf(s, " ", i);
        if (k == -1)
        {
            stringbuilder.append(s.substring(0, j));
            if (j != s.length())
            {
                stringbuilder.append(StringUtils.defaultString(s1));
            }
        } else
        if (k > j)
        {
            stringbuilder.append(s.substring(0, j));
            stringbuilder.append(StringUtils.defaultString(s1));
        } else
        {
            stringbuilder.append(s.substring(0, k));
            stringbuilder.append(StringUtils.defaultString(s1));
        }
        return stringbuilder.toString();
    }

    public static String capitalize(String s)
    {
        return capitalize(s, null);
    }

    public static transient String capitalize(String s, char ac[])
    {
        int j;
        StringBuilder stringbuilder;
        boolean flag;
        int k;
        int i;
        if (ac == null)
        {
            i = -1;
        } else
        {
            i = ac.length;
        }
        if (s == null || s.length() == 0 || i == 0)
        {
            return s;
        }
        j = s.length();
        stringbuilder = new StringBuilder(j);
        flag = true;
        k = 0;
_L2:
        char c;
        if (k >= j)
        {
            return stringbuilder.toString();
        }
        c = s.charAt(k);
        if (!isDelimiter(c, ac))
        {
            break; /* Loop/switch isn't completed */
        }
        stringbuilder.append(c);
        flag = true;
_L3:
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        if (flag)
        {
            stringbuilder.append(Character.toTitleCase(c));
            flag = false;
        } else
        {
            stringbuilder.append(c);
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String capitalizeFully(String s)
    {
        return capitalizeFully(s, null);
    }

    public static transient String capitalizeFully(String s, char ac[])
    {
        int i;
        if (ac == null)
        {
            i = -1;
        } else
        {
            i = ac.length;
        }
        if (s == null || s.length() == 0 || i == 0)
        {
            return s;
        } else
        {
            return capitalize(s.toLowerCase(), ac);
        }
    }

    public static String initials(String s)
    {
        return initials(s, null);
    }

    public static transient String initials(String s, char ac[])
    {
        int i;
        char ac1[];
        boolean flag;
        int j;
        int k;
        if (s == null || s.length() == 0)
        {
            return s;
        }
        if (ac != null && ac.length == 0)
        {
            return "";
        }
        i = s.length();
        ac1 = new char[1 + i / 2];
        flag = true;
        j = 0;
        k = 0;
_L2:
        char c;
        int l;
        if (j >= i)
        {
            return new String(ac1, 0, k);
        }
        c = s.charAt(j);
        if (!isDelimiter(c, ac))
        {
            break; /* Loop/switch isn't completed */
        }
        flag = true;
        l = k;
_L3:
        j++;
        k = l;
        if (true) goto _L2; else goto _L1
_L1:
        if (flag)
        {
            l = k + 1;
            ac1[k] = c;
            flag = false;
        } else
        {
            l = k;
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    private static boolean isDelimiter(char c, char ac[])
    {
        if (ac == null)
        {
            return Character.isWhitespace(c);
        }
        int i = 0;
        int j = ac.length;
        do
        {
            if (i >= j)
            {
                return false;
            }
            if (c == ac[i])
            {
                return true;
            }
            i++;
        } while (true);
    }

    public static String swapCase(String s)
    {
        int i;
        StringBuilder stringbuilder;
        boolean flag;
        int j;
label0:
        {
            if (s != null)
            {
                i = s.length();
                if (i != 0)
                {
                    break label0;
                }
            }
            return s;
        }
        stringbuilder = new StringBuilder(i);
        flag = true;
        j = 0;
_L2:
        char c;
        char c1;
        if (j >= i)
        {
            return stringbuilder.toString();
        }
        c = s.charAt(j);
        if (!Character.isUpperCase(c))
        {
            break; /* Loop/switch isn't completed */
        }
        c1 = Character.toLowerCase(c);
_L3:
        stringbuilder.append(c1);
        flag = Character.isWhitespace(c);
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        if (Character.isTitleCase(c))
        {
            c1 = Character.toLowerCase(c);
        } else
        if (Character.isLowerCase(c))
        {
            if (flag)
            {
                c1 = Character.toTitleCase(c);
            } else
            {
                c1 = Character.toUpperCase(c);
            }
        } else
        {
            c1 = c;
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String uncapitalize(String s)
    {
        return uncapitalize(s, null);
    }

    public static transient String uncapitalize(String s, char ac[])
    {
        int j;
        StringBuilder stringbuilder;
        boolean flag;
        int k;
        int i;
        if (ac == null)
        {
            i = -1;
        } else
        {
            i = ac.length;
        }
        if (s == null || s.length() == 0 || i == 0)
        {
            return s;
        }
        j = s.length();
        stringbuilder = new StringBuilder(j);
        flag = true;
        k = 0;
_L2:
        char c;
        if (k >= j)
        {
            return stringbuilder.toString();
        }
        c = s.charAt(k);
        if (!isDelimiter(c, ac))
        {
            break; /* Loop/switch isn't completed */
        }
        stringbuilder.append(c);
        flag = true;
_L3:
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        if (flag)
        {
            stringbuilder.append(Character.toLowerCase(c));
            flag = false;
        } else
        {
            stringbuilder.append(c);
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String wrap(String s, int i)
    {
        return wrap(s, i, null, false);
    }

    public static String wrap(String s, int i, String s1, boolean flag)
    {
        if (s == null)
        {
            return null;
        }
        if (s1 == null)
        {
            s1 = SystemUtils.LINE_SEPARATOR;
        }
        if (i < 1)
        {
            i = 1;
        }
        int j = s.length();
        int k = 0;
        StringBuilder stringbuilder = new StringBuilder(j + 32);
        do
        {
            if (j - k <= i)
            {
                stringbuilder.append(s.substring(k));
                return stringbuilder.toString();
            }
            if (s.charAt(k) == ' ')
            {
                k++;
            } else
            {
                int l = s.lastIndexOf(' ', i + k);
                if (l >= k)
                {
                    stringbuilder.append(s.substring(k, l));
                    stringbuilder.append(s1);
                    k = l + 1;
                } else
                if (flag)
                {
                    stringbuilder.append(s.substring(k, i + k));
                    stringbuilder.append(s1);
                    k += i;
                } else
                {
                    int i1 = s.indexOf(' ', i + k);
                    if (i1 >= 0)
                    {
                        stringbuilder.append(s.substring(k, i1));
                        stringbuilder.append(s1);
                        k = i1 + 1;
                    } else
                    {
                        stringbuilder.append(s.substring(k));
                        k = j;
                    }
                }
            }
        } while (true);
    }
}
