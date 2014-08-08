// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package org.apache.commons.lang3:
//            CharSequenceUtils, ArrayUtils, CharUtils, ObjectUtils, 
//            SystemUtils, ClassUtils

public class StringUtils
{

    public static final String EMPTY = "";
    public static final int INDEX_NOT_FOUND = -1;
    private static final int PAD_LIMIT = 8192;

    public StringUtils()
    {
    }

    public static String abbreviate(String s, int i)
    {
        return abbreviate(s, 0, i);
    }

    public static String abbreviate(String s, int i, int j)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            if (j < 4)
            {
                throw new IllegalArgumentException("Minimum abbreviation width is 4");
            }
            if (s.length() > j)
            {
                if (i > s.length())
                {
                    i = s.length();
                }
                if (s.length() - i < j - 3)
                {
                    i = s.length() - (j - 3);
                }
                if (i <= 4)
                {
                    return (new StringBuilder(String.valueOf(s.substring(0, j - 3)))).append("...").toString();
                }
                if (j < 7)
                {
                    throw new IllegalArgumentException("Minimum abbreviation width with offset is 7");
                }
                if (i + (j - 3) < s.length())
                {
                    return (new StringBuilder("...")).append(abbreviate(s.substring(i), j - 3)).toString();
                } else
                {
                    return (new StringBuilder("...")).append(s.substring(s.length() - (j - 3))).toString();
                }
            }
        }
        return s;
    }

    public static String abbreviateMiddle(String s, String s1, int i)
    {
        while (isEmpty(s) || isEmpty(s1) || i >= s.length() || i < 2 + s1.length()) 
        {
            return s;
        }
        int j = i - s1.length();
        int k = j / 2 + j % 2;
        int l = s.length() - j / 2;
        StringBuilder stringbuilder = new StringBuilder(i);
        stringbuilder.append(s.substring(0, k));
        stringbuilder.append(s1);
        stringbuilder.append(s.substring(l));
        return stringbuilder.toString();
    }

    public static String capitalize(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            return null;
        }
        int i = charsequence.length();
        if (i == 0)
        {
            return charsequence.toString();
        } else
        {
            return (new StringBuilder(i)).append(Character.toTitleCase(charsequence.charAt(0))).append(CharSequenceUtils.subSequence(charsequence, 1)).toString();
        }
    }

    public static String center(String s, int i)
    {
        return center(s, i, ' ');
    }

    public static String center(String s, int i, char c)
    {
        if (s != null && i > 0)
        {
            int j = s.length();
            int k = i - j;
            if (k > 0)
            {
                return rightPad(leftPad(s, j + k / 2, c), i, c);
            }
        }
        return s;
    }

    public static String center(String s, int i, String s1)
    {
        if (s != null && i > 0)
        {
            if (isEmpty(s1))
            {
                s1 = " ";
            }
            int j = s.length();
            int k = i - j;
            if (k > 0)
            {
                return rightPad(leftPad(s, j + k / 2, s1), i, s1);
            }
        }
        return s;
    }

    public static String chomp(String s)
    {
        if (!isEmpty(s)) goto _L2; else goto _L1
_L1:
        return s;
_L2:
        char c1;
        if (s.length() != 1)
        {
            break; /* Loop/switch isn't completed */
        }
        if ((c1 = s.charAt(0)) == '\r' || c1 == '\n')
        {
            return "";
        }
        if (true) goto _L1; else goto _L3
_L3:
        int i;
        char c;
        i = -1 + s.length();
        c = s.charAt(i);
        if (c != '\n') goto _L5; else goto _L4
_L4:
        if (s.charAt(i - 1) == '\r')
        {
            i--;
        }
_L7:
        return s.substring(0, i);
_L5:
        if (c != '\r')
        {
            i++;
        }
        if (true) goto _L7; else goto _L6
_L6:
    }

    public static String chomp(String s, String s1)
    {
        while (isEmpty(s) || s1 == null || !s.endsWith(s1)) 
        {
            return s;
        }
        return s.substring(0, s.length() - s1.length());
    }

    public static String chop(String s)
    {
        String s1;
        if (s == null)
        {
            s1 = null;
        } else
        {
            int i = s.length();
            if (i < 2)
            {
                return "";
            }
            int j = i - 1;
            s1 = s.substring(0, j);
            if (s.charAt(j) == '\n' && s1.charAt(j - 1) == '\r')
            {
                return s1.substring(0, j - 1);
            }
        }
        return s1;
    }

    public static transient String concat(Object aobj[])
    {
        return join(aobj, ((String) (null)));
    }

    public static transient String concatWith(String s, Object aobj[])
    {
        return join(aobj, s);
    }

    public static boolean contains(String s, int i)
    {
        while (isEmpty(s) || s.indexOf(i) < 0) 
        {
            return false;
        }
        return true;
    }

    public static boolean contains(String s, String s1)
    {
        while (s == null || s1 == null || s.indexOf(s1) < 0) 
        {
            return false;
        }
        return true;
    }

    public static boolean containsAny(String s, String s1)
    {
        if (s1 == null)
        {
            return false;
        } else
        {
            return containsAny(s, s1.toCharArray());
        }
    }

    public static boolean containsAny(String s, char ac[])
    {
        boolean flag = true;
        if (!isEmpty(s) && !ArrayUtils.isEmpty(ac)) goto _L2; else goto _L1
_L1:
        flag = false;
_L6:
        return flag;
_L2:
        int i;
        int j;
        int k;
        int l;
        int i1;
        i = s.length();
        j = ac.length;
        k = i - 1;
        l = j - 1;
        i1 = 0;
_L4:
        char c;
        int j1;
        if (i1 >= i)
        {
            return false;
        }
        c = s.charAt(i1);
        j1 = 0;
_L7:
        if (j1 < j)
        {
            continue; /* Loop/switch isn't completed */
        }
        i1++;
        if (true) goto _L4; else goto _L3
_L3:
        if (ac[j1] == c && (!Character.isHighSurrogate(c) || j1 == l || i1 < k && ac[j1 + 1] == s.charAt(i1 + 1))) goto _L6; else goto _L5
_L5:
        j1++;
          goto _L7
    }

    public static boolean containsIgnoreCase(String s, String s1)
    {
        if (s != null && s1 != null)
        {
            int i = s1.length();
            int j = s.length() - i;
            int k = 0;
            while (k <= j) 
            {
                if (s.regionMatches(true, k, s1, 0, i))
                {
                    return true;
                }
                k++;
            }
        }
        return false;
    }

    public static boolean containsNone(CharSequence charsequence, String s)
    {
        if (charsequence == null || s == null)
        {
            return true;
        } else
        {
            return containsNone(charsequence, s.toCharArray());
        }
    }

    public static boolean containsNone(CharSequence charsequence, char ac[])
    {
        if (charsequence != null && ac != null) goto _L2; else goto _L1
_L1:
        boolean flag = true;
_L6:
        return flag;
_L2:
        int i;
        int j;
        int k;
        int l;
        int i1;
        i = charsequence.length();
        j = i - 1;
        k = ac.length;
        l = k - 1;
        i1 = 0;
_L4:
        char c;
        int j1;
        if (i1 >= i)
        {
            return true;
        }
        c = charsequence.charAt(i1);
        j1 = 0;
_L9:
label0:
        {
            if (j1 < k)
            {
                break label0;
            }
            i1++;
        }
        if (true) goto _L4; else goto _L3
_L3:
        boolean flag1;
        if (ac[j1] != c)
        {
            break; /* Loop/switch isn't completed */
        }
        flag1 = Character.isHighSurrogate(c);
        flag = false;
        if (!flag1) goto _L6; else goto _L5
_L5:
        flag = false;
        if (j1 == l) goto _L6; else goto _L7
_L7:
        char c1;
        char c2;
        if (i1 >= j)
        {
            break; /* Loop/switch isn't completed */
        }
        c1 = ac[j1 + 1];
        c2 = charsequence.charAt(i1 + 1);
        flag = false;
        if (c1 == c2) goto _L6; else goto _L8
_L8:
        j1++;
          goto _L9
    }

    public static boolean containsOnly(CharSequence charsequence, String s)
    {
        if (charsequence == null || s == null)
        {
            return false;
        } else
        {
            return containsOnly(charsequence, s.toCharArray());
        }
    }

    public static boolean containsOnly(CharSequence charsequence, char ac[])
    {
        boolean flag = true;
        if (ac == null || charsequence == null)
        {
            flag = false;
        } else
        if (charsequence.length() != 0)
        {
            if (ac.length == 0)
            {
                return false;
            }
            if (indexOfAnyBut(charsequence, ac) != -1)
            {
                return false;
            }
        }
        return flag;
    }

    public static boolean containsWhitespace(String s)
    {
        if (!isEmpty(s))
        {
            int i = s.length();
            int j = 0;
            while (j < i) 
            {
                if (Character.isWhitespace(s.charAt(j)))
                {
                    return true;
                }
                j++;
            }
        }
        return false;
    }

    public static int countMatches(String s, String s1)
    {
        if (!isEmpty(s) && !isEmpty(s1)) goto _L2; else goto _L1
_L1:
        int i = 0;
_L4:
        return i;
_L2:
        i = 0;
        int j = 0;
        do
        {
            int k = s.indexOf(s1, j);
            if (k == -1)
            {
                continue;
            }
            i++;
            j = k + s1.length();
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static CharSequence defaultIfEmpty(CharSequence charsequence, CharSequence charsequence1)
    {
        if (isEmpty(charsequence))
        {
            return charsequence1;
        } else
        {
            return charsequence;
        }
    }

    public static String defaultString(String s)
    {
        if (s == null)
        {
            s = "";
        }
        return s;
    }

    public static String defaultString(String s, String s1)
    {
        if (s == null)
        {
            return s1;
        } else
        {
            return s;
        }
    }

    public static String deleteWhitespace(String s)
    {
        if (!isEmpty(s)) goto _L2; else goto _L1
_L1:
        return s;
_L2:
        int i = s.length();
        char ac[] = new char[i];
        int j = 0;
        int k = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    break label0;
                }
                if (k != i)
                {
                    return new String(ac, 0, k);
                }
            }
            if (true)
            {
                continue;
            }
            int l;
            if (!Character.isWhitespace(s.charAt(j)))
            {
                l = k + 1;
                ac[k] = s.charAt(j);
            } else
            {
                l = k;
            }
            j++;
            k = l;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static String difference(String s, String s1)
    {
        if (s == null)
        {
            return s1;
        }
        if (s1 == null)
        {
            return s;
        }
        int i = indexOfDifference(s, s1);
        if (i == -1)
        {
            return "";
        } else
        {
            return s1.substring(i);
        }
    }

    public static boolean endsWith(String s, String s1)
    {
        return endsWith(s, s1, false);
    }

    private static boolean endsWith(String s, String s1, boolean flag)
    {
        boolean flag1;
        if (s == null || s1 == null)
        {
            flag1 = false;
            if (s == null)
            {
                flag1 = false;
                if (s1 == null)
                {
                    flag1 = true;
                }
            }
        } else
        {
            int i = s1.length();
            int j = s.length();
            flag1 = false;
            if (i <= j)
            {
                return s.regionMatches(flag, s.length() - s1.length(), s1, 0, s1.length());
            }
        }
        return flag1;
    }

    public static boolean endsWithIgnoreCase(String s, String s1)
    {
        return endsWith(s, s1, true);
    }

    public static boolean equals(CharSequence charsequence, CharSequence charsequence1)
    {
        if (charsequence == null)
        {
            return charsequence1 == null;
        } else
        {
            return charsequence.equals(charsequence1);
        }
    }

    public static boolean equalsIgnoreCase(String s, String s1)
    {
        if (s == null)
        {
            return s1 == null;
        } else
        {
            return s.equalsIgnoreCase(s1);
        }
    }

    public static transient String getCommonPrefix(String as[])
    {
        if (as == null || as.length == 0)
        {
            return "";
        }
        int i = indexOfDifference(as);
        if (i == -1)
        {
            if (as[0] == null)
            {
                return "";
            } else
            {
                return as[0];
            }
        }
        if (i == 0)
        {
            return "";
        } else
        {
            return as[0].substring(0, i);
        }
    }

    public static int getLevenshteinDistance(CharSequence charsequence, CharSequence charsequence1)
    {
        int i;
        int ai[];
        int ai1[];
        int l;
        if (charsequence == null || charsequence1 == null)
        {
            throw new IllegalArgumentException("Strings must not be null");
        }
        i = charsequence.length();
        int j = charsequence1.length();
        if (i == 0)
        {
            return j;
        }
        if (j == 0)
        {
            return i;
        }
        if (i > j)
        {
            CharSequence charsequence2 = charsequence;
            charsequence = charsequence1;
            charsequence1 = charsequence2;
            i = j;
            j = charsequence1.length();
        }
        ai = new int[i + 1];
        ai1 = new int[i + 1];
        int k = 0;
        do
        {
            if (k > i)
            {
                l = 1;
                break MISSING_BLOCK_LABEL_92;
            }
            ai[k] = k;
            k++;
        } while (true);
_L2:
        char c;
        int i1;
        if (l > j)
        {
            return ai[i];
        }
        c = charsequence1.charAt(l - 1);
        ai1[0] = l;
        i1 = 1;
_L3:
label0:
        {
            if (i1 <= i)
            {
                break label0;
            }
            int ai2[] = ai;
            ai = ai1;
            ai1 = ai2;
            l++;
        }
        if (true) goto _L2; else goto _L1
_L1:
        int j1;
        if (charsequence.charAt(i1 - 1) == c)
        {
            j1 = 0;
        } else
        {
            j1 = 1;
        }
        ai1[i1] = Math.min(Math.min(1 + ai1[i1 - 1], 1 + ai[i1]), j1 + ai[i1 - 1]);
        i1++;
          goto _L3
    }

    public static int indexOf(String s, int i)
    {
        if (isEmpty(s))
        {
            return -1;
        } else
        {
            return s.indexOf(i);
        }
    }

    public static int indexOf(String s, int i, int j)
    {
        if (isEmpty(s))
        {
            return -1;
        } else
        {
            return s.indexOf(i, j);
        }
    }

    public static int indexOf(String s, String s1)
    {
        if (s == null || s1 == null)
        {
            return -1;
        } else
        {
            return s.indexOf(s1);
        }
    }

    public static int indexOf(String s, String s1, int i)
    {
        if (s == null || s1 == null)
        {
            return -1;
        } else
        {
            return s.indexOf(s1, i);
        }
    }

    public static int indexOfAny(CharSequence charsequence, String s)
    {
        if (isEmpty(charsequence) || isEmpty(s))
        {
            return -1;
        } else
        {
            return indexOfAny(charsequence, s.toCharArray());
        }
    }

    public static int indexOfAny(CharSequence charsequence, char ac[])
    {
        if (!isEmpty(charsequence) && !ArrayUtils.isEmpty(ac)) goto _L2; else goto _L1
_L1:
        int i = -1;
_L6:
        return i;
_L2:
        int j;
        int k;
        int l;
        int i1;
        j = charsequence.length();
        k = j - 1;
        l = ac.length;
        i1 = l - 1;
        i = 0;
_L4:
        char c;
        int j1;
        if (i >= j)
        {
            return -1;
        }
        c = charsequence.charAt(i);
        j1 = 0;
_L7:
        if (j1 < l)
        {
            continue; /* Loop/switch isn't completed */
        }
        i++;
        if (true) goto _L4; else goto _L3
_L3:
        if (ac[j1] == c && (i >= k || j1 >= i1 || !Character.isHighSurrogate(c) || ac[j1 + 1] == charsequence.charAt(i + 1))) goto _L6; else goto _L5
_L5:
        j1++;
          goto _L7
    }

    public static int indexOfAny(String s, String as[])
    {
        if (s != null && as != null) goto _L2; else goto _L1
_L1:
        int i = -1;
_L4:
        return i;
_L2:
        int j = as.length;
        i = 0x7fffffff;
        int k = 0;
        do
        {
label0:
            {
                if (k < j)
                {
                    break label0;
                }
                if (i == 0x7fffffff)
                {
                    return -1;
                }
            }
            if (true)
            {
                continue;
            }
            String s1 = as[k];
            if (s1 != null)
            {
                int l = s.indexOf(s1);
                if (l != -1 && l < i)
                {
                    i = l;
                }
            }
            k++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static int indexOfAnyBut(CharSequence charsequence, char ac[])
    {
        if (!isEmpty(charsequence) && !ArrayUtils.isEmpty(ac)) goto _L2; else goto _L1
_L1:
        int i = -1;
_L4:
        return i;
_L2:
        int j;
        int k;
        int l;
        int i1;
        j = charsequence.length();
        k = j - 1;
        l = ac.length;
        i1 = l - 1;
        i = 0;
_L5:
        char c;
        int j1;
        if (i >= j)
        {
            return -1;
        }
        c = charsequence.charAt(i);
        j1 = 0;
_L6:
        if (j1 >= l) goto _L4; else goto _L3
_L3:
label0:
        {
            if (ac[j1] != c || i < k && j1 < i1 && Character.isHighSurrogate(c) && ac[j1 + 1] != charsequence.charAt(i + 1))
            {
                break label0;
            }
            i++;
        }
          goto _L5
        j1++;
          goto _L6
    }

    public static int indexOfAnyBut(String s, String s1)
    {
        if (!isEmpty(s) && !isEmpty(s1)) goto _L2; else goto _L1
_L1:
        int i = -1;
_L4:
        return i;
_L2:
        int j;
        j = s.length();
        i = 0;
_L5:
        boolean flag;
        if (i >= j)
        {
            return -1;
        }
        char c = s.charAt(i);
        char c1;
        if (s1.indexOf(c) >= 0)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        if (i + 1 >= j || !Character.isHighSurrogate(c))
        {
            break MISSING_BLOCK_LABEL_101;
        }
        c1 = s.charAt(i + 1);
        if (flag && s1.indexOf(c1) < 0) goto _L4; else goto _L3
_L3:
        i++;
          goto _L5
        if (!flag)
        {
            return i;
        }
          goto _L3
    }

    public static int indexOfDifference(CharSequence charsequence, CharSequence charsequence1)
    {
        int i;
        if (charsequence == charsequence1)
        {
            i = -1;
            do
            {
                return i;
            } while (i < charsequence1.length() || i < charsequence.length());
            return -1;
        } else
        {
            if (charsequence == null || charsequence1 == null)
            {
                return 0;
            }
            i = 0;
            while (i < charsequence.length() && i < charsequence1.length() && charsequence.charAt(i) == charsequence1.charAt(i)) 
            {
                i++;
            }
            continue;
        }
    }

    public static transient int indexOfDifference(CharSequence acharsequence[])
    {
        if (acharsequence != null && acharsequence.length > 1) goto _L2; else goto _L1
_L1:
        int i = -1;
_L5:
        return i;
_L2:
        int j;
        int k;
        int i1;
        int j1;
        boolean flag = false;
        boolean flag1 = true;
        j = acharsequence.length;
        i = 0x7fffffff;
        k = 0;
        int l = 0;
        do
        {
            if (l >= j)
            {
                if (flag1 || k == 0 && !flag)
                {
                    return -1;
                }
                break;
            }
            if (acharsequence[l] == null)
            {
                flag = true;
                i = 0;
            } else
            {
                i = Math.min(acharsequence[l].length(), i);
                k = Math.max(acharsequence[l].length(), k);
                flag1 = false;
            }
            l++;
        } while (true);
        if (i == 0)
        {
            return 0;
        }
        i1 = -1;
        j1 = 0;
_L7:
        if (j1 < i) goto _L4; else goto _L3
_L3:
        if (i1 != -1 || i == k)
        {
            return i1;
        }
          goto _L5
_L4:
        char c;
        int k1;
        c = acharsequence[0].charAt(j1);
        k1 = 1;
_L8:
        if (k1 < j)
        {
label0:
            {
                if (acharsequence[k1].charAt(j1) == c)
                {
                    break label0;
                }
                i1 = j1;
            }
        }
        if (i1 != -1) goto _L3; else goto _L6
_L6:
        j1++;
          goto _L7
        k1++;
          goto _L8
    }

    public static int indexOfIgnoreCase(String s, String s1)
    {
        return indexOfIgnoreCase(s, s1, 0);
    }

    public static int indexOfIgnoreCase(String s, String s1, int i)
    {
        if (s != null && s1 != null) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        if (i < 0)
        {
            i = 0;
        }
        int k = 1 + (s.length() - s1.length());
        if (i > k)
        {
            return -1;
        }
        if (s1.length() == 0)
        {
            return i;
        }
        j = i;
        do
        {
            if (j >= k)
            {
                return -1;
            }
            if (s.regionMatches(true, j, s1, 0, s1.length()))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static boolean isAllLowerCase(CharSequence charsequence)
    {
        if (charsequence != null && !isEmpty(charsequence)) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isLowerCase(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAllUpperCase(CharSequence charsequence)
    {
        if (charsequence != null && !isEmpty(charsequence)) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isUpperCase(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAlpha(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isLetter(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAlphaSpace(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isLetter(charsequence.charAt(j)) && charsequence.charAt(j) != ' ')
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAlphanumeric(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isLetterOrDigit(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAlphanumericSpace(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isLetterOrDigit(charsequence.charAt(j)) && charsequence.charAt(j) != ' ')
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isAsciiPrintable(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!CharUtils.isAsciiPrintable(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isBlank(CharSequence charsequence)
    {
        if (charsequence != null)
        {
            int i = charsequence.length();
            if (i != 0)
            {
                int j = 0;
                while (j < i) 
                {
                    if (!Character.isWhitespace(charsequence.charAt(j)))
                    {
                        return false;
                    }
                    j++;
                }
            }
        }
        return true;
    }

    public static boolean isEmpty(CharSequence charsequence)
    {
        return charsequence == null || charsequence.length() == 0;
    }

    public static boolean isNotBlank(CharSequence charsequence)
    {
        return !isBlank(charsequence);
    }

    public static boolean isNotEmpty(CharSequence charsequence)
    {
        return !isEmpty(charsequence);
    }

    public static boolean isNumeric(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isDigit(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isNumericSpace(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isDigit(charsequence.charAt(j)) && charsequence.charAt(j) != ' ')
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isWhitespace(CharSequence charsequence)
    {
        if (charsequence != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = charsequence.length();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (!Character.isWhitespace(charsequence.charAt(j)))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static String join(Iterable iterable, char c)
    {
        if (iterable == null)
        {
            return null;
        } else
        {
            return join(iterable.iterator(), c);
        }
    }

    public static String join(Iterable iterable, String s)
    {
        if (iterable == null)
        {
            return null;
        } else
        {
            return join(iterable.iterator(), s);
        }
    }

    public static String join(Iterator iterator, char c)
    {
        if (iterator == null)
        {
            return null;
        }
        if (!iterator.hasNext())
        {
            return "";
        }
        Object obj = iterator.next();
        if (!iterator.hasNext())
        {
            return ObjectUtils.toString(obj);
        }
        StringBuilder stringbuilder = new StringBuilder(256);
        if (obj != null)
        {
            stringbuilder.append(obj);
        }
        do
        {
            Object obj1;
            do
            {
                if (!iterator.hasNext())
                {
                    return stringbuilder.toString();
                }
                stringbuilder.append(c);
                obj1 = iterator.next();
            } while (obj1 == null);
            stringbuilder.append(obj1);
        } while (true);
    }

    public static String join(Iterator iterator, String s)
    {
        if (iterator == null)
        {
            return null;
        }
        if (!iterator.hasNext())
        {
            return "";
        }
        Object obj = iterator.next();
        if (!iterator.hasNext())
        {
            return ObjectUtils.toString(obj);
        }
        StringBuilder stringbuilder = new StringBuilder(256);
        if (obj != null)
        {
            stringbuilder.append(obj);
        }
        do
        {
            Object obj1;
            do
            {
                if (!iterator.hasNext())
                {
                    return stringbuilder.toString();
                }
                if (s != null)
                {
                    stringbuilder.append(s);
                }
                obj1 = iterator.next();
            } while (obj1 == null);
            stringbuilder.append(obj1);
        } while (true);
    }

    public static String join(Object aobj[])
    {
        return join(aobj, ((String) (null)));
    }

    public static String join(Object aobj[], char c)
    {
        if (aobj == null)
        {
            return null;
        } else
        {
            return join(aobj, c, 0, aobj.length);
        }
    }

    public static String join(Object aobj[], char c, int i, int j)
    {
        if (aobj == null)
        {
            return null;
        }
        int k = j - i;
        if (k <= 0)
        {
            return "";
        }
        int l;
        StringBuilder stringbuilder;
        int i1;
        if (aobj[i] == null)
        {
            l = 16;
        } else
        {
            l = aobj[i].toString().length();
        }
        stringbuilder = new StringBuilder(k * (l + 1));
        i1 = i;
        do
        {
            if (i1 >= j)
            {
                return stringbuilder.toString();
            }
            if (i1 > i)
            {
                stringbuilder.append(c);
            }
            if (aobj[i1] != null)
            {
                stringbuilder.append(aobj[i1]);
            }
            i1++;
        } while (true);
    }

    public static String join(Object aobj[], String s)
    {
        if (aobj == null)
        {
            return null;
        } else
        {
            return join(aobj, s, 0, aobj.length);
        }
    }

    public static String join(Object aobj[], String s, int i, int j)
    {
        if (aobj == null)
        {
            return null;
        }
        if (s == null)
        {
            s = "";
        }
        int k = j - i;
        if (k <= 0)
        {
            return "";
        }
        int l;
        StringBuilder stringbuilder;
        int i1;
        if (aobj[i] == null)
        {
            l = 16;
        } else
        {
            l = aobj[i].toString().length();
        }
        stringbuilder = new StringBuilder(k * (l + s.length()));
        i1 = i;
        do
        {
            if (i1 >= j)
            {
                return stringbuilder.toString();
            }
            if (i1 > i)
            {
                stringbuilder.append(s);
            }
            if (aobj[i1] != null)
            {
                stringbuilder.append(aobj[i1]);
            }
            i1++;
        } while (true);
    }

    public static int lastIndexOf(String s, int i)
    {
        if (isEmpty(s))
        {
            return -1;
        } else
        {
            return s.lastIndexOf(i);
        }
    }

    public static int lastIndexOf(String s, int i, int j)
    {
        if (isEmpty(s))
        {
            return -1;
        } else
        {
            return s.lastIndexOf(i, j);
        }
    }

    public static int lastIndexOf(String s, String s1)
    {
        if (s == null || s1 == null)
        {
            return -1;
        } else
        {
            return s.lastIndexOf(s1);
        }
    }

    public static int lastIndexOf(String s, String s1, int i)
    {
        if (s == null || s1 == null)
        {
            return -1;
        } else
        {
            return s.lastIndexOf(s1, i);
        }
    }

    public static int lastIndexOfAny(String s, String as[])
    {
        int i;
        if (s == null || as == null)
        {
            i = -1;
        } else
        {
            int j = as.length;
            i = -1;
            int k = 0;
            while (k < j) 
            {
                String s1 = as[k];
                if (s1 != null)
                {
                    int l = s.lastIndexOf(s1);
                    if (l > i)
                    {
                        i = l;
                    }
                }
                k++;
            }
        }
        return i;
    }

    public static int lastIndexOfIgnoreCase(String s, String s1)
    {
        if (s == null || s1 == null)
        {
            return -1;
        } else
        {
            return lastIndexOfIgnoreCase(s, s1, s.length());
        }
    }

    public static int lastIndexOfIgnoreCase(String s, String s1, int i)
    {
        if (s != null && s1 != null) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        if (i > s.length() - s1.length())
        {
            i = s.length() - s1.length();
        }
        if (i < 0)
        {
            return -1;
        }
        if (s1.length() == 0)
        {
            return i;
        }
        j = i;
        do
        {
            if (j < 0)
            {
                return -1;
            }
            if (s.regionMatches(true, j, s1, 0, s1.length()))
            {
                continue;
            }
            j--;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static int lastOrdinalIndexOf(String s, String s1, int i)
    {
        return ordinalIndexOf(s, s1, i, true);
    }

    public static String left(String s, int i)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            if (i < 0)
            {
                return "";
            }
            if (s.length() > i)
            {
                return s.substring(0, i);
            }
        }
        return s;
    }

    public static String leftPad(String s, int i)
    {
        return leftPad(s, i, ' ');
    }

    public static String leftPad(String s, int i, char c)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            int j = i - s.length();
            if (j > 0)
            {
                if (j > 8192)
                {
                    return leftPad(s, i, String.valueOf(c));
                } else
                {
                    return padding(j, c).concat(s);
                }
            }
        }
        return s;
    }

    public static String leftPad(String s, int i, String s1)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            if (isEmpty(s1))
            {
                s1 = " ";
            }
            int j = s1.length();
            int k = i - s.length();
            if (k > 0)
            {
                if (j == 1 && k <= 8192)
                {
                    return leftPad(s, i, s1.charAt(0));
                }
                if (k == j)
                {
                    return s1.concat(s);
                }
                if (k < j)
                {
                    return s1.substring(0, k).concat(s);
                }
                char ac[] = new char[k];
                char ac1[] = s1.toCharArray();
                int l = 0;
                do
                {
                    if (l >= k)
                    {
                        return (new String(ac)).concat(s);
                    }
                    ac[l] = ac1[l % j];
                    l++;
                } while (true);
            }
        }
        return s;
    }

    public static int length(CharSequence charsequence)
    {
        return CharSequenceUtils.length(charsequence);
    }

    public static String lowerCase(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.toLowerCase();
        }
    }

    public static String lowerCase(String s, Locale locale)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.toLowerCase(locale);
        }
    }

    public static String mid(String s, int i, int j)
    {
        if (s == null)
        {
            return null;
        }
        if (j < 0 || i > s.length())
        {
            return "";
        }
        if (i < 0)
        {
            i = 0;
        }
        if (s.length() <= i + j)
        {
            return s.substring(i);
        } else
        {
            return s.substring(i, i + j);
        }
    }

    public static int ordinalIndexOf(String s, String s1, int i)
    {
        return ordinalIndexOf(s, s1, i, false);
    }

    private static int ordinalIndexOf(String s, String s1, int i, boolean flag)
    {
        int j = -1;
        if (s != null && s1 != null && i > 0) goto _L2; else goto _L1
_L1:
        return j;
_L2:
        int k;
        if (s1.length() == 0)
        {
            int l;
            if (flag)
            {
                l = s.length();
            } else
            {
                l = 0;
            }
            return l;
        }
        k = 0;
        if (flag)
        {
            j = s.length();
        }
_L4:
        if (flag)
        {
            j = s.lastIndexOf(s1, j - 1);
        } else
        {
            j = s.indexOf(s1, j + 1);
        }
        if (j < 0) goto _L1; else goto _L3
_L3:
        if (++k >= i)
        {
            return j;
        }
          goto _L4
    }

    public static String overlay(String s, String s1, int i, int j)
    {
        if (s == null)
        {
            return null;
        }
        if (s1 == null)
        {
            s1 = "";
        }
        int k = s.length();
        if (i < 0)
        {
            i = 0;
        }
        if (i > k)
        {
            i = k;
        }
        if (j < 0)
        {
            j = 0;
        }
        if (j > k)
        {
            j = k;
        }
        if (i > j)
        {
            int l = i;
            i = j;
            j = l;
        }
        return (new StringBuilder(1 + (((k + i) - j) + s1.length()))).append(s.substring(0, i)).append(s1).append(s.substring(j)).toString();
    }

    private static String padding(int i, char c)
        throws IndexOutOfBoundsException
    {
        if (i < 0)
        {
            throw new IndexOutOfBoundsException((new StringBuilder("Cannot pad a negative amount: ")).append(i).toString());
        }
        char ac[] = new char[i];
        int j = 0;
        do
        {
            if (j >= ac.length)
            {
                return new String(ac);
            }
            ac[j] = c;
            j++;
        } while (true);
    }

    public static String remove(String s, char c)
    {
        if (isEmpty(s) || s.indexOf(c) == -1)
        {
            return s;
        }
        char ac[] = s.toCharArray();
        int i = 0;
        int j = 0;
        do
        {
            if (j >= ac.length)
            {
                return new String(ac, 0, i);
            }
            if (ac[j] != c)
            {
                int k = i + 1;
                ac[i] = ac[j];
                i = k;
            }
            j++;
        } while (true);
    }

    public static String remove(String s, String s1)
    {
        if (isEmpty(s) || isEmpty(s1))
        {
            return s;
        } else
        {
            return replace(s, s1, "", -1);
        }
    }

    public static String removeEnd(String s, String s1)
    {
        while (isEmpty(s) || isEmpty(s1) || !s.endsWith(s1)) 
        {
            return s;
        }
        return s.substring(0, s.length() - s1.length());
    }

    public static String removeEndIgnoreCase(String s, String s1)
    {
        while (isEmpty(s) || isEmpty(s1) || !endsWithIgnoreCase(s, s1)) 
        {
            return s;
        }
        return s.substring(0, s.length() - s1.length());
    }

    public static String removeStart(String s, String s1)
    {
        while (isEmpty(s) || isEmpty(s1) || !s.startsWith(s1)) 
        {
            return s;
        }
        return s.substring(s1.length());
    }

    public static String removeStartIgnoreCase(String s, String s1)
    {
        while (isEmpty(s) || isEmpty(s1) || !startsWithIgnoreCase(s, s1)) 
        {
            return s;
        }
        return s.substring(s1.length());
    }

    public static String repeat(String s, int i)
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        s = null;
_L4:
        return s;
_L2:
        int j;
        if (i <= 0)
        {
            return "";
        }
        j = s.length();
        if (i == 1 || j == 0) goto _L4; else goto _L3
_L3:
        int k;
        if (j == 1 && i <= 8192)
        {
            return padding(i, s.charAt(0));
        }
        k = j * i;
        j;
        JVM INSTR tableswitch 1 2: default 80
    //                   1 105
    //                   2 150;
           goto _L5 _L6 _L7
_L5:
        StringBuilder stringbuilder;
        int j1;
        stringbuilder = new StringBuilder(k);
        j1 = 0;
_L9:
        char c;
        char c1;
        char ac[];
        int l;
        char c2;
        char ac1[];
        int i1;
        if (j1 >= i)
        {
            return stringbuilder.toString();
        }
        stringbuilder.append(s);
        j1++;
        continue; /* Loop/switch isn't completed */
_L6:
        c2 = s.charAt(0);
        ac1 = new char[k];
        i1 = i - 1;
        do
        {
            if (i1 < 0)
            {
                return new String(ac1);
            }
            ac1[i1] = c2;
            i1--;
        } while (true);
_L7:
        c = s.charAt(0);
        c1 = s.charAt(1);
        ac = new char[k];
        l = -2 + i * 2;
        do
        {
            if (l < 0)
            {
                return new String(ac);
            }
            ac[l] = c;
            ac[l + 1] = c1;
            l = -1 + (l - 1);
        } while (true);
        if (true) goto _L9; else goto _L8
_L8:
    }

    public static String repeat(String s, String s1, int i)
    {
        if (s == null || s1 == null)
        {
            return repeat(s, i);
        } else
        {
            return removeEnd(repeat((new StringBuilder(String.valueOf(s))).append(s1).toString(), i), s1);
        }
    }

    public static String replace(String s, String s1, String s2)
    {
        return replace(s, s1, s2, -1);
    }

    public static String replace(String s, String s1, String s2, int i)
    {
        int j = 64;
        if (!isEmpty(s) && !isEmpty(s1) && s2 != null && i != 0) goto _L2; else goto _L1
_L1:
        return s;
_L2:
        int k;
        int l;
        k = 0;
        l = s.indexOf(s1, 0);
        if (l == -1) goto _L1; else goto _L3
_L3:
        int i1;
        StringBuilder stringbuilder;
        i1 = s1.length();
        int j1 = s2.length() - i1;
        if (j1 < 0)
        {
            j1 = 0;
        }
        if (i < 0)
        {
            j = 16;
        } else
        if (i <= j)
        {
            j = i;
        }
        stringbuilder = new StringBuilder(j1 * j + s.length());
_L8:
        if (l != -1) goto _L5; else goto _L4
_L4:
        stringbuilder.append(s.substring(k));
        return stringbuilder.toString();
_L5:
        stringbuilder.append(s.substring(k, l)).append(s2);
        k = l + i1;
        if (--i == 0) goto _L4; else goto _L6
_L6:
        l = s.indexOf(s1, k);
        if (true) goto _L8; else goto _L7
_L7:
    }

    public static String replaceChars(String s, char c, char c1)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.replace(c, c1);
        }
    }

    public static String replaceChars(String s, String s1, String s2)
    {
        if (!isEmpty(s) && !isEmpty(s1)) goto _L2; else goto _L1
_L1:
        return s;
_L2:
        if (s2 == null)
        {
            s2 = "";
        }
        boolean flag = false;
        int i = s2.length();
        int j = s.length();
        StringBuilder stringbuilder = new StringBuilder(j);
        int k = 0;
        do
        {
label0:
            {
                if (k < j)
                {
                    break label0;
                }
                if (flag)
                {
                    return stringbuilder.toString();
                }
            }
            if (true)
            {
                continue;
            }
            char c = s.charAt(k);
            int l = s1.indexOf(c);
            if (l >= 0)
            {
                flag = true;
                if (l < i)
                {
                    stringbuilder.append(s2.charAt(l));
                }
            } else
            {
                stringbuilder.append(c);
            }
            k++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static String replaceEach(String s, String as[], String as1[])
    {
        return replaceEach(s, as, as1, false, 0);
    }

    private static String replaceEach(String s, String as[], String as1[], boolean flag, int i)
    {
        if (s != null && s.length() != 0 && as != null && as.length != 0 && as1 != null && as1.length != 0) goto _L2; else goto _L1
_L1:
        return s;
_L2:
        int j;
        boolean aflag[];
        int l;
        int i1;
        int j1;
        if (i < 0)
        {
            throw new IllegalStateException((new StringBuilder("TimeToLive of ")).append(i).append(" is less than 0: ").append(s).toString());
        }
        j = as.length;
        int k = as1.length;
        if (j != k)
        {
            throw new IllegalArgumentException((new StringBuilder("Search and Replace array lengths don't match: ")).append(j).append(" vs ").append(k).toString());
        }
        aflag = new boolean[j];
        l = -1;
        i1 = -1;
        j1 = 0;
_L10:
        if (j1 < j) goto _L4; else goto _L3
_L3:
        if (l == -1) goto _L1; else goto _L5
_L5:
        int l1;
        int i2;
        int j2;
        l1 = 0;
        i2 = 0;
        j2 = 0;
_L11:
        if (j2 < as.length) goto _L7; else goto _L6
_L6:
        StringBuilder stringbuilder = new StringBuilder(Math.min(i2, s.length() / 5) + s.length());
_L12:
        if (l != -1) goto _L9; else goto _L8
_L8:
        int j3;
        int k3;
        j3 = s.length();
        k3 = l1;
_L14:
        if (k3 >= j3)
        {
            String s1 = stringbuilder.toString();
            int k1;
            int k2;
            int l2;
            int i3;
            int l3;
            if (!flag)
            {
                return s1;
            } else
            {
                return replaceEach(s1, as, as1, flag, i - 1);
            }
        }
        break MISSING_BLOCK_LABEL_527;
_L4:
        if (!aflag[j1] && as[j1] != null && as[j1].length() != 0 && as1[j1] != null)
        {
            k1 = s.indexOf(as[j1]);
            if (k1 == -1)
            {
                aflag[j1] = true;
            } else
            if (l == -1 || k1 < l)
            {
                l = k1;
                i1 = j1;
            }
        }
        j1++;
          goto _L10
_L7:
        if (as[j2] != null && as1[j2] != null)
        {
            l3 = as1[j2].length() - as[j2].length();
            if (l3 > 0)
            {
                i2 += l3 * 3;
            }
        }
        j2++;
          goto _L11
_L9:
        k2 = l1;
_L13:
label0:
        {
            if (k2 < l)
            {
                break label0;
            }
            stringbuilder.append(as1[i1]);
            l1 = l + as[i1].length();
            l = -1;
            i1 = -1;
            l2 = 0;
            while (l2 < j) 
            {
                if (!aflag[l2] && as[l2] != null && as[l2].length() != 0 && as1[l2] != null)
                {
                    i3 = s.indexOf(as[l2], l1);
                    if (i3 == -1)
                    {
                        aflag[l2] = true;
                    } else
                    if (l == -1 || i3 < l)
                    {
                        l = i3;
                        i1 = l2;
                    }
                }
                l2++;
            }
        }
          goto _L12
        stringbuilder.append(s.charAt(k2));
        k2++;
          goto _L13
        stringbuilder.append(s.charAt(k3));
        k3++;
          goto _L14
    }

    public static String replaceEachRepeatedly(String s, String as[], String as1[])
    {
        int i;
        if (as == null)
        {
            i = 0;
        } else
        {
            i = as.length;
        }
        return replaceEach(s, as, as1, true, i);
    }

    public static String replaceOnce(String s, String s1, String s2)
    {
        return replace(s, s1, s2, 1);
    }

    public static String reverse(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return (new StringBuilder(s)).reverse().toString();
        }
    }

    public static String reverseDelimited(String s, char c)
    {
        if (s == null)
        {
            return null;
        } else
        {
            String as[] = split(s, c);
            ArrayUtils.reverse(as);
            return join(as, c);
        }
    }

    public static String right(String s, int i)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            if (i < 0)
            {
                return "";
            }
            if (s.length() > i)
            {
                return s.substring(s.length() - i);
            }
        }
        return s;
    }

    public static String rightPad(String s, int i)
    {
        return rightPad(s, i, ' ');
    }

    public static String rightPad(String s, int i, char c)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            int j = i - s.length();
            if (j > 0)
            {
                if (j > 8192)
                {
                    return rightPad(s, i, String.valueOf(c));
                } else
                {
                    return s.concat(padding(j, c));
                }
            }
        }
        return s;
    }

    public static String rightPad(String s, int i, String s1)
    {
        if (s == null)
        {
            s = null;
        } else
        {
            if (isEmpty(s1))
            {
                s1 = " ";
            }
            int j = s1.length();
            int k = i - s.length();
            if (k > 0)
            {
                if (j == 1 && k <= 8192)
                {
                    return rightPad(s, i, s1.charAt(0));
                }
                if (k == j)
                {
                    return s.concat(s1);
                }
                if (k < j)
                {
                    return s.concat(s1.substring(0, k));
                }
                char ac[] = new char[k];
                char ac1[] = s1.toCharArray();
                int l = 0;
                do
                {
                    if (l >= k)
                    {
                        return s.concat(new String(ac));
                    }
                    ac[l] = ac1[l % j];
                    l++;
                } while (true);
            }
        }
        return s;
    }

    public static String[] split(String s)
    {
        return split(s, null, -1);
    }

    public static String[] split(String s, char c)
    {
        return splitWorker(s, c, false);
    }

    public static String[] split(String s, String s1)
    {
        return splitWorker(s, s1, -1, false);
    }

    public static String[] split(String s, String s1, int i)
    {
        return splitWorker(s, s1, i, false);
    }

    public static String[] splitByCharacterType(String s)
    {
        return splitByCharacterType(s, false);
    }

    private static String[] splitByCharacterType(String s, boolean flag)
    {
        char ac[];
        ArrayList arraylist;
        int i;
        int j;
        int k;
        if (s == null)
        {
            return null;
        }
        if (s.length() == 0)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        ac = s.toCharArray();
        arraylist = new ArrayList();
        i = 0;
        j = Character.getType(ac[0]);
        k = 0 + 1;
_L2:
        int l;
        if (k >= ac.length)
        {
            arraylist.add(new String(ac, i, ac.length - i));
            return (String[])arraylist.toArray(new String[arraylist.size()]);
        }
        l = Character.getType(ac[k]);
        if (l != j)
        {
            break; /* Loop/switch isn't completed */
        }
_L3:
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        if (flag && l == 2 && j == 1)
        {
            int i1 = k - 1;
            if (i1 != i)
            {
                arraylist.add(new String(ac, i, i1 - i));
                i = i1;
            }
        } else
        {
            arraylist.add(new String(ac, i, k - i));
            i = k;
        }
        j = l;
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String[] splitByCharacterTypeCamelCase(String s)
    {
        return splitByCharacterType(s, true);
    }

    public static String[] splitByWholeSeparator(String s, String s1)
    {
        return splitByWholeSeparatorWorker(s, s1, -1, false);
    }

    public static String[] splitByWholeSeparator(String s, String s1, int i)
    {
        return splitByWholeSeparatorWorker(s, s1, i, false);
    }

    public static String[] splitByWholeSeparatorPreserveAllTokens(String s, String s1)
    {
        return splitByWholeSeparatorWorker(s, s1, -1, true);
    }

    public static String[] splitByWholeSeparatorPreserveAllTokens(String s, String s1, int i)
    {
        return splitByWholeSeparatorWorker(s, s1, i, true);
    }

    private static String[] splitByWholeSeparatorWorker(String s, String s1, int i, boolean flag)
    {
        if (s == null)
        {
            return null;
        }
        int j = s.length();
        if (j == 0)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        if (s1 == null || "".equals(s1))
        {
            return splitWorker(s, null, i, flag);
        }
        int k = s1.length();
        ArrayList arraylist = new ArrayList();
        int l = 0;
        int i1 = 0;
        int j1 = 0;
        do
        {
            if (j1 >= j)
            {
                return (String[])arraylist.toArray(new String[arraylist.size()]);
            }
            j1 = s.indexOf(s1, i1);
            if (j1 > -1)
            {
                if (j1 > i1)
                {
                    if (++l == i)
                    {
                        j1 = j;
                        arraylist.add(s.substring(i1));
                    } else
                    {
                        arraylist.add(s.substring(i1, j1));
                        i1 = j1 + k;
                    }
                } else
                {
                    if (flag)
                    {
                        if (++l == i)
                        {
                            j1 = j;
                            arraylist.add(s.substring(i1));
                        } else
                        {
                            arraylist.add("");
                        }
                    }
                    i1 = j1 + k;
                }
            } else
            {
                arraylist.add(s.substring(i1));
                j1 = j;
            }
        } while (true);
    }

    public static String[] splitPreserveAllTokens(String s)
    {
        return splitWorker(s, null, -1, true);
    }

    public static String[] splitPreserveAllTokens(String s, char c)
    {
        return splitWorker(s, c, true);
    }

    public static String[] splitPreserveAllTokens(String s, String s1)
    {
        return splitWorker(s, s1, -1, true);
    }

    public static String[] splitPreserveAllTokens(String s, String s1, int i)
    {
        return splitWorker(s, s1, i, true);
    }

    private static String[] splitWorker(String s, char c, boolean flag)
    {
        if (s == null)
        {
            return null;
        }
        int i = s.length();
        if (i == 0)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        ArrayList arraylist = new ArrayList();
        int j = 0;
        int k = 0;
        boolean flag1 = false;
        boolean flag2 = false;
        do
        {
            if (j >= i)
            {
                if (flag1 || flag && flag2)
                {
                    arraylist.add(s.substring(k, j));
                }
                return (String[])arraylist.toArray(new String[arraylist.size()]);
            }
            if (s.charAt(j) == c)
            {
                if (flag1 || flag)
                {
                    arraylist.add(s.substring(k, j));
                    flag1 = false;
                    flag2 = true;
                }
                k = ++j;
            } else
            {
                flag1 = true;
                j++;
                flag2 = false;
            }
        } while (true);
    }

    private static String[] splitWorker(String s, String s1, int i, boolean flag)
    {
        int j;
        ArrayList arraylist;
        int k;
        int l;
        boolean flag1;
        boolean flag2;
        if (s == null)
        {
            return null;
        }
        j = s.length();
        if (j == 0)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        arraylist = new ArrayList();
        k = 0;
        l = 0;
        flag1 = false;
        flag2 = false;
        if (s1 != null) goto _L2; else goto _L1
_L1:
        int i2 = 1;
_L5:
        if (k < j) goto _L4; else goto _L3
_L3:
        i2;
_L6:
        if (flag1 || flag && flag2)
        {
            arraylist.add(s.substring(l, k));
        }
        return (String[])arraylist.toArray(new String[arraylist.size()]);
_L4:
        if (Character.isWhitespace(s.charAt(k)))
        {
            int i1;
            int j1;
            char c;
            int k1;
            int l1;
            int j2;
            if (flag1 || flag)
            {
                flag2 = true;
                j2 = i2 + 1;
                if (i2 == i)
                {
                    k = j;
                    flag2 = false;
                }
                arraylist.add(s.substring(l, k));
                flag1 = false;
            } else
            {
                j2 = i2;
            }
            l = ++k;
            i2 = j2;
        } else
        {
            flag1 = true;
            k++;
            flag2 = false;
        }
          goto _L5
_L2:
        if (s1.length() != 1)
        {
            break MISSING_BLOCK_LABEL_429;
        }
        c = s1.charAt(0);
        k1 = 1;
_L7:
label0:
        {
            if (k < j)
            {
                break label0;
            }
            k1;
        }
          goto _L6
        if (s.charAt(k) == c)
        {
            if (flag1 || flag)
            {
                flag2 = true;
                l1 = k1 + 1;
                if (k1 == i)
                {
                    k = j;
                    flag2 = false;
                }
                arraylist.add(s.substring(l, k));
                flag1 = false;
            } else
            {
                l1 = k1;
            }
            l = ++k;
            k1 = l1;
        } else
        {
            flag1 = true;
            k++;
            flag2 = false;
        }
          goto _L7
        i1 = 1;
        k = 0;
        flag2 = false;
        flag1 = false;
        l = 0;
        while (k < j) 
        {
            if (s1.indexOf(s.charAt(k)) >= 0)
            {
                if (flag1 || flag)
                {
                    flag2 = true;
                    j1 = i1 + 1;
                    if (i1 == i)
                    {
                        k = j;
                        flag2 = false;
                    }
                    arraylist.add(s.substring(l, k));
                    flag1 = false;
                } else
                {
                    j1 = i1;
                }
                l = ++k;
                i1 = j1;
            } else
            {
                flag1 = true;
                k++;
                flag2 = false;
            }
        }
        i1;
          goto _L6
    }

    public static boolean startsWith(String s, String s1)
    {
        return startsWith(s, s1, false);
    }

    private static boolean startsWith(String s, String s1, boolean flag)
    {
        boolean flag1;
        if (s == null || s1 == null)
        {
            flag1 = false;
            if (s == null)
            {
                flag1 = false;
                if (s1 == null)
                {
                    flag1 = true;
                }
            }
        } else
        {
            int i = s1.length();
            int j = s.length();
            flag1 = false;
            if (i <= j)
            {
                return s.regionMatches(flag, 0, s1, 0, s1.length());
            }
        }
        return flag1;
    }

    public static transient boolean startsWithAny(String s, String as[])
    {
        if (!isEmpty(s) && !ArrayUtils.isEmpty(as))
        {
            int i = 0;
            while (i < as.length) 
            {
                if (startsWith(s, as[i]))
                {
                    return true;
                }
                i++;
            }
        }
        return false;
    }

    public static boolean startsWithIgnoreCase(String s, String s1)
    {
        return startsWith(s, s1, true);
    }

    public static String strip(String s)
    {
        return strip(s, null);
    }

    public static String strip(String s, String s1)
    {
        if (isEmpty(s))
        {
            return s;
        } else
        {
            return stripEnd(stripStart(s, s1), s1);
        }
    }

    public static String stripAccents(String s)
    {
        if (s == null)
        {
            return null;
        }
        if (SystemUtils.isJavaVersionAtLeast(1.6F))
        {
            String s2;
            try
            {
                Class class1 = ClassUtils.getClass("java.text.Normalizer$Form", false);
                Method method = ClassUtils.getClass("java.text.Normalizer", false).getMethod("normalize", new Class[] {
                    java/lang/CharSequence, class1
                });
                Field field = class1.getField("NFD");
                Object aobj[] = new Object[2];
                aobj[0] = s;
                aobj[1] = field.get(null);
                String s1 = (String)method.invoke(null, aobj);
                s2 = Pattern.compile("\\p{InCombiningDiacriticalMarks}+").matcher(s1).replaceAll("");
            }
            catch (ClassNotFoundException classnotfoundexception)
            {
                throw new RuntimeException("ClassNotFoundException occurred during 1.6 backcompat code", classnotfoundexception);
            }
            catch (NoSuchMethodException nosuchmethodexception)
            {
                throw new RuntimeException("NoSuchMethodException occurred during 1.6 backcompat code", nosuchmethodexception);
            }
            catch (NoSuchFieldException nosuchfieldexception)
            {
                throw new RuntimeException("NoSuchFieldException occurred during 1.6 backcompat code", nosuchfieldexception);
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                throw new RuntimeException("IllegalAccessException occurred during 1.6 backcompat code", illegalaccessexception);
            }
            catch (IllegalArgumentException illegalargumentexception)
            {
                throw new RuntimeException("IllegalArgumentException occurred during 1.6 backcompat code", illegalargumentexception);
            }
            catch (InvocationTargetException invocationtargetexception)
            {
                throw new RuntimeException("InvocationTargetException occurred during 1.6 backcompat code", invocationtargetexception);
            }
            catch (SecurityException securityexception)
            {
                throw new RuntimeException("SecurityException occurred during 1.6 backcompat code", securityexception);
            }
            return s2;
        } else
        {
            throw new UnsupportedOperationException("The stripAccents(String) method is not supported until Java 1.6");
        }
    }

    public static String[] stripAll(String as[])
    {
        return stripAll(as, null);
    }

    public static String[] stripAll(String as[], String s)
    {
        if (as == null) goto _L2; else goto _L1
_L1:
        int i = as.length;
        if (i != 0) goto _L3; else goto _L2
_L2:
        String as1[] = as;
_L5:
        return as1;
_L3:
        as1 = new String[i];
        int j = 0;
        while (j < i) 
        {
            as1[j] = strip(as[j], s);
            j++;
        }
        if (true) goto _L5; else goto _L4
_L4:
    }

    public static String stripEnd(String s, String s1)
    {
        if (s == null) goto _L2; else goto _L1
_L1:
        int i = s.length();
        if (i != 0) goto _L3; else goto _L2
_L2:
        return s;
_L3:
        if (s1 != null)
        {
            continue; /* Loop/switch isn't completed */
        }
_L6:
        if (i != 0 && Character.isWhitespace(s.charAt(i - 1))) goto _L5; else goto _L4
_L4:
        return s.substring(0, i);
_L5:
        i--;
          goto _L6
        if (s1.length() == 0) goto _L2; else goto _L7
_L7:
        while (i != 0 && s1.indexOf(s.charAt(i - 1)) != -1) 
        {
            i--;
        }
          goto _L4
    }

    public static String stripStart(String s, String s1)
    {
        if (s == null) goto _L2; else goto _L1
_L1:
        int i = s.length();
        if (i != 0) goto _L3; else goto _L2
_L2:
        return s;
_L3:
        int j = 0;
        if (s1 != null) goto _L5; else goto _L4
_L4:
        if (j != i && Character.isWhitespace(s.charAt(j))) goto _L7; else goto _L6
_L6:
        return s.substring(j);
_L7:
        j++;
          goto _L4
_L5:
        int k;
        k = s1.length();
        j = 0;
        if (k == 0) goto _L2; else goto _L8
_L8:
        while (j != i && s1.indexOf(s.charAt(j)) != -1) 
        {
            j++;
        }
          goto _L6
    }

    public static String stripToEmpty(String s)
    {
        if (s == null)
        {
            return "";
        } else
        {
            return strip(s, null);
        }
    }

    public static String stripToNull(String s)
    {
        if (s == null)
        {
            return null;
        }
        String s1 = strip(s, null);
        if (s1.length() == 0)
        {
            s1 = null;
        }
        return s1;
    }

    public static String substring(String s, int i)
    {
        if (s == null)
        {
            return null;
        }
        if (i < 0)
        {
            i += s.length();
        }
        if (i < 0)
        {
            i = 0;
        }
        if (i > s.length())
        {
            return "";
        } else
        {
            return s.substring(i);
        }
    }

    public static String substring(String s, int i, int j)
    {
        if (s == null)
        {
            return null;
        }
        if (j < 0)
        {
            j += s.length();
        }
        if (i < 0)
        {
            i += s.length();
        }
        if (j > s.length())
        {
            j = s.length();
        }
        if (i > j)
        {
            return "";
        }
        if (i < 0)
        {
            i = 0;
        }
        if (j < 0)
        {
            j = 0;
        }
        return s.substring(i, j);
    }

    public static String substringAfter(String s, String s1)
    {
        if (isEmpty(s))
        {
            return s;
        }
        if (s1 == null)
        {
            return "";
        }
        int i = s.indexOf(s1);
        if (i == -1)
        {
            return "";
        } else
        {
            return s.substring(i + s1.length());
        }
    }

    public static String substringAfterLast(String s, String s1)
    {
        if (isEmpty(s))
        {
            return s;
        }
        if (isEmpty(s1))
        {
            return "";
        }
        int i = s.lastIndexOf(s1);
        if (i == -1 || i == s.length() - s1.length())
        {
            return "";
        } else
        {
            return s.substring(i + s1.length());
        }
    }

    public static String substringBefore(String s, String s1)
    {
        if (!isEmpty(s) && s1 != null)
        {
            if (s1.length() == 0)
            {
                return "";
            }
            int i = s.indexOf(s1);
            if (i != -1)
            {
                return s.substring(0, i);
            }
        }
        return s;
    }

    public static String substringBeforeLast(String s, String s1)
    {
        int i;
        if (!isEmpty(s) && !isEmpty(s1))
        {
            if ((i = s.lastIndexOf(s1)) != -1)
            {
                return s.substring(0, i);
            }
        }
        return s;
    }

    public static String substringBetween(String s, String s1)
    {
        return substringBetween(s, s1, s1);
    }

    public static String substringBetween(String s, String s1, String s2)
    {
        int i;
        int j;
        if (s != null && s1 != null && s2 != null)
        {
            if ((i = s.indexOf(s1)) != -1 && (j = s.indexOf(s2, i + s1.length())) != -1)
            {
                return s.substring(i + s1.length(), j);
            }
        }
        return null;
    }

    public static String[] substringsBetween(String s, String s1, String s2)
    {
        if (s != null && !isEmpty(s1) && !isEmpty(s2)) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        int i;
        int j;
        int k;
        ArrayList arraylist;
        int l;
        i = s.length();
        if (i == 0)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        j = s2.length();
        k = s1.length();
        arraylist = new ArrayList();
        l = 0;
_L7:
        if (l < i - j) goto _L4; else goto _L3
_L3:
        if (!arraylist.isEmpty())
        {
            return (String[])arraylist.toArray(new String[arraylist.size()]);
        }
          goto _L1
_L4:
        int i1 = s.indexOf(s1, l);
        if (i1 < 0) goto _L3; else goto _L5
_L5:
        int j1;
        int k1;
        j1 = i1 + k;
        k1 = s.indexOf(s2, j1);
        if (k1 < 0) goto _L3; else goto _L6
_L6:
        arraylist.add(s.substring(j1, k1));
        l = k1 + j;
          goto _L7
    }

    public static String swapCase(String s)
    {
        int i;
        StringBuilder stringbuilder;
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
        j = 0;
_L2:
        char c;
        if (j >= i)
        {
            return stringbuilder.toString();
        }
        c = s.charAt(j);
        if (!Character.isUpperCase(c))
        {
            break; /* Loop/switch isn't completed */
        }
        c = Character.toLowerCase(c);
_L3:
        stringbuilder.append(c);
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        if (Character.isTitleCase(c))
        {
            c = Character.toLowerCase(c);
        } else
        if (Character.isLowerCase(c))
        {
            c = Character.toUpperCase(c);
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String trim(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.trim();
        }
    }

    public static String trimToEmpty(String s)
    {
        if (s == null)
        {
            return "";
        } else
        {
            return s.trim();
        }
    }

    public static String trimToNull(String s)
    {
        String s1 = trim(s);
        if (isEmpty(s1))
        {
            s1 = null;
        }
        return s1;
    }

    public static String uncapitalize(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            return null;
        }
        int i = charsequence.length();
        if (i == 0)
        {
            return charsequence.toString();
        } else
        {
            return (new StringBuilder(i)).append(Character.toLowerCase(charsequence.charAt(0))).append(CharSequenceUtils.subSequence(charsequence, 1)).toString();
        }
    }

    public static String upperCase(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.toUpperCase();
        }
    }

    public static String upperCase(String s, Locale locale)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return s.toUpperCase(locale);
        }
    }
}
