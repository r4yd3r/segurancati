// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.math;

import java.math.BigDecimal;
import java.math.BigInteger;
import org.apache.commons.lang3.StringUtils;

public class NumberUtils
{

    public static final Byte BYTE_MINUS_ONE = Byte.valueOf((byte)-1);
    public static final Byte BYTE_ONE = Byte.valueOf((byte)1);
    public static final Byte BYTE_ZERO = Byte.valueOf((byte)0);
    public static final Double DOUBLE_MINUS_ONE = new Double(-1D);
    public static final Double DOUBLE_ONE = new Double(1.0D);
    public static final Double DOUBLE_ZERO = new Double(0.0D);
    public static final Float FLOAT_MINUS_ONE = new Float(-1F);
    public static final Float FLOAT_ONE = new Float(1.0F);
    public static final Float FLOAT_ZERO = new Float(0.0F);
    public static final Integer INTEGER_MINUS_ONE = new Integer(-1);
    public static final Integer INTEGER_ONE = new Integer(1);
    public static final Integer INTEGER_ZERO = new Integer(0);
    public static final Long LONG_MINUS_ONE = new Long(-1L);
    public static final Long LONG_ONE = new Long(1L);
    public static final Long LONG_ZERO = new Long(0L);
    public static final Short SHORT_MINUS_ONE = new Short((short)-1);
    public static final Short SHORT_ONE = new Short((short)1);
    public static final Short SHORT_ZERO = new Short((short)0);

    public NumberUtils()
    {
    }

    public static BigDecimal createBigDecimal(String s)
    {
        if (s == null)
        {
            return null;
        }
        if (StringUtils.isBlank(s))
        {
            throw new NumberFormatException("A blank string is not a valid number");
        } else
        {
            return new BigDecimal(s);
        }
    }

    public static BigInteger createBigInteger(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return new BigInteger(s);
        }
    }

    public static Double createDouble(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return Double.valueOf(s);
        }
    }

    public static Float createFloat(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return Float.valueOf(s);
        }
    }

    public static Integer createInteger(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return Integer.decode(s);
        }
    }

    public static Long createLong(String s)
    {
        if (s == null)
        {
            return null;
        } else
        {
            return Long.valueOf(s);
        }
    }

    public static Number createNumber(String s)
        throws NumberFormatException
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        Object obj = null;
_L10:
        return ((Number) (obj));
_L2:
        int j;
        String s1;
        String s2;
        String s4;
        String s5;
        boolean flag1;
        if (StringUtils.isBlank(s))
        {
            throw new NumberFormatException("A blank string is not a valid number");
        }
        if (s.startsWith("--"))
        {
            return null;
        }
        if (s.startsWith("0x") || s.startsWith("-0x"))
        {
            return createInteger(s);
        }
        char c = s.charAt(-1 + s.length());
        int i = s.indexOf('.');
        j = 1 + (s.indexOf('e') + s.indexOf('E'));
        if (i > -1)
        {
            if (j > -1)
            {
                if (j < i)
                {
                    throw new NumberFormatException((new StringBuilder(String.valueOf(s))).append(" is not a valid number.").toString());
                }
                s2 = s.substring(i + 1, j);
            } else
            {
                s2 = s.substring(i + 1);
            }
            s1 = s.substring(0, i);
        } else
        {
            if (j > -1)
            {
                s1 = s.substring(0, j);
            } else
            {
                s1 = s;
            }
            s2 = null;
        }
        if (Character.isDigit(c) || c == '.') goto _L4; else goto _L3
