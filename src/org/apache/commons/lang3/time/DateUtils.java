// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.TimeZone;

public class DateUtils
{
    static class DateIterator
        implements Iterator
    {

        private final Calendar endFinal;
        private final Calendar spot;

        public boolean hasNext()
        {
            return spot.before(endFinal);
        }

        public volatile Object next()
        {
            return next();
        }

        public Calendar next()
        {
            if (spot.equals(endFinal))
            {
                throw new NoSuchElementException();
            } else
            {
                spot.add(5, 1);
                return (Calendar)spot.clone();
            }
        }

        public void remove()
        {
            throw new UnsupportedOperationException();
        }

        DateIterator(Calendar calendar, Calendar calendar1)
        {
            endFinal = calendar1;
            spot = calendar;
            spot.add(5, -1);
        }
    }


    public static final long MILLIS_PER_DAY = 0x5265c00L;
    public static final long MILLIS_PER_HOUR = 0x36ee80L;
    public static final long MILLIS_PER_MINUTE = 60000L;
    public static final long MILLIS_PER_SECOND = 1000L;
    public static final int MODIFY_CEILING = 2;
    public static final int MODIFY_ROUND = 1;
    public static final int MODIFY_TRUNCATE = 0;
    public static final int RANGE_MONTH_MONDAY = 6;
    public static final int RANGE_MONTH_SUNDAY = 5;
    public static final int RANGE_WEEK_CENTER = 4;
    public static final int RANGE_WEEK_MONDAY = 2;
    public static final int RANGE_WEEK_RELATIVE = 3;
    public static final int RANGE_WEEK_SUNDAY = 1;
    public static final int SEMI_MONTH = 1001;
    public static final TimeZone UTC_TIME_ZONE = TimeZone.getTimeZone("GMT");
    private static final int fields[][];

    public DateUtils()
    {
    }

