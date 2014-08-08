// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.FieldPosition;
import java.text.Format;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import org.apache.commons.lang3.Validate;

public class FastDateFormat extends Format
{
    private static class CharacterLiteral
        implements Rule
    {

        private final char mValue;

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            stringbuffer.append(mValue);
        }

        public int estimateLength()
        {
            return 1;
        }

        CharacterLiteral(char c)
        {
            mValue = c;
        }
    }

    private static interface NumberRule
        extends Rule
    {

        public abstract void appendTo(StringBuffer stringbuffer, int i);
    }

    private static class PaddedNumberField
        implements NumberRule
    {

        private final int mField;
        private final int mSize;

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            if (i < 100)
            {
                int l = mSize;
                do
                {
                    if (--l < 2)
                    {
                        stringbuffer.append((char)(48 + i / 10));
                        stringbuffer.append((char)(48 + i % 10));
                        return;
                    }
                    stringbuffer.append('0');
                } while (true);
            }
            int j;
            int k;
            if (i < 1000)
            {
                j = 3;
            } else
            {
                boolean flag;
                if (i > -1)
                {
                    flag = true;
                } else
                {
                    flag = false;
                }
                Validate.isTrue(flag, "Negative values should not be possible", i);
                j = Integer.toString(i).length();
            }
            k = mSize;
            do
            {
                if (--k < j)
                {
                    stringbuffer.append(Integer.toString(i));
                    return;
                }
                stringbuffer.append('0');
            } while (true);
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, calendar.get(mField));
        }

        public int estimateLength()
        {
            return 4;
        }

        PaddedNumberField(int i, int j)
        {
            if (j < 3)
            {
                throw new IllegalArgumentException();
            } else
            {
                mField = i;
                mSize = j;
                return;
            }
        }
    }

    private static class Pair
    {

        private final Object mObj1;
        private final Object mObj2;

        public boolean equals(Object obj)
        {
            if (this != obj) goto _L2; else goto _L1
_L1:
            return true;
_L2:
            Pair pair;
label0:
            {
                if (!(obj instanceof Pair))
                {
                    return false;
                }
                pair = (Pair)obj;
                if (mObj1 != null ? mObj1.equals(pair.mObj1) : pair.mObj1 == null)
                {
                    break label0;
                } else
                {
                    break; /* Loop/switch isn't completed */
                }
            }
            if (mObj2 != null) goto _L4; else goto _L3
_L3:
            if (pair.mObj2 == null) goto _L1; else goto _L5
_L5:
            return false;
_L4:
            if (mObj2.equals(pair.mObj2))
            {
                return true;
            }
            if (true) goto _L5; else goto _L6
_L6:
        }

        public int hashCode()
        {
            int i;
            Object obj;
            int j;
            if (mObj1 == null)
            {
                i = 0;
            } else
            {
                i = mObj1.hashCode();
            }
            obj = mObj2;
            j = 0;
            if (obj != null)
            {
                j = mObj2.hashCode();
            }
            return i + j;
        }

        public String toString()
        {
            return (new StringBuilder("[")).append(mObj1).append(':').append(mObj2).append(']').toString();
        }

        public Pair(Object obj, Object obj1)
        {
            mObj1 = obj;
            mObj2 = obj1;
        }
    }

    private static interface Rule
    {

        public abstract void appendTo(StringBuffer stringbuffer, Calendar calendar);

        public abstract int estimateLength();
    }

    private static class StringLiteral
        implements Rule
    {

        private final String mValue;

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            stringbuffer.append(mValue);
        }

        public int estimateLength()
        {
            return mValue.length();
        }

        StringLiteral(String s)
        {
            mValue = s;
        }
    }

    private static class TextField
        implements Rule
    {

        private final int mField;
        private final String mValues[];

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            stringbuffer.append(mValues[calendar.get(mField)]);
        }

        public int estimateLength()
        {
            int i = 0;
            int j = mValues.length;
            do
            {
                int k;
                do
                {
                    if (--j < 0)
                    {
                        return i;
                    }
                    k = mValues[j].length();
                } while (k <= i);
                i = k;
            } while (true);
        }

        TextField(int i, String as[])
        {
            mField = i;
            mValues = as;
        }
    }

    private static class TimeZoneDisplayKey
    {

        private final Locale mLocale;
        private final int mStyle;
        private final TimeZone mTimeZone;

        public boolean equals(Object obj)
        {
            TimeZoneDisplayKey timezonedisplaykey;
            if (this != obj)
            {
                if (obj instanceof TimeZoneDisplayKey)
                {
                    if (!mTimeZone.equals((timezonedisplaykey = (TimeZoneDisplayKey)obj).mTimeZone) || mStyle != timezonedisplaykey.mStyle || !mLocale.equals(timezonedisplaykey.mLocale))
                    {
                        return false;
                    }
                } else
                {
                    return false;
                }
            }
            return true;
        }

        public int hashCode()
        {
            return 31 * mStyle + mLocale.hashCode();
        }

        TimeZoneDisplayKey(TimeZone timezone, boolean flag, int i, Locale locale)
        {
            mTimeZone = timezone;
            if (flag)
            {
                i |= 0x80000000;
            }
            mStyle = i;
            mLocale = locale;
        }
    }

    private static class TimeZoneNameRule
        implements Rule
    {

        private final String mDaylight;
        private final Locale mLocale;
        private final String mStandard;
        private final int mStyle;
        private final TimeZone mTimeZone;
        private final boolean mTimeZoneForced;

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            if (mTimeZoneForced)
            {
                if (mTimeZone.useDaylightTime() && calendar.get(16) != 0)
                {
                    stringbuffer.append(mDaylight);
                    return;
                } else
                {
                    stringbuffer.append(mStandard);
                    return;
                }
            }
            TimeZone timezone = calendar.getTimeZone();
            if (timezone.useDaylightTime() && calendar.get(16) != 0)
            {
                stringbuffer.append(FastDateFormat.getTimeZoneDisplay(timezone, true, mStyle, mLocale));
                return;
            } else
            {
                stringbuffer.append(FastDateFormat.getTimeZoneDisplay(timezone, false, mStyle, mLocale));
                return;
            }
        }

        public int estimateLength()
        {
            if (mTimeZoneForced)
            {
                return Math.max(mStandard.length(), mDaylight.length());
            }
            return mStyle != 0 ? 40 : 4;
        }

        TimeZoneNameRule(TimeZone timezone, boolean flag, Locale locale, int i)
        {
            mTimeZone = timezone;
            mTimeZoneForced = flag;
            mLocale = locale;
            mStyle = i;
            if (flag)
            {
                mStandard = FastDateFormat.getTimeZoneDisplay(timezone, false, i, locale);
                mDaylight = FastDateFormat.getTimeZoneDisplay(timezone, true, i, locale);
                return;
            } else
            {
                mStandard = null;
                mDaylight = null;
                return;
            }
        }
    }

    private static class TimeZoneNumberRule
        implements Rule
    {

        static final TimeZoneNumberRule INSTANCE_COLON = new TimeZoneNumberRule(true);
        static final TimeZoneNumberRule INSTANCE_NO_COLON = new TimeZoneNumberRule(false);
        final boolean mColon;

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            int i = calendar.get(15) + calendar.get(16);
            int j;
            int k;
            if (i < 0)
            {
                stringbuffer.append('-');
                i = -i;
            } else
            {
                stringbuffer.append('+');
            }
            j = i / 0x36ee80;
            stringbuffer.append((char)(48 + j / 10));
            stringbuffer.append((char)(48 + j % 10));
            if (mColon)
            {
                stringbuffer.append(':');
            }
            k = i / 60000 - j * 60;
            stringbuffer.append((char)(48 + k / 10));
            stringbuffer.append((char)(48 + k % 10));
        }

        public int estimateLength()
        {
            return 5;
        }


        TimeZoneNumberRule(boolean flag)
        {
            mColon = flag;
        }
    }

    private static class TwelveHourField
        implements NumberRule
    {

        private final NumberRule mRule;

        public void appendTo(StringBuffer stringbuffer, int i)
        {
            mRule.appendTo(stringbuffer, i);
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            int i = calendar.get(10);
            if (i == 0)
            {
                i = 1 + calendar.getLeastMaximum(10);
            }
            mRule.appendTo(stringbuffer, i);
        }

        public int estimateLength()
        {
            return mRule.estimateLength();
        }

        TwelveHourField(NumberRule numberrule)
        {
            mRule = numberrule;
        }
    }

    private static class TwentyFourHourField
        implements NumberRule
    {

        private final NumberRule mRule;

        public void appendTo(StringBuffer stringbuffer, int i)
        {
            mRule.appendTo(stringbuffer, i);
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            int i = calendar.get(11);
            if (i == 0)
            {
                i = 1 + calendar.getMaximum(11);
            }
            mRule.appendTo(stringbuffer, i);
        }

        public int estimateLength()
        {
            return mRule.estimateLength();
        }

        TwentyFourHourField(NumberRule numberrule)
        {
            mRule = numberrule;
        }
    }

    private static class TwoDigitMonthField
        implements NumberRule
    {

        static final TwoDigitMonthField INSTANCE = new TwoDigitMonthField();

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            stringbuffer.append((char)(48 + i / 10));
            stringbuffer.append((char)(48 + i % 10));
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, 1 + calendar.get(2));
        }

        public int estimateLength()
        {
            return 2;
        }


        TwoDigitMonthField()
        {
        }
    }

    private static class TwoDigitNumberField
        implements NumberRule
    {

        private final int mField;

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            if (i < 100)
            {
                stringbuffer.append((char)(48 + i / 10));
                stringbuffer.append((char)(48 + i % 10));
                return;
            } else
            {
                stringbuffer.append(Integer.toString(i));
                return;
            }
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, calendar.get(mField));
        }

        public int estimateLength()
        {
            return 2;
        }

        TwoDigitNumberField(int i)
        {
            mField = i;
        }
    }

    private static class TwoDigitYearField
        implements NumberRule
    {

        static final TwoDigitYearField INSTANCE = new TwoDigitYearField();

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            stringbuffer.append((char)(48 + i / 10));
            stringbuffer.append((char)(48 + i % 10));
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, calendar.get(1) % 100);
        }

        public int estimateLength()
        {
            return 2;
        }


        TwoDigitYearField()
        {
        }
    }

    private static class UnpaddedMonthField
        implements NumberRule
    {

        static final UnpaddedMonthField INSTANCE = new UnpaddedMonthField();

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            if (i < 10)
            {
                stringbuffer.append((char)(i + 48));
                return;
            } else
            {
                stringbuffer.append((char)(48 + i / 10));
                stringbuffer.append((char)(48 + i % 10));
                return;
            }
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, 1 + calendar.get(2));
        }

        public int estimateLength()
        {
            return 2;
        }


        UnpaddedMonthField()
        {
        }
    }

    private static class UnpaddedNumberField
        implements NumberRule
    {

        private final int mField;

        public final void appendTo(StringBuffer stringbuffer, int i)
        {
            if (i < 10)
            {
                stringbuffer.append((char)(i + 48));
                return;
            }
            if (i < 100)
            {
                stringbuffer.append((char)(48 + i / 10));
                stringbuffer.append((char)(48 + i % 10));
                return;
            } else
            {
                stringbuffer.append(Integer.toString(i));
                return;
            }
        }

        public void appendTo(StringBuffer stringbuffer, Calendar calendar)
        {
            appendTo(stringbuffer, calendar.get(mField));
        }

        public int estimateLength()
        {
            return 4;
        }

        UnpaddedNumberField(int i)
        {
            mField = i;
        }
    }


    public static final int FULL = 0;
    public static final int LONG = 1;
    public static final int MEDIUM = 2;
    public static final int SHORT = 3;
    private static final Map cDateInstanceCache = new HashMap(7);
    private static final Map cDateTimeInstanceCache = new HashMap(7);
    private static String cDefaultPattern;
    private static final Map cInstanceCache = new HashMap(7);
    private static final Map cTimeInstanceCache = new HashMap(7);
    private static final Map cTimeZoneDisplayCache = new HashMap(7);
    private static final long serialVersionUID = 1L;
    private final Locale mLocale;
    private final boolean mLocaleForced;
    private transient int mMaxLengthEstimate;
    private final String mPattern;
    private transient Rule mRules[];
    private final TimeZone mTimeZone;
    private final boolean mTimeZoneForced;

    protected FastDateFormat(String s, TimeZone timezone, Locale locale)
    {
        boolean flag = true;
        super();
        if (s == null)
        {
            throw new IllegalArgumentException("The pattern must not be null");
        }
        mPattern = s;
        boolean flag1;
        if (timezone != null)
        {
            flag1 = flag;
        } else
        {
            flag1 = false;
        }
        mTimeZoneForced = flag1;
        if (timezone == null)
        {
            timezone = TimeZone.getDefault();
        }
        mTimeZone = timezone;
        if (locale == null)
        {
            flag = false;
        }
        mLocaleForced = flag;
        if (locale == null)
        {
            locale = Locale.getDefault();
        }
        mLocale = locale;
    }

    public static FastDateFormat getDateInstance(int i)
    {
        return getDateInstance(i, null, null);
    }

    public static FastDateFormat getDateInstance(int i, Locale locale)
    {
        return getDateInstance(i, null, locale);
    }

    public static FastDateFormat getDateInstance(int i, TimeZone timezone)
    {
        return getDateInstance(i, timezone, null);
    }

    public static FastDateFormat getDateInstance(int i, TimeZone timezone, Locale locale)
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        Integer integer = Integer.valueOf(i);
        if (timezone == null) goto _L2; else goto _L1