_L3:
        if (j > -1 && j < -1 + s.length())
        {
            s4 = s.substring(j + 1, -1 + s.length());
        } else
        {
            s4 = null;
        }
        s5 = s.substring(0, -1 + s.length());
        if (isAllZeros(s1) && isAllZeros(s4))
        {
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        c;
        JVM INSTR lookupswitch 6: default 288
    //                   68: 484
    //                   70: 450
    //                   76: 364
    //                   100: 484
    //                   102: 450
    //                   108: 364;
           goto _L5 _L6 _L7 _L8 _L6 _L7 _L8
_L6:
        break; /* Loop/switch isn't completed */
_L5:
        throw new NumberFormatException((new StringBuilder(String.valueOf(s))).append(" is not a valid number.").toString());
_L8:
        if (s2 == null && s4 == null && (s5.charAt(0) == '-' && isDigits(s5.substring(1)) || isDigits(s5)))
        {
            Long long2;
            try
            {
                long2 = createLong(s5);
            }
            catch (NumberFormatException numberformatexception7)
            {
                return createBigInteger(s5);
            }
            return long2;
        } else
        {
            throw new NumberFormatException((new StringBuilder(String.valueOf(s))).append(" is not a valid number.").toString());
        }
_L7:
        float f2;
        obj = createFloat(s5);
        if (((Float) (obj)).isInfinite())
        {
            break; /* Loop/switch isn't completed */
        }
        f2 = ((Float) (obj)).floatValue();
        if (f2 != 0.0F || flag1) goto _L10; else goto _L9
_L9:
        Double double2;
        float f1;
        double2 = createDouble(s5);
        if (double2.isInfinite())
        {
            break MISSING_BLOCK_LABEL_524;
        }
        f1 = double2.floatValue();
        if ((double)f1 != 0.0D || flag1)
        {
            return double2;
        }
        break MISSING_BLOCK_LABEL_524;
        NumberFormatException numberformatexception4;
        numberformatexception4;
        BigDecimal bigdecimal = createBigDecimal(s5);
        return bigdecimal;
_L4:
        String s3;
        if (j > -1 && j < -1 + s.length())
        {
            s3 = s.substring(j + 1, s.length());
        } else
        {
            s3 = null;
        }
        if (s2 == null && s3 == null)
        {
            Integer integer;
            try
            {
                integer = createInteger(s);
            }
            catch (NumberFormatException numberformatexception2)
            {
                Long long1;
                try
                {
                    long1 = createLong(s);
                }
                catch (NumberFormatException numberformatexception3)
                {
                    return createBigInteger(s);
                }
                return long1;
            }
            return integer;
        }
        boolean flag;
        Double double1;
        double d;
        float f;
        if (isAllZeros(s1) && isAllZeros(s3))
        {
            flag = true;
        } else
        {
            flag = false;
        }
        obj = createFloat(s);
        if (((Float) (obj)).isInfinite())
        {
            break; /* Loop/switch isn't completed */
        }
        f = ((Float) (obj)).floatValue();
        if (f != 0.0F || flag) goto _L10; else goto _L11
_L11:
        double1 = createDouble(s);
        if (double1.isInfinite())
        {
            break MISSING_BLOCK_LABEL_701;
        }
        d = double1.doubleValue();
        if (d != 0.0D || flag)
        {
            return double1;
        }
        break MISSING_BLOCK_LABEL_701;
        NumberFormatException numberformatexception1;
        numberformatexception1;
        return createBigDecimal(s);
        NumberFormatException numberformatexception5;
        numberformatexception5;
          goto _L5
        NumberFormatException numberformatexception;
        numberformatexception;
          goto _L11
        NumberFormatException numberformatexception6;
        numberformatexception6;
          goto _L9
    }

    private static boolean isAllZeros(String s)
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        return true;
_L2:
        int i = -1 + s.length();
        do
        {
label0:
            {
                if (i >= 0)
                {
                    break label0;
                }
                if (s.length() <= 0)
                {
                    return false;
                }
            }
            if (true)
            {
                continue;
            }
            if (s.charAt(i) != '0')
            {
                return false;
            }
            i--;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isDigits(String s)
    {
        if (!StringUtils.isEmpty(s)) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = 0;
        do
        {
            if (i >= s.length())
            {
                return true;
            }
            if (!Character.isDigit(s.charAt(i)))
            {
                continue;
            }
            i++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public static boolean isNumber(String s)
    {
        if (!StringUtils.isEmpty(s)) goto _L2; else goto _L1
_L1:
        boolean flag3 = false;
_L4:
        return flag3;
_L2:
        char ac[];
        boolean flag;
        boolean flag1;
        boolean flag2;
        int l;
        ac = s.toCharArray();
        int i = ac.length;
        flag = false;
        flag1 = false;
        flag2 = false;
        flag3 = false;
        int j;
        if (ac[0] == '-')
        {
            j = 1;
        } else
        {
            j = 0;
        }
        if (i > j + 1 && ac[j] == '0' && ac[j + 1] == 'x')
        {
            int i1 = j + 2;
            if (i1 == i)
            {
                return false;
            }
            for (; i1 < ac.length; i1++)
            {
                if ((ac[i1] < '0' || ac[i1] > '9') && (ac[i1] < 'a' || ac[i1] > 'f') && (ac[i1] < 'A' || ac[i1] > 'F'))
                {
                    return false;
                }
            }

            return true;
        }
        int k = i - 1;
        l = j;
        do
        {
            if (l >= k && (l >= k + 1 || !flag2 || flag3))
            {
                if (l >= ac.length)
                {
                    break MISSING_BLOCK_LABEL_466;
                }
                if (ac[l] >= '0' && ac[l] <= '9')
                {
                    return true;
                }
                break;
            }
            if (ac[l] >= '0' && ac[l] <= '9')
            {
                flag3 = true;
                flag2 = false;
            } else
            if (ac[l] == '.')
            {
                if (flag1 || flag)
                {
                    return false;
                }
                flag1 = true;
            } else
            if (ac[l] == 'e' || ac[l] == 'E')
            {
                if (flag)
                {
                    return false;
                }
                if (!flag3)
                {
                    return false;
                }
                flag = true;
                flag2 = true;
            } else
            if (ac[l] == '+' || ac[l] == '-')
            {
                if (!flag2)
                {
                    return false;
                }
                flag2 = false;
                flag3 = false;
            } else
            {
                return false;
            }
            l++;
        } while (true);
        if (ac[l] == 'e' || ac[l] == 'E')
        {
            return false;
        }
        if (ac[l] != '.')
        {
            continue; /* Loop/switch isn't completed */
        }
        if (!flag1 && !flag) goto _L4; else goto _L3
_L3:
        return false;
        if (!flag2 && (ac[l] == 'd' || ac[l] == 'D' || ac[l] == 'f' || ac[l] == 'F')) goto _L4; else goto _L5
_L5:
        if (ac[l] == 'l' || ac[l] == 'L')
        {
            return flag3 && !flag;
        } else
        {
            return false;
        }
        return !flag2 && flag3;
    }

    public static byte max(byte byte0, byte byte1, byte byte2)
    {
        if (byte1 > byte0)
        {
            byte0 = byte1;
        }
        if (byte2 > byte0)
        {
            byte0 = byte2;
        }
        return byte0;
    }

    public static byte max(byte abyte0[])
    {
        if (abyte0 == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (abyte0.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        byte byte0 = abyte0[0];
        int i = 1;
        do
        {
            if (i >= abyte0.length)
            {
                return byte0;
            }
            if (abyte0[i] > byte0)
            {
                byte0 = abyte0[i];
            }
            i++;
        } while (true);
    }

    public static double max(double d, double d1, double d2)
    {
        return Math.max(Math.max(d, d1), d2);
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
            if (Double.isNaN(ad[i]))
            {
                return (0.0D / 0.0D);
            }
            if (ad[i] > d)
            {
                d = ad[i];
            }
            i++;
        } while (true);
    }

    public static float max(float f, float f1, float f2)
    {
        return Math.max(Math.max(f, f1), f2);
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
            if (Float.isNaN(af[i]))
            {
                return (0.0F / 0.0F);
            }
            if (af[i] > f)
            {
                f = af[i];
            }
            i++;
        } while (true);
    }

    public static int max(int i, int j, int k)
    {
        if (j > i)
        {
            i = j;
        }
        if (k > i)
        {
            i = k;
        }
        return i;
    }

    public static int max(int ai[])
    {
        if (ai == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (ai.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        int i = ai[0];
        int j = 1;
        do
        {
            if (j >= ai.length)
            {
                return i;
            }
            if (ai[j] > i)
            {
                i = ai[j];
            }
            j++;
        } while (true);
    }

    public static long max(long l, long l1, long l2)
    {
        if (l1 > l)
        {
            l = l1;
        }
        if (l2 > l)
        {
            l = l2;
        }
        return l;
    }

    public static long max(long al[])
    {
        if (al == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (al.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        long l = al[0];
        int i = 1;
        do
        {
            if (i >= al.length)
            {
                return l;
            }
            if (al[i] > l)
            {
                l = al[i];
            }
            i++;
        } while (true);
    }

    public static short max(short word0, short word1, short word2)
    {
        if (word1 > word0)
        {
            word0 = word1;
        }
        if (word2 > word0)
        {
            word0 = word2;
        }
        return word0;
    }

    public static short max(short aword0[])
    {
        if (aword0 == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (aword0.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        short word0 = aword0[0];
        int i = 1;
        do
        {
            if (i >= aword0.length)
            {
                return word0;
            }
            if (aword0[i] > word0)
            {
                word0 = aword0[i];
            }
            i++;
        } while (true);
    }

    public static byte min(byte byte0, byte byte1, byte byte2)
    {
        if (byte1 < byte0)
        {
            byte0 = byte1;
        }
        if (byte2 < byte0)
        {
            byte0 = byte2;
        }
        return byte0;
    }

    public static byte min(byte abyte0[])
    {
        if (abyte0 == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (abyte0.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        byte byte0 = abyte0[0];
        int i = 1;
        do
        {
            if (i >= abyte0.length)
            {
                return byte0;
            }
            if (abyte0[i] < byte0)
            {
                byte0 = abyte0[i];
            }
            i++;
        } while (true);
    }

    public static double min(double d, double d1, double d2)
    {
        return Math.min(Math.min(d, d1), d2);
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
            if (Double.isNaN(ad[i]))
            {
                return (0.0D / 0.0D);
            }
            if (ad[i] < d)
            {
                d = ad[i];
            }
            i++;
        } while (true);
    }

    public static float min(float f, float f1, float f2)
    {
        return Math.min(Math.min(f, f1), f2);
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
            if (Float.isNaN(af[i]))
            {
                return (0.0F / 0.0F);
            }
            if (af[i] < f)
            {
                f = af[i];
            }
            i++;
        } while (true);
    }

    public static int min(int i, int j, int k)
    {
        if (j < i)
        {
            i = j;
        }
        if (k < i)
        {
            i = k;
        }
        return i;
    }

    public static int min(int ai[])
    {
        if (ai == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (ai.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        int i = ai[0];
        int j = 1;
        do
        {
            if (j >= ai.length)
            {
                return i;
            }
            if (ai[j] < i)
            {
                i = ai[j];
            }
            j++;
        } while (true);
    }

    public static long min(long l, long l1, long l2)
    {
        if (l1 < l)
        {
            l = l1;
        }
        if (l2 < l)
        {
            l = l2;
        }
        return l;
    }

    public static long min(long al[])
    {
        if (al == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (al.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        long l = al[0];
        int i = 1;
        do
        {
            if (i >= al.length)
            {
                return l;
            }
            if (al[i] < l)
            {
                l = al[i];
            }
            i++;
        } while (true);
    }

    public static short min(short word0, short word1, short word2)
    {
        if (word1 < word0)
        {
            word0 = word1;
        }
        if (word2 < word0)
        {
            word0 = word2;
        }
        return word0;
    }

    public static short min(short aword0[])
    {
        if (aword0 == null)
        {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (aword0.length == 0)
        {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        short word0 = aword0[0];
        int i = 1;
        do
        {
            if (i >= aword0.length)
            {
                return word0;
            }
            if (aword0[i] < word0)
            {
                word0 = aword0[i];
            }
            i++;
        } while (true);
    }

    public static byte toByte(String s)
    {
        return toByte(s, (byte)0);
    }

    public static byte toByte(String s, byte byte0)
    {
        if (s == null)
        {
            return byte0;
        }
        byte byte1;
        try
        {
            byte1 = Byte.parseByte(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return byte0;
        }
        return byte1;
    }

    public static double toDouble(String s)
    {
        return toDouble(s, 0.0D);
    }

    public static double toDouble(String s, double d)
    {
        if (s == null)
        {
            return d;
        }
        double d1;
        try
        {
            d1 = Double.parseDouble(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return d;
        }
        return d1;
    }

    public static float toFloat(String s)
    {
        return toFloat(s, 0.0F);
    }

    public static float toFloat(String s, float f)
    {
        if (s == null)
        {
            return f;
        }
        float f1;
        try
        {
            f1 = Float.parseFloat(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return f;
        }
        return f1;
    }

    public static int toInt(String s)
    {
        return toInt(s, 0);
    }

    public static int toInt(String s, int i)
    {
        if (s == null)
        {
            return i;
        }
        int j;
        try
        {
            j = Integer.parseInt(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return i;
        }
        return j;
    }

    public static long toLong(String s)
    {
        return toLong(s, 0L);
    }

    public static long toLong(String s, long l)
    {
        if (s == null)
        {
            return l;
        }
        long l1;
        try
        {
            l1 = Long.parseLong(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return l;
        }
        return l1;
    }

    public static short toShort(String s)
    {
        return toShort(s, (short)0);
    }

    public static short toShort(String s, short word0)
    {
        if (s == null)
        {
            return word0;
        }
        short word1;
        try
        {
            word1 = Short.parseShort(s);
        }
        catch (NumberFormatException numberformatexception)
        {
            return word0;
        }
        return word1;
    }

}
