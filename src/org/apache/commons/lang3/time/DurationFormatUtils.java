// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.apache.commons.lang3.StringUtils;

public class DurationFormatUtils
{
    static class Token
    {

        private int count;
        private Object value;

        static boolean containsTokenWithValue(Token atoken[], Object obj)
        {
            int i = atoken.length;
            int j = 0;
            do
            {
                if (j >= i)
                {
                    return false;
                }
                if (atoken[j].getValue() == obj)
                {
                    return true;
                }
                j++;
            } while (true);
        }

        public boolean equals(Object obj)
        {
            Token token;
            if (obj instanceof Token)
            {
                token = (Token)obj;
                break MISSING_BLOCK_LABEL_12;
            }
_L1:
            return false;
            if (value.getClass() == token.value.getClass() && count == token.count)
            {
                if (value instanceof StringBuffer)
                {
                    return value.toString().equals(token.value.toString());
                }
                if (value instanceof Number)
                {
                    return value.equals(token.value);
                }
                if (value == token.value)
                {
                    return true;
                }
            }
              goto _L1
        }

        int getCount()
        {
            return count;
        }

        Object getValue()
        {
            return value;
        }

        public int hashCode()
        {
            return value.hashCode();
        }

        void increment()
        {
            count = 1 + count;
        }

        public String toString()
        {
            return StringUtils.repeat(value.toString(), count);
        }

        Token(Object obj)
        {
            value = obj;
            count = 1;
        }

        Token(Object obj, int i)
        {
            value = obj;
            count = i;
        }
    }


    static final Object H = "H";
    public static final String ISO_EXTENDED_FORMAT_PATTERN = "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'";
    static final Object M = "M";
    static final Object S = "S";
    static final Object d = "d";
    static final Object m = "m";
    static final Object s = "s";
    static final Object y = "y";

    public DurationFormatUtils()
    {
    }