_L1:
        Object obj = new Pair(integer, timezone);
_L4:
        if (locale != null)
        {
            break MISSING_BLOCK_LABEL_33;
        }
        locale = Locale.getDefault();
        Pair pair;
        FastDateFormat fastdateformat;
        pair = new Pair(obj, locale);
        fastdateformat = (FastDateFormat)cDateInstanceCache.get(pair);
        if (fastdateformat != null)
        {
            break MISSING_BLOCK_LABEL_96;
        }
        fastdateformat = getInstance(((SimpleDateFormat)DateFormat.getDateInstance(i, locale)).toPattern(), timezone, locale);
        cDateInstanceCache.put(pair, fastdateformat);
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return fastdateformat;
        ClassCastException classcastexception;
        classcastexception;
        throw new IllegalArgumentException((new StringBuilder("No date pattern for locale: ")).append(locale).toString());
        Exception exception;
        exception;
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        obj = integer;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static FastDateFormat getDateTimeInstance(int i, int j)
    {
        return getDateTimeInstance(i, j, null, null);
    }

    public static FastDateFormat getDateTimeInstance(int i, int j, Locale locale)
    {
        return getDateTimeInstance(i, j, null, locale);
    }

    public static FastDateFormat getDateTimeInstance(int i, int j, TimeZone timezone)
    {
        return getDateTimeInstance(i, j, timezone, null);
    }

    public static FastDateFormat getDateTimeInstance(int i, int j, TimeZone timezone, Locale locale)
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        Pair pair = new Pair(Integer.valueOf(i), Integer.valueOf(j));
        if (timezone == null) goto _L2; else goto _L1
