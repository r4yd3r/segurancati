// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.exception;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.SystemUtils;

public class ExceptionUtils
{

    private static final String CAUSE_METHOD_NAMES[] = {
        "getCause", "getNextException", "getTargetException", "getException", "getSourceException", "getRootCause", "getCausedByException", "getNested", "getLinkedException", "getNestedException", 
        "getLinkedCause", "getThrowable"
    };
    static final String WRAPPED_MARKER = " [wrapped] ";

    public ExceptionUtils()
    {
    }

    public static Throwable getCause(Throwable throwable)
    {
        return getCause(throwable, CAUSE_METHOD_NAMES);
    }

    public static Throwable getCause(Throwable throwable, String as[])
    {
        if (throwable != null) goto _L2; else goto _L1
_L1:
        Throwable throwable1 = null;
_L4:
        return throwable1;
_L2:
        int i;
        if (as == null)
        {
            as = CAUSE_METHOD_NAMES;
        }
        i = 0;
_L5:
        if (i >= as.length)
        {
            return null;
        }
        String s = as[i];
        if (s == null)
        {
            break; /* Loop/switch isn't completed */
        }
        throwable1 = getCauseUsingMethodName(throwable, s);
        if (throwable1 != null) goto _L4; else goto _L3
_L3:
        i++;
          goto _L5
        if (true) goto _L4; else goto _L6
_L6:
    }