    static String format(Token atoken[], int i, int j, int k, int l, int i1, int j1, int k1, 
            boolean flag)
    {
        StringBuffer stringbuffer;
        boolean flag1;
        int l1;
        int i2;
        stringbuffer = new StringBuffer();
        flag1 = false;
        l1 = atoken.length;
        i2 = 0;
_L2:
        Object obj;
        int j2;
        if (i2 >= l1)
        {
            return stringbuffer.toString();
        }
        Token token = atoken[i2];
        obj = token.getValue();
        j2 = token.getCount();
        if (!(obj instanceof StringBuffer))
        {
            break; /* Loop/switch isn't completed */
        }
        stringbuffer.append(obj.toString());
_L3:
        i2++;
        if (true) goto _L2; else goto _L1
_L1:
        if (obj == y)
        {
            String s8;
            if (flag)
            {
                s8 = StringUtils.leftPad(Integer.toString(i), j2, '0');
            } else
            {
                s8 = Integer.toString(i);
            }
            stringbuffer.append(s8);
            flag1 = false;
        } else
        if (obj == M)
        {
            String s7;
            if (flag)
            {
                s7 = StringUtils.leftPad(Integer.toString(j), j2, '0');
            } else
            {
                s7 = Integer.toString(j);
            }
            stringbuffer.append(s7);
            flag1 = false;
        } else
        if (obj == d)
        {
            String s6;
            if (flag)
            {
                s6 = StringUtils.leftPad(Integer.toString(k), j2, '0');
            } else
            {
                s6 = Integer.toString(k);
            }
            stringbuffer.append(s6);
            flag1 = false;
        } else
        if (obj == H)
        {
            String s5;
            if (flag)
            {
                s5 = StringUtils.leftPad(Integer.toString(l), j2, '0');
            } else
            {
                s5 = Integer.toString(l);
            }
            stringbuffer.append(s5);
            flag1 = false;
        } else
        if (obj == m)
        {
            String s4;
            if (flag)
            {
                s4 = StringUtils.leftPad(Integer.toString(i1), j2, '0');
            } else
            {
                s4 = Integer.toString(i1);
            }
            stringbuffer.append(s4);
            flag1 = false;
        } else
        if (obj == s)
        {
            String s3;
            if (flag)
            {
                s3 = StringUtils.leftPad(Integer.toString(j1), j2, '0');
            } else
            {
                s3 = Integer.toString(j1);
            }
            stringbuffer.append(s3);
            flag1 = true;
        } else
        if (obj == S)
        {
            if (flag1)
            {
                k1 += 1000;
                String s2;
                if (flag)
                {
                    s2 = StringUtils.leftPad(Integer.toString(k1), j2, '0');
                } else
                {
                    s2 = Integer.toString(k1);
                }
                stringbuffer.append(s2.substring(1));
            } else
            {
                String s1;
                if (flag)
                {
                    s1 = StringUtils.leftPad(Integer.toString(k1), j2, '0');
                } else
                {
                    s1 = Integer.toString(k1);
                }
                stringbuffer.append(s1);
            }
            flag1 = false;
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public static String formatDuration(long l, String s1)
    {
        return formatDuration(l, s1, true);
    }

    public static String formatDuration(long l, String s1, boolean flag)
    {
        Token atoken[] = lexx(s1);
        boolean flag1 = Token.containsTokenWithValue(atoken, d);
        int i = 0;
        if (flag1)
        {
            i = (int)(l / 0x5265c00L);
            l -= 0x5265c00L * (long)i;
        }
        boolean flag2 = Token.containsTokenWithValue(atoken, H);
        int j = 0;
        if (flag2)
        {
            j = (int)(l / 0x36ee80L);
            l -= 0x36ee80L * (long)j;
        }
        boolean flag3 = Token.containsTokenWithValue(atoken, m);
        int k = 0;
        if (flag3)
        {
            k = (int)(l / 60000L);
            l -= 60000L * (long)k;
        }
        boolean flag4 = Token.containsTokenWithValue(atoken, s);
        int i1 = 0;
        if (flag4)
        {
            i1 = (int)(l / 1000L);
            l -= 1000L * (long)i1;
        }
        boolean flag5 = Token.containsTokenWithValue(atoken, S);
        int j1 = 0;
        if (flag5)
        {
            j1 = (int)l;
        }
        return format(atoken, 0, 0, i, j, k, i1, j1, flag);
    }

    public static String formatDurationHMS(long l)
    {
        return formatDuration(l, "H:mm:ss.SSS");
    }

    public static String formatDurationISO(long l)
    {
        return formatDuration(l, "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'", false);
    }

    public static String formatDurationWords(long l, boolean flag, boolean flag1)
    {
        String s1 = formatDuration(l, "d' days 'H' hours 'm' minutes 's' seconds'");
        if (flag)
        {
            s1 = (new StringBuilder(" ")).append(s1).toString();
            String s5 = StringUtils.replaceOnce(s1, " 0 days", "");
            if (s5.length() != s1.length())
            {
                s1 = s5;
                String s6 = StringUtils.replaceOnce(s1, " 0 hours", "");
                if (s6.length() != s1.length())
                {
                    String s7 = StringUtils.replaceOnce(s6, " 0 minutes", "");
                    s1 = s7;
                    if (s7.length() != s1.length())
                    {
                        s1 = StringUtils.replaceOnce(s7, " 0 seconds", "");
                    }
                }
            }
            if (s1.length() != 0)
            {
                s1 = s1.substring(1);
            }
        }
        if (flag1)
        {
            String s2 = StringUtils.replaceOnce(s1, " 0 seconds", "");
            if (s2.length() != s1.length())
            {
                s1 = s2;
                String s3 = StringUtils.replaceOnce(s1, " 0 minutes", "");
                if (s3.length() != s1.length())
                {
                    s1 = s3;
                    String s4 = StringUtils.replaceOnce(s1, " 0 hours", "");
                    if (s4.length() != s1.length())
                    {
                        s1 = StringUtils.replaceOnce(s4, " 0 days", "");
                    }
                }
            }
        }
        return StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce((new StringBuilder(" ")).append(s1).toString(), " 1 seconds", " 1 second"), " 1 minutes", " 1 minute"), " 1 hours", " 1 hour"), " 1 days", " 1 day").trim();
    }

    public static String formatPeriod(long l, long l1, String s1)
    {
        return formatPeriod(l, l1, s1, true, TimeZone.getDefault());
    }

    public static String formatPeriod(long l, long l1, String s1, boolean flag, TimeZone timezone)
    {
        Token atoken[];
        Calendar calendar;
        Calendar calendar1;
        int i;
        int j;
        int k;
        int i1;
        int j1;
        int k1;
        int i2;
        atoken = lexx(s1);
        calendar = Calendar.getInstance(timezone);
        calendar.setTime(new Date(l));
        calendar1 = Calendar.getInstance(timezone);
        calendar1.setTime(new Date(l1));
        i = calendar1.get(14) - calendar.get(14);
        j = calendar1.get(13) - calendar.get(13);
        k = calendar1.get(12) - calendar.get(12);
        i1 = calendar1.get(11) - calendar.get(11);
        j1 = calendar1.get(5) - calendar.get(5);
        k1 = calendar1.get(2) - calendar.get(2);
        i2 = calendar1.get(1) - calendar.get(1);
_L18:
        if (i < 0) goto _L2; else goto _L1
_L1:
        if (j < 0) goto _L4; else goto _L3
_L3:
        if (k < 0) goto _L6; else goto _L5
_L5:
        if (i1 < 0) goto _L8; else goto _L7
_L7:
        if (!Token.containsTokenWithValue(atoken, M)) goto _L10; else goto _L9
_L9:
        if (j1 < 0) goto _L12; else goto _L11
_L11:
        if (k1 < 0) goto _L14; else goto _L13
_L13:
        if (Token.containsTokenWithValue(atoken, y) || i2 == 0) goto _L16; else goto _L15
_L15:
        if (i2 != 0) goto _L17; else goto _L16
_L16:
        if (!Token.containsTokenWithValue(atoken, d))
        {
            i1 += j1 * 24;
            j1 = 0;
        }
        if (!Token.containsTokenWithValue(atoken, H))
        {
            k += i1 * 60;
            i1 = 0;
        }
        if (!Token.containsTokenWithValue(atoken, m))
        {
            j += k * 60;
            k = 0;
        }
        if (!Token.containsTokenWithValue(atoken, s))
        {
            i += j * 1000;
            j = 0;
        }
        return format(atoken, i2, k1, j1, i1, k, j, i, flag);
_L2:
        i += 1000;
        j--;
          goto _L18
_L4:
        j += 60;
        k--;
          goto _L1
_L6:
        k += 60;
        i1--;
          goto _L3
_L8:
        i1 += 24;
        j1--;
          goto _L5
_L12:
        j1 += calendar.getActualMaximum(5);
        k1--;
        calendar.add(2, 1);
          goto _L9
_L14:
        k1 += 12;
        i2--;
          goto _L11
_L17:
        k1 += i2 * 12;
        i2 = 0;
          goto _L15
_L10:
        if (Token.containsTokenWithValue(atoken, y)) goto _L20; else goto _L19
_L19:
        int j2;
        j2 = calendar1.get(1);
        if (k1 < 0)
        {
            j2--;
        }
_L23:
        if (calendar.get(1) != j2) goto _L22; else goto _L21
_L21:
        i2 = 0;
_L20:
        if (calendar.get(2) != calendar1.get(2))
        {
            break MISSING_BLOCK_LABEL_591;
        }
        k1 = 0;
        while (j1 < 0) 
        {
            j1 += calendar.getActualMaximum(5);
            k1--;
            calendar.add(2, 1);
        }
          goto _L16
_L22:
        int k2 = j1 + (calendar.getActualMaximum(6) - calendar.get(6));
        if ((calendar instanceof GregorianCalendar) && calendar.get(2) == 1 && calendar.get(5) == 29)
        {
            k2++;
        }
        calendar.add(1, 1);
        j1 = k2 + calendar.get(6);
          goto _L23
        j1 += calendar.getActualMaximum(5);
        calendar.add(2, 1);
          goto _L20
    }

    public static String formatPeriodISO(long l, long l1)
    {
        return formatPeriod(l, l1, "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'", false, TimeZone.getDefault());
    }

    static Token[] lexx(String s1)
    {
        char ac[];
        ArrayList arraylist;
        boolean flag;
        StringBuffer stringbuffer;
        Token token;
        int i;
        int j;
        ac = s1.toCharArray();
        arraylist = new ArrayList(ac.length);
        flag = false;
        stringbuffer = null;
        token = null;
        i = ac.length;
        j = 0;
_L2:
        char c;
        if (j >= i)
        {
            return (Token[])arraylist.toArray(new Token[arraylist.size()]);
        }
        c = ac[j];
        if (!flag || c == '\'')
        {
            break; /* Loop/switch isn't completed */
        }
        stringbuffer.append(c);
_L12:
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        Object obj = null;
        c;
        JVM INSTR lookupswitch 8: default 164
    //                   39: 231
    //                   72: 301
    //                   77: 285
    //                   83: 325
    //                   100: 293
    //                   109: 309
    //                   115: 317
    //                   121: 277;
           goto _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11
_L7:
        break MISSING_BLOCK_LABEL_325;
_L3:
        if (stringbuffer == null)
        {
            stringbuffer = new StringBuffer();
            arraylist.add(new Token(stringbuffer));
        }
        stringbuffer.append(c);
_L13:
        if (obj != null)
        {
            if (token != null && token.getValue() == obj)
            {
                token.increment();
            } else
            {
                Token token1 = new Token(obj);
                arraylist.add(token1);
                token = token1;
            }
            stringbuffer = null;
        }
          goto _L12
_L4:
        if (flag)
        {
            stringbuffer = null;
            flag = false;
            obj = null;
        } else
        {
            stringbuffer = new StringBuffer();
            arraylist.add(new Token(stringbuffer));
            flag = true;
            obj = null;
        }
          goto _L13
_L11:
        obj = y;
          goto _L13
_L6:
        obj = M;
          goto _L13
_L8:
        obj = d;
          goto _L13
_L5:
        obj = H;
          goto _L13
_L9:
        obj = m;
          goto _L13
_L10:
        obj = s;
          goto _L13
        obj = S;
          goto _L13
    }

}