_L1:
        Pair pair1 = new Pair(pair, timezone);
_L4:
        if (locale != null)
        {
            break MISSING_BLOCK_LABEL_44;
        }
        locale = Locale.getDefault();
        Pair pair2;
        FastDateFormat fastdateformat;
        pair2 = new Pair(pair1, locale);
        fastdateformat = (FastDateFormat)cDateTimeInstanceCache.get(pair2);
        if (fastdateformat != null)
        {
            break MISSING_BLOCK_LABEL_108;
        }
        fastdateformat = getInstance(((SimpleDateFormat)DateFormat.getDateTimeInstance(i, j, locale)).toPattern(), timezone, locale);
        cDateTimeInstanceCache.put(pair2, fastdateformat);
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return fastdateformat;
        ClassCastException classcastexception;
        classcastexception;
        throw new IllegalArgumentException((new StringBuilder("No date time pattern for locale: ")).append(locale).toString());
        Exception exception;
        exception;
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        pair1 = pair;
        if (true) goto _L4; else goto _L3
_L3:
    }

    private static String getDefaultPattern()
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        String s;
        if (cDefaultPattern == null)
        {
            cDefaultPattern = (new SimpleDateFormat()).toPattern();
        }
        s = cDefaultPattern;
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return s;
        Exception exception;
        exception;
        throw exception;
    }

    public static FastDateFormat getInstance()
    {
        return getInstance(getDefaultPattern(), null, null);
    }

    public static FastDateFormat getInstance(String s)
    {
        return getInstance(s, null, null);
    }

    public static FastDateFormat getInstance(String s, Locale locale)
    {
        return getInstance(s, null, locale);
    }

    public static FastDateFormat getInstance(String s, TimeZone timezone)
    {
        return getInstance(s, timezone, null);
    }

    public static FastDateFormat getInstance(String s, TimeZone timezone, Locale locale)
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        FastDateFormat fastdateformat;
        FastDateFormat fastdateformat1;
        fastdateformat = new FastDateFormat(s, timezone, locale);
        fastdateformat1 = (FastDateFormat)cInstanceCache.get(fastdateformat);
        if (fastdateformat1 != null)
        {
            break MISSING_BLOCK_LABEL_54;
        }
        fastdateformat1 = fastdateformat;
        fastdateformat1.init();
        cInstanceCache.put(fastdateformat1, fastdateformat1);
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return fastdateformat1;
        Exception exception;
        exception;
        throw exception;
    }

    public static FastDateFormat getTimeInstance(int i)
    {
        return getTimeInstance(i, null, null);
    }

    public static FastDateFormat getTimeInstance(int i, Locale locale)
    {
        return getTimeInstance(i, null, locale);
    }

    public static FastDateFormat getTimeInstance(int i, TimeZone timezone)
    {
        return getTimeInstance(i, timezone, null);
    }

    public static FastDateFormat getTimeInstance(int i, TimeZone timezone, Locale locale)
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        Integer integer = Integer.valueOf(i);
        if (timezone == null) goto _L2; else goto _L1