    private static Throwable getCauseUsingMethodName(Throwable throwable, String s)
    {
        Method method1 = throwable.getClass().getMethod(s, null);
        Method method = method1;
_L4:
        if (method == null || !java/lang/Throwable.isAssignableFrom(method.getReturnType()))
        {
            break MISSING_BLOCK_LABEL_48;
        }
        Throwable throwable1 = (Throwable)method.invoke(throwable, ArrayUtils.EMPTY_OBJECT_ARRAY);
        return throwable1;
        InvocationTargetException invocationtargetexception;
        invocationtargetexception;
_L2:
        return null;
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        continue; /* Loop/switch isn't completed */
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        if (true) goto _L2; else goto _L1
_L1:
        SecurityException securityexception;
        securityexception;
        method = null;
        continue; /* Loop/switch isn't completed */
        NoSuchMethodException nosuchmethodexception;
        nosuchmethodexception;
        method = null;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static String[] getDefaultCauseMethodNames()
    {
        return (String[])ArrayUtils.clone(CAUSE_METHOD_NAMES);
    }

    public static String getMessage(Throwable throwable)
    {
        if (throwable == null)
        {
            return "";
        } else
        {
            String s = ClassUtils.getShortClassName(throwable, null);
            String s1 = throwable.getMessage();
            return (new StringBuilder(String.valueOf(s))).append(": ").append(StringUtils.defaultString(s1)).toString();
        }
    }

    public static Throwable getRootCause(Throwable throwable)
    {
        List list = getThrowableList(throwable);
        if (list.size() < 2)
        {
            return null;
        } else
        {
            return (Throwable)list.get(-1 + list.size());
        }
    }

    public static String getRootCauseMessage(Throwable throwable)
    {
        Throwable throwable1 = getRootCause(throwable);
        if (throwable1 == null)
        {
            throwable1 = throwable;
        }
        return getMessage(throwable1);
    }

    public static String[] getRootCauseStackTrace(Throwable throwable)
    {
        if (throwable == null)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        Throwable athrowable[] = getThrowables(throwable);
        int i = athrowable.length;
        ArrayList arraylist = new ArrayList();
        List list = getStackFrameList(athrowable[i - 1]);
        int j = i;
        do
        {
            if (--j < 0)
            {
                return (String[])arraylist.toArray(new String[0]);
            }
            List list1 = list;
            if (j != 0)
            {
                list = getStackFrameList(athrowable[j - 1]);
                removeCommonFrames(list1, list);
            }
            int k;
            if (j == i - 1)
            {
                arraylist.add(athrowable[j].toString());
            } else
            {
                arraylist.add((new StringBuilder(" [wrapped] ")).append(athrowable[j].toString()).toString());
            }
            k = 0;
            while (k < list1.size()) 
            {
                arraylist.add((String)list1.get(k));
                k++;
            }
        } while (true);
    }

    static List getStackFrameList(Throwable throwable)
    {
        StringTokenizer stringtokenizer = new StringTokenizer(getStackTrace(throwable), SystemUtils.LINE_SEPARATOR);
        ArrayList arraylist = new ArrayList();
        boolean flag = false;
        do
        {
            do
            {
                if (!stringtokenizer.hasMoreTokens())
                {
                    return arraylist;
                }
                String s = stringtokenizer.nextToken();
                int i = s.indexOf("at");
                if (i == -1 || s.substring(0, i).trim().length() != 0)
                {
                    break;
                }
                flag = true;
                arraylist.add(s);
            } while (true);
        } while (!flag);
        return arraylist;
    }

    static String[] getStackFrames(String s)
    {
        StringTokenizer stringtokenizer = new StringTokenizer(s, SystemUtils.LINE_SEPARATOR);
        ArrayList arraylist = new ArrayList();
        do
        {
            if (!stringtokenizer.hasMoreTokens())
            {
                return (String[])arraylist.toArray(new String[arraylist.size()]);
            }
            arraylist.add(stringtokenizer.nextToken());
        } while (true);
    }

    public static String[] getStackFrames(Throwable throwable)
    {
        if (throwable == null)
        {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        } else
        {
            return getStackFrames(getStackTrace(throwable));
        }
    }

    public static String getStackTrace(Throwable throwable)
    {
        StringWriter stringwriter = new StringWriter();
        throwable.printStackTrace(new PrintWriter(stringwriter, true));
        return stringwriter.getBuffer().toString();
    }

    public static int getThrowableCount(Throwable throwable)
    {
        return getThrowableList(throwable).size();
    }

    public static List getThrowableList(Throwable throwable)
    {
        ArrayList arraylist = new ArrayList();
        do
        {
            if (throwable == null || arraylist.contains(throwable))
            {
                return arraylist;
            }
            arraylist.add(throwable);
            throwable = getCause(throwable);
        } while (true);
    }

    public static Throwable[] getThrowables(Throwable throwable)
    {
        List list = getThrowableList(throwable);
        return (Throwable[])list.toArray(new Throwable[list.size()]);
    }

    private static int indexOf(Throwable throwable, Class class1, int i, boolean flag)
    {
        if (throwable != null && class1 != null) goto _L2; else goto _L1
_L1:
        int j = -1;
_L6:
        return j;
_L2:
        Throwable athrowable[];
        if (i < 0)
        {
            i = 0;
        }
        athrowable = getThrowables(throwable);
        if (i >= athrowable.length)
        {
            return -1;
        }
        if (!flag) goto _L4; else goto _L3
_L3:
        j = i;
_L7:
        if (j < athrowable.length)
        {
            continue; /* Loop/switch isn't completed */
        }
_L9:
        return -1;
        if (class1.isAssignableFrom(athrowable[j].getClass())) goto _L6; else goto _L5
_L5:
        j++;
          goto _L7
_L4:
        j = i;
_L11:
        if (j >= athrowable.length) goto _L9; else goto _L8
_L8:
        if (class1.equals(athrowable[j].getClass())) goto _L6; else goto _L10
_L10:
        j++;
          goto _L11
    }

    public static int indexOfThrowable(Throwable throwable, Class class1)
    {
        return indexOf(throwable, class1, 0, false);
    }

    public static int indexOfThrowable(Throwable throwable, Class class1, int i)
    {
        return indexOf(throwable, class1, i, false);
    }

    public static int indexOfType(Throwable throwable, Class class1)
    {
        return indexOf(throwable, class1, 0, true);
    }

    public static int indexOfType(Throwable throwable, Class class1, int i)
    {
        return indexOf(throwable, class1, i, true);
    }

    public static void printRootCauseStackTrace(Throwable throwable)
    {
        printRootCauseStackTrace(throwable, System.err);
    }

    public static void printRootCauseStackTrace(Throwable throwable, PrintStream printstream)
    {
        if (throwable == null)
        {
            return;
        }
        if (printstream == null)
        {
            throw new IllegalArgumentException("The PrintStream must not be null");
        }
        String as[] = getRootCauseStackTrace(throwable);
        int i = 0;
        do
        {
            if (i >= as.length)
            {
                printstream.flush();
                return;
            }
            printstream.println(as[i]);
            i++;
        } while (true);
    }

    public static void printRootCauseStackTrace(Throwable throwable, PrintWriter printwriter)
    {
        if (throwable == null)
        {
            return;
        }
        if (printwriter == null)
        {
            throw new IllegalArgumentException("The PrintWriter must not be null");
        }
        String as[] = getRootCauseStackTrace(throwable);
        int i = 0;
        do
        {
            if (i >= as.length)
            {
                printwriter.flush();
                return;
            }
            printwriter.println(as[i]);
            i++;
        } while (true);
    }

    public static void removeCommonFrames(List list, List list1)
    {
        if (list == null || list1 == null)
        {
            throw new IllegalArgumentException("The List must not be null");
        }
        int i = -1 + list.size();
        int j = -1 + list1.size();
        do
        {
            if (i < 0 || j < 0)
            {
                return;
            }
            if (((String)list.get(i)).equals((String)list1.get(j)))
            {
                list.remove(i);
            }
            i--;
            j--;
        } while (true);
    }

}