    private static Date add(Date date, int i, int j)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(i, j);
            return calendar.getTime();
        }
    }

    public static Date addDays(Date date, int i)
    {
        return add(date, 5, i);
    }

    public static Date addHours(Date date, int i)
    {
        return add(date, 11, i);
    }

    public static Date addMilliseconds(Date date, int i)
    {
        return add(date, 14, i);
    }

    public static Date addMinutes(Date date, int i)
    {
        return add(date, 12, i);
    }

    public static Date addMonths(Date date, int i)
    {
        return add(date, 2, i);
    }

    public static Date addSeconds(Date date, int i)
    {
        return add(date, 13, i);
    }

    public static Date addWeeks(Date date, int i)
    {
        return add(date, 3, i);
    }

    public static Date addYears(Date date, int i)
    {
        return add(date, 1, i);
    }

    public static Calendar ceiling(Calendar calendar, int i)
    {
        if (calendar == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar1 = (Calendar)calendar.clone();
            modify(calendar1, i, 2);
            return calendar1;
        }
    }

    public static Date ceiling(Object obj, int i)
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (obj instanceof Date)
        {
            return ceiling((Date)obj, i);
        }
        if (obj instanceof Calendar)
        {
            return ceiling((Calendar)obj, i).getTime();
        } else
        {
            throw new ClassCastException((new StringBuilder("Could not find ceiling of for type: ")).append(obj.getClass()).toString());
        }
    }

    public static Date ceiling(Date date, int i)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            modify(calendar, i, 2);
            return calendar.getTime();
        }
    }

    private static long getFragment(Calendar calendar, int i, int j)
    {
        long l;
        long l1;
        if (calendar == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        l = getMillisPerUnit(j);
        l1 = 0L;
        i;
        JVM INSTR tableswitch 1 2: default 44
    //                   1 145
    //                   2 166;
           goto _L1 _L2 _L3
_L1:
        break; /* Loop/switch isn't completed */
_L3:
        break MISSING_BLOCK_LABEL_166;
_L4:
        switch (i)
        {
        case 3: // '\003'
        case 4: // '\004'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
        default:
            throw new IllegalArgumentException((new StringBuilder("The fragment ")).append(i).append(" is not supported").toString());

        case 1: // '\001'
        case 2: // '\002'
        case 5: // '\005'
        case 6: // '\006'
            l1 += (0x36ee80L * (long)calendar.get(11)) / l;
            // fall through

        case 11: // '\013'
            l1 += (60000L * (long)calendar.get(12)) / l;
            // fall through

        case 12: // '\f'
            l1 += (1000L * (long)calendar.get(13)) / l;
            // fall through

        case 13: // '\r'
            l1 += (long)(1 * calendar.get(14)) / l;
            // fall through

        case 14: // '\016'
            return l1;
        }
_L2:
        l1 += (0x5265c00L * (long)calendar.get(6)) / l;
          goto _L4
        l1 += (0x5265c00L * (long)calendar.get(5)) / l;
          goto _L4
    }

    private static long getFragment(Date date, int i, int j)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return getFragment(calendar, i, j);
        }
    }

    public static long getFragmentInDays(Calendar calendar, int i)
    {
        return getFragment(calendar, i, 6);
    }

    public static long getFragmentInDays(Date date, int i)
    {
        return getFragment(date, i, 6);
    }

    public static long getFragmentInHours(Calendar calendar, int i)
    {
        return getFragment(calendar, i, 11);
    }

    public static long getFragmentInHours(Date date, int i)
    {
        return getFragment(date, i, 11);
    }

    public static long getFragmentInMilliseconds(Calendar calendar, int i)
    {
        return getFragment(calendar, i, 14);
    }

    public static long getFragmentInMilliseconds(Date date, int i)
    {
        return getFragment(date, i, 14);
    }

    public static long getFragmentInMinutes(Calendar calendar, int i)
    {
        return getFragment(calendar, i, 12);
    }

    public static long getFragmentInMinutes(Date date, int i)
    {
        return getFragment(date, i, 12);
    }

    public static long getFragmentInSeconds(Calendar calendar, int i)
    {
        return getFragment(calendar, i, 13);
    }

    public static long getFragmentInSeconds(Date date, int i)
    {
        return getFragment(date, i, 13);
    }

    private static long getMillisPerUnit(int i)
    {
        switch (i)
        {
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
        default:
            throw new IllegalArgumentException((new StringBuilder("The unit ")).append(i).append(" cannot be represented is milleseconds").toString());

        case 5: // '\005'
        case 6: // '\006'
            return 0x5265c00L;

        case 11: // '\013'
            return 0x36ee80L;

        case 12: // '\f'
            return 60000L;

        case 13: // '\r'
            return 1000L;

        case 14: // '\016'
            return 1L;
        }
    }

    public static boolean isSameDay(Calendar calendar, Calendar calendar1)
    {
        if (calendar == null || calendar1 == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        return calendar.get(0) == calendar1.get(0) && calendar.get(1) == calendar1.get(1) && calendar.get(6) == calendar1.get(6);
    }

    public static boolean isSameDay(Date date, Date date1)
    {
        if (date == null || date1 == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            Calendar calendar1 = Calendar.getInstance();
            calendar1.setTime(date1);
            return isSameDay(calendar, calendar1);
        }
    }

    public static boolean isSameInstant(Calendar calendar, Calendar calendar1)
    {
        if (calendar == null || calendar1 == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        return calendar.getTime().getTime() == calendar1.getTime().getTime();
    }

    public static boolean isSameInstant(Date date, Date date1)
    {
        if (date == null || date1 == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        return date.getTime() == date1.getTime();
    }

    public static boolean isSameLocalTime(Calendar calendar, Calendar calendar1)
    {
        if (calendar == null || calendar1 == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        return calendar.get(14) == calendar1.get(14) && calendar.get(13) == calendar1.get(13) && calendar.get(12) == calendar1.get(12) && calendar.get(10) == calendar1.get(10) && calendar.get(6) == calendar1.get(6) && calendar.get(1) == calendar1.get(1) && calendar.get(0) == calendar1.get(0) && calendar.getClass() == calendar1.getClass();
    }

    public static Iterator iterator(Object obj, int i)
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (obj instanceof Date)
        {
            return iterator((Date)obj, i);
        }
        if (obj instanceof Calendar)
        {
            return iterator((Calendar)obj, i);
        } else
        {
            throw new ClassCastException((new StringBuilder("Could not iterate based on ")).append(obj).toString());
        }
    }

    public static Iterator iterator(Calendar calendar, int i)
    {
        if (calendar == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        int j = 1;
        int k = 7;
        switch (i)
        {
        default:
            throw new IllegalArgumentException((new StringBuilder("The range style ")).append(i).append(" is not valid.").toString());

        case 5: // '\005'
        case 6: // '\006'
            Calendar calendar1 = truncate(calendar, 2);
            Calendar calendar2 = (Calendar)calendar1.clone();
            calendar2.add(2, 1);
            calendar2.add(5, -1);
            if (i == 6)
            {
                j = 2;
                k = 1;
            }
            do
            {
                if (j < 1)
                {
                    j += 7;
                }
                if (j > 7)
                {
                    j -= 7;
                }
                if (k < 1)
                {
                    k += 7;
                }
                if (k > 7)
                {
                    k -= 7;
                }
                do
                {
                    if (calendar1.get(7) == j)
                    {
                        do
                        {
                            if (calendar2.get(7) == k)
                            {
                                return new DateIterator(calendar1, calendar2);
                            }
                            calendar2.add(5, 1);
                        } while (true);
                    }
                    calendar1.add(5, -1);
                } while (true);
            } while (true);

        case 1: // '\001'
        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
            calendar1 = truncate(calendar, 5);
            calendar2 = truncate(calendar, 5);
            switch (i)
            {
            case 2: // '\002'
                j = 2;
                k = 1;
                break;

            case 3: // '\003'
                j = calendar.get(7);
                k = j - 1;
                break;

            case 4: // '\004'
                j = -3 + calendar.get(7);
                k = 3 + calendar.get(7);
                break;
            }
            continue;
        }
    }

    public static Iterator iterator(Date date, int i)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return iterator(calendar, i);
        }
    }

    private static void modify(Calendar calendar, int i, int j)
    {
        if (calendar.get(1) > 0x10b07600)
        {
            throw new ArithmeticException("Calendar value too large for accurate calculations");
        }
        if (i != 14) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag1;
        int k1;
        Date date = calendar.getTime();
        long l = date.getTime();
        int k = calendar.get(14);
        if (j == 0 || k < 500)
        {
            l -= k;
        }
        boolean flag = false;
        if (i == 13)
        {
            flag = true;
        }
        int i1 = calendar.get(13);
        if (!flag && (j == 0 || i1 < 30))
        {
            l -= 1000L * (long)i1;
        }
        if (i == 12)
        {
            flag = true;
        }
        int j1 = calendar.get(12);
        if (!flag && (j == 0 || j1 < 30))
        {
            l -= 60000L * (long)j1;
        }
        if (date.getTime() != l)
        {
            date.setTime(l);
            calendar.setTime(date);
        }
        flag1 = false;
        k1 = 0;
_L8:
        int l1;
        if (k1 >= fields.length)
        {
            throw new IllegalArgumentException((new StringBuilder("The field ")).append(i).append(" is not supported").toString());
        }
        l1 = 0;
_L9:
        if (l1 < fields[k1].length) goto _L4; else goto _L3
_L3:
        int i2;
        boolean flag2;
        i2 = 0;
        flag2 = false;
        i;
        JVM INSTR lookupswitch 2: default 272
    //                   9: 563
    //                   1001: 500;
           goto _L5 _L6 _L7
_L5:
        break; /* Loop/switch isn't completed */
_L6:
        break MISSING_BLOCK_LABEL_563;
_L10:
        if (!flag2)
        {
            int k2 = calendar.getActualMinimum(fields[k1][0]);
            int l2 = calendar.getActualMaximum(fields[k1][0]);
            i2 = calendar.get(fields[k1][0]) - k2;
            int j2;
            int i3;
            if (i2 > (l2 - k2) / 2)
            {
                flag1 = true;
            } else
            {
                flag1 = false;
            }
        }
        if (i2 != 0)
        {
            calendar.set(fields[k1][0], calendar.get(fields[k1][0]) - i2);
        }
        k1++;
          goto _L8
_L4:
label0:
        {
            if (fields[k1][l1] != i)
            {
                break label0;
            }
            if (j == 2 || j == 1 && flag1)
            {
                if (i == 1001)
                {
                    if (calendar.get(5) == 1)
                    {
                        calendar.add(5, 15);
                        return;
                    } else
                    {
                        calendar.add(5, -15);
                        calendar.add(2, 1);
                        return;
                    }
                }
                if (i == 9)
                {
                    if (calendar.get(11) == 0)
                    {
                        calendar.add(11, 12);
                        return;
                    } else
                    {
                        calendar.add(11, -12);
                        calendar.add(5, 1);
                        return;
                    }
                } else
                {
                    calendar.add(fields[k1][0], 1);
                    return;
                }
            }
        }
          goto _L1
        l1++;
          goto _L9
_L7:
        i3 = fields[k1][0];
        i2 = 0;
        flag2 = false;
        if (i3 == 5)
        {
            i2 = -1 + calendar.get(5);
            if (i2 >= 15)
            {
                i2 -= 15;
            }
            if (i2 > 7)
            {
                flag1 = true;
            } else
            {
                flag1 = false;
            }
            flag2 = true;
        }
          goto _L10
        j2 = fields[k1][0];
        i2 = 0;
        flag2 = false;
        if (j2 == 11)
        {
            i2 = calendar.get(11);
            if (i2 >= 12)
            {
                i2 -= 12;
            }
            if (i2 >= 6)
            {
                flag1 = true;
            } else
            {
                flag1 = false;
            }
            flag2 = true;
        }
          goto _L10
    }

    public static transient Date parseDate(String s, String as[])
        throws ParseException
    {
        return parseDateWithLeniency(s, as, true);
    }

    public static transient Date parseDateStrictly(String s, String as[])
        throws ParseException
    {
        return parseDateWithLeniency(s, as, false);
    }

    private static Date parseDateWithLeniency(String s, String as[], boolean flag)
        throws ParseException
    {
        if (s == null || as == null)
        {
            throw new IllegalArgumentException("Date and Patterns must not be null");
        }
        SimpleDateFormat simpledateformat = new SimpleDateFormat();
        simpledateformat.setLenient(flag);
        ParsePosition parseposition = new ParsePosition(0);
        int i = 0;
        do
        {
            if (i >= as.length)
            {
                throw new ParseException((new StringBuilder("Unable to parse the date: ")).append(s).toString(), -1);
            }
            String s1 = as[i];
            if (as[i].endsWith("ZZ"))
            {
                s1 = s1.substring(0, -1 + s1.length());
            }
            simpledateformat.applyPattern(s1);
            parseposition.setIndex(0);
            String s2 = s;
            if (as[i].endsWith("ZZ"))
            {
                s2 = s.replaceAll("([-+][0-9][0-9]):([0-9][0-9])$", "$1$2");
            }
            Date date = simpledateformat.parse(s2, parseposition);
            if (date != null && parseposition.getIndex() == s2.length())
            {
                return date;
            }
            i++;
        } while (true);
    }

    public static Calendar round(Calendar calendar, int i)
    {
        if (calendar == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar1 = (Calendar)calendar.clone();
            modify(calendar1, i, 1);
            return calendar1;
        }
    }

    public static Date round(Object obj, int i)
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (obj instanceof Date)
        {
            return round((Date)obj, i);
        }
        if (obj instanceof Calendar)
        {
            return round((Calendar)obj, i).getTime();
        } else
        {
            throw new ClassCastException((new StringBuilder("Could not round ")).append(obj).toString());
        }
    }

    public static Date round(Date date, int i)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            modify(calendar, i, 1);
            return calendar.getTime();
        }
    }

    private static Date set(Date date, int i, int j)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setLenient(false);
            calendar.setTime(date);
            calendar.set(i, j);
            return calendar.getTime();
        }
    }

    public static Date setDays(Date date, int i)
    {
        return set(date, 5, i);
    }

    public static Date setHours(Date date, int i)
    {
        return set(date, 11, i);
    }

    public static Date setMilliseconds(Date date, int i)
    {
        return set(date, 14, i);
    }

    public static Date setMinutes(Date date, int i)
    {
        return set(date, 12, i);
    }

    public static Date setMonths(Date date, int i)
    {
        return set(date, 2, i);
    }

    public static Date setSeconds(Date date, int i)
    {
        return set(date, 13, i);
    }

    public static Date setYears(Date date, int i)
    {
        return set(date, 1, i);
    }

    public static Calendar toCalendar(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar;
    }

    public static Calendar truncate(Calendar calendar, int i)
    {
        if (calendar == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar1 = (Calendar)calendar.clone();
            modify(calendar1, i, 0);
            return calendar1;
        }
    }

    public static Date truncate(Object obj, int i)
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (obj instanceof Date)
        {
            return truncate((Date)obj, i);
        }
        if (obj instanceof Calendar)
        {
            return truncate((Calendar)obj, i).getTime();
        } else
        {
            throw new ClassCastException((new StringBuilder("Could not truncate ")).append(obj).toString());
        }
    }

    public static Date truncate(Date date, int i)
    {
        if (date == null)
        {
            throw new IllegalArgumentException("The date must not be null");
        } else
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            modify(calendar, i, 0);
            return calendar.getTime();
        }
    }

    public static int truncatedCompareTo(Calendar calendar, Calendar calendar1, int i)
    {
        return truncate(calendar, i).compareTo(truncate(calendar1, i));
    }

    public static int truncatedCompareTo(Date date, Date date1, int i)
    {
        return truncate(date, i).compareTo(truncate(date1, i));
    }

    public static boolean truncatedEquals(Calendar calendar, Calendar calendar1, int i)
    {
        return truncatedCompareTo(calendar, calendar1, i) == 0;
    }

    public static boolean truncatedEquals(Date date, Date date1, int i)
    {
        return truncatedCompareTo(date, date1, i) == 0;
    }

    static 
    {
        int ai[][] = new int[8][];
        ai[0] = (new int[] {
            14
        });
        ai[1] = (new int[] {
            13
        });
        ai[2] = (new int[] {
            12
        });
        ai[3] = (new int[] {
            11, 10
        });
        ai[4] = (new int[] {
            5, 5, 9
        });
        ai[5] = (new int[] {
            2, 1001
        });
        ai[6] = (new int[] {
            1
        });
        ai[7] = new int[1];
        fields = ai;
    }
}