_L1:
        Object obj = new Pair(integer, timezone);
_L5:
        if (locale == null)
        {
            break MISSING_BLOCK_LABEL_142;
        }
        Pair pair = new Pair(obj, locale);
_L3:
        FastDateFormat fastdateformat = (FastDateFormat)cTimeInstanceCache.get(pair);
        if (fastdateformat != null)
        {
            break MISSING_BLOCK_LABEL_104;
        }
        if (locale != null)
        {
            break MISSING_BLOCK_LABEL_73;
        }
        Locale locale1 = Locale.getDefault();
        locale = locale1;
        fastdateformat = getInstance(((SimpleDateFormat)DateFormat.getTimeInstance(i, locale)).toPattern(), timezone, locale);
        cTimeInstanceCache.put(pair, fastdateformat);
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return fastdateformat;
        ClassCastException classcastexception;
        classcastexception;
        throw new IllegalArgumentException((new StringBuilder("No date pattern for locale: ")).append(locale).toString());
        Exception exception;
        exception;
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        throw exception;
        pair = ((Pair) (obj));
          goto _L3
_L2:
        obj = integer;
        if (true) goto _L5; else goto _L4
_L4:
    }

    static String getTimeZoneDisplay(TimeZone timezone, boolean flag, int i, Locale locale)
    {
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorenter ;
        TimeZoneDisplayKey timezonedisplaykey;
        String s;
        timezonedisplaykey = new TimeZoneDisplayKey(timezone, flag, i, locale);
        s = (String)cTimeZoneDisplayCache.get(timezonedisplaykey);
        if (s != null)
        {
            break MISSING_BLOCK_LABEL_58;
        }
        s = timezone.getDisplayName(flag, i, locale);
        cTimeZoneDisplayCache.put(timezonedisplaykey, s);
        org/apache/commons/lang3/time/FastDateFormat;
        JVM INSTR monitorexit ;
        return s;
        Exception exception;
        exception;
        throw exception;
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        init();
    }

    protected StringBuffer applyRules(Calendar calendar, StringBuffer stringbuffer)
    {
        Rule arule[] = mRules;
        int i = mRules.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return stringbuffer;
            }
            arule[j].appendTo(stringbuffer, calendar);
            j++;
        } while (true);
    }

    public boolean equals(Object obj)
    {
        FastDateFormat fastdateformat;
        if (obj instanceof FastDateFormat)
        {
            if ((mPattern == (fastdateformat = (FastDateFormat)obj).mPattern || mPattern.equals(fastdateformat.mPattern)) && (mTimeZone == fastdateformat.mTimeZone || mTimeZone.equals(fastdateformat.mTimeZone)) && (mLocale == fastdateformat.mLocale || mLocale.equals(fastdateformat.mLocale)) && mTimeZoneForced == fastdateformat.mTimeZoneForced && mLocaleForced == fastdateformat.mLocaleForced)
            {
                return true;
            }
        }
        return false;
    }

    public String format(long l)
    {
        return format(new Date(l));
    }

    public String format(Calendar calendar)
    {
        return format(calendar, new StringBuffer(mMaxLengthEstimate)).toString();
    }

    public String format(Date date)
    {
        GregorianCalendar gregoriancalendar = new GregorianCalendar(mTimeZone);
        gregoriancalendar.setTime(date);
        return applyRules(gregoriancalendar, new StringBuffer(mMaxLengthEstimate)).toString();
    }

    public StringBuffer format(long l, StringBuffer stringbuffer)
    {
        return format(new Date(l), stringbuffer);
    }

    public StringBuffer format(Object obj, StringBuffer stringbuffer, FieldPosition fieldposition)
    {
        if (obj instanceof Date)
        {
            return format((Date)obj, stringbuffer);
        }
        if (obj instanceof Calendar)
        {
            return format((Calendar)obj, stringbuffer);
        }
        if (obj instanceof Long)
        {
            return format(((Long)obj).longValue(), stringbuffer);
        }
        StringBuilder stringbuilder = new StringBuilder("Unknown class: ");
        String s;
        if (obj == null)
        {
            s = "<null>";
        } else
        {
            s = obj.getClass().getName();
        }
        throw new IllegalArgumentException(stringbuilder.append(s).toString());
    }

    public StringBuffer format(Calendar calendar, StringBuffer stringbuffer)
    {
        if (mTimeZoneForced)
        {
            calendar.getTimeInMillis();
            calendar = (Calendar)calendar.clone();
            calendar.setTimeZone(mTimeZone);
        }
        return applyRules(calendar, stringbuffer);
    }

    public StringBuffer format(Date date, StringBuffer stringbuffer)
    {
        GregorianCalendar gregoriancalendar = new GregorianCalendar(mTimeZone);
        gregoriancalendar.setTime(date);
        return applyRules(gregoriancalendar, stringbuffer);
    }

    public Locale getLocale()
    {
        return mLocale;
    }

    public int getMaxLengthEstimate()
    {
        return mMaxLengthEstimate;
    }

    public String getPattern()
    {
        return mPattern;
    }

    public TimeZone getTimeZone()
    {
        return mTimeZone;
    }

    public boolean getTimeZoneOverridesCalendar()
    {
        return mTimeZoneForced;
    }

    public int hashCode()
    {
        int i = 1;
        int j = 0 + mPattern.hashCode() + mTimeZone.hashCode();
        int k;
        int l;
        if (mTimeZoneForced)
        {
            k = i;
        } else
        {
            k = 0;
        }
        l = j + k + mLocale.hashCode();
        if (!mLocaleForced)
        {
            i = 0;
        }
        return l + i;
    }

    protected void init()
    {
        List list = parsePattern();
        mRules = (Rule[])list.toArray(new Rule[list.size()]);
        int i = 0;
        int j = mRules.length;
        do
        {
            if (--j < 0)
            {
                mMaxLengthEstimate = i;
                return;
            }
            i += mRules[j].estimateLength();
        } while (true);
    }

    public Object parseObject(String s, ParsePosition parseposition)
    {
        parseposition.setIndex(0);
        parseposition.setErrorIndex(0);
        return null;
    }

    protected List parsePattern()
    {
        ArrayList arraylist;
        String as[];
        String as1[];
        String as2[];
        String as3[];
        String as4[];
        String as5[];
        int i;
        int ai[];
        int j;
        DateFormatSymbols dateformatsymbols = new DateFormatSymbols(mLocale);
        arraylist = new ArrayList();
        as = dateformatsymbols.getEras();
        as1 = dateformatsymbols.getMonths();
        as2 = dateformatsymbols.getShortMonths();
        as3 = dateformatsymbols.getWeekdays();
        as4 = dateformatsymbols.getShortWeekdays();
        as5 = dateformatsymbols.getAmPmStrings();
        i = mPattern.length();
        ai = new int[1];
        j = 0;
_L26:
        if (j < i) goto _L2; else goto _L1
_L1:
        return arraylist;
_L2:
        String s;
        int k;
        int l;
        ai[0] = j;
        s = parseToken(mPattern, ai);
        k = ai[0];
        l = s.length();
        if (l == 0) goto _L1; else goto _L3
_L3:
        s.charAt(0);
        JVM INSTR lookupswitch 20: default 292
    //                   39: 731
    //                   68: 554
    //                   69: 521
    //                   70: 567
    //                   71: 318
    //                   72: 469
    //                   75: 640
    //                   77: 373
    //                   83: 508
    //                   87: 592
    //                   90: 709
    //                   97: 604
    //                   100: 437
    //                   104: 449
    //                   107: 620
    //                   109: 482
    //                   115: 495
    //                   119: 580
    //                   121: 347
    //                   122: 653;
           goto _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24
_L5:
        break MISSING_BLOCK_LABEL_731;
_L23:
        break; /* Loop/switch isn't completed */
_L4:
        throw new IllegalArgumentException((new StringBuilder("Illegal pattern component: ")).append(s).toString());
_L9:
        Object obj = new TextField(0, as);
_L27:
        arraylist.add(obj);
        j = k + 1;
        if (true) goto _L26; else goto _L25
_L25:
        if (l >= 4)
        {
            obj = selectNumberRule(1, l);
        } else
        {
            obj = TwoDigitYearField.INSTANCE;
        }
          goto _L27
_L12:
        if (l >= 4)
        {
            obj = new TextField(2, as1);
        } else
        if (l == 3)
        {
            obj = new TextField(2, as2);
        } else
        if (l == 2)
        {
            obj = TwoDigitMonthField.INSTANCE;
        } else
        {
            obj = UnpaddedMonthField.INSTANCE;
        }
          goto _L27
_L17:
        obj = selectNumberRule(5, l);
          goto _L27
_L18:
        obj = new TwelveHourField(selectNumberRule(10, l));
          goto _L27
_L10:
        obj = selectNumberRule(11, l);
          goto _L27
_L20:
        obj = selectNumberRule(12, l);
          goto _L27
_L21:
        obj = selectNumberRule(13, l);
          goto _L27
_L13:
        obj = selectNumberRule(14, l);
          goto _L27
_L7:
        String as6[];
        if (l < 4)
        {
            as6 = as4;
        } else
        {
            as6 = as3;
        }
        obj = new TextField(7, as6);
          goto _L27
_L6:
        obj = selectNumberRule(6, l);
          goto _L27
_L8:
        obj = selectNumberRule(8, l);
          goto _L27
_L22:
        obj = selectNumberRule(3, l);
          goto _L27
_L14:
        obj = selectNumberRule(4, l);
          goto _L27
_L16:
        obj = new TextField(9, as5);
          goto _L27
_L19:
        obj = new TwentyFourHourField(selectNumberRule(11, l));
          goto _L27
_L11:
        obj = selectNumberRule(10, l);
          goto _L27
_L24:
        if (l >= 4)
        {
            obj = new TimeZoneNameRule(mTimeZone, mTimeZoneForced, mLocale, 1);
        } else
        {
            obj = new TimeZoneNameRule(mTimeZone, mTimeZoneForced, mLocale, 0);
        }
          goto _L27
_L15:
        if (l == 1)
        {
            obj = TimeZoneNumberRule.INSTANCE_NO_COLON;
        } else
        {
            obj = TimeZoneNumberRule.INSTANCE_COLON;
        }
          goto _L27
        String s1 = s.substring(1);
        if (s1.length() == 1)
        {
            obj = new CharacterLiteral(s1.charAt(0));
        } else
        {
            obj = new StringLiteral(s1);
        }
          goto _L27
    }

    protected String parseToken(String s, int ai[])
    {
_L1:
        ai[0] = i;
        return stringbuilder.toString();
        while (i + 1 < j && s.charAt(i + 1) == c) 
        {
            stringbuilder.append(c);
            i++;
        }
          goto _L1
        boolean flag;
        stringbuilder = new StringBuilder();
        i = ai[0];
        j = s.length();
        char c = s.charAt(i);
        if (c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z')
        {
            stringbuilder.append(c);
            break MISSING_BLOCK_LABEL_62;
        }
        stringbuilder.append('\'');
        flag = false;
_L5:
        if (i >= j) goto _L1; else goto _L2
_L2:
        char c1 = s.charAt(i);
        if (c1 != '\'') goto _L4; else goto _L3
_L3:
        if (i + 1 < j && s.charAt(i + 1) == '\'')
        {
            i++;
            stringbuilder.append(c1);
        } else
        if (flag)
        {
            flag = false;
        } else
        {
            flag = true;
        }
_L6:
        i++;
          goto _L5
_L4:
label0:
        {
            if (flag || (c1 < 'A' || c1 > 'Z') && (c1 < 'a' || c1 > 'z'))
            {
                break label0;
            }
            i--;
        }
          goto _L1
        stringbuilder.append(c1);
          goto _L6
    }

    protected NumberRule selectNumberRule(int i, int j)
    {
        switch (j)
        {
        default:
            return new PaddedNumberField(i, j);

        case 1: // '\001'
            return new UnpaddedNumberField(i);

        case 2: // '\002'
            return new TwoDigitNumberField(i);
        }
    }

    public String toString()
    {
        return (new StringBuilder("FastDateFormat[")).append(mPattern).append("]").toString();
    }

}
