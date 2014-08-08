// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.File;
import java.io.PrintStream;
import java.util.regex.Pattern;

// Referenced classes of package org.apache.commons.lang3:
//            ArrayUtils

public class SystemUtils
{

    public static final String AWT_TOOLKIT;
    public static final String FILE_ENCODING;
    public static final String FILE_SEPARATOR;
    public static final boolean IS_JAVA_1_1 = false;
    public static final boolean IS_JAVA_1_2 = false;
    public static final boolean IS_JAVA_1_3 = false;
    public static final boolean IS_JAVA_1_4 = false;
    public static final boolean IS_JAVA_1_5 = false;
    public static final boolean IS_JAVA_1_6 = false;
    public static final boolean IS_JAVA_1_7 = false;
    public static final boolean IS_OS_AIX = false;
    public static final boolean IS_OS_HP_UX = false;
    public static final boolean IS_OS_IRIX = false;
    public static final boolean IS_OS_LINUX = false;
    public static final boolean IS_OS_MAC = false;
    public static final boolean IS_OS_MAC_OSX = false;
    public static final boolean IS_OS_OS2 = false;
    public static final boolean IS_OS_SOLARIS = false;
    public static final boolean IS_OS_SUN_OS = false;
    public static final boolean IS_OS_UNIX = false;
    public static final boolean IS_OS_WINDOWS = false;
    public static final boolean IS_OS_WINDOWS_2000 = false;
    public static final boolean IS_OS_WINDOWS_7 = false;
    public static final boolean IS_OS_WINDOWS_95 = false;
    public static final boolean IS_OS_WINDOWS_98 = false;
    public static final boolean IS_OS_WINDOWS_ME = false;
    public static final boolean IS_OS_WINDOWS_NT = false;
    public static final boolean IS_OS_WINDOWS_VISTA = false;
    public static final boolean IS_OS_WINDOWS_XP = false;
    public static final String JAVA_AWT_FONTS;
    public static final String JAVA_AWT_GRAPHICSENV;
    public static final String JAVA_AWT_HEADLESS;
    public static final String JAVA_AWT_PRINTERJOB;
    public static final String JAVA_CLASS_PATH;
    public static final String JAVA_CLASS_VERSION;
    public static final String JAVA_COMPILER;
    public static final String JAVA_ENDORSED_DIRS;
    public static final String JAVA_EXT_DIRS;
    public static final String JAVA_HOME;
    private static final String JAVA_HOME_KEY = "java.home";
    public static final String JAVA_IO_TMPDIR;
    private static final String JAVA_IO_TMPDIR_KEY = "java.io.tmpdir";
    public static final String JAVA_LIBRARY_PATH;
    public static final String JAVA_RUNTIME_NAME;
    public static final String JAVA_RUNTIME_VERSION;
    public static final String JAVA_SPECIFICATION_NAME;
    public static final String JAVA_SPECIFICATION_VENDOR;
    public static final String JAVA_SPECIFICATION_VERSION;
    public static final String JAVA_UTIL_PREFS_PREFERENCES_FACTORY;
    public static final String JAVA_VENDOR;
    public static final String JAVA_VENDOR_URL;
    public static final String JAVA_VERSION;
    public static final float JAVA_VERSION_FLOAT = 0F;
    public static final int JAVA_VERSION_INT = 0;
    public static final String JAVA_VERSION_TRIMMED;
    private static final int JAVA_VERSION_TRIM_SIZE = 3;
    public static final String JAVA_VM_INFO;
    public static final String JAVA_VM_NAME;
    public static final String JAVA_VM_SPECIFICATION_NAME;
    public static final String JAVA_VM_SPECIFICATION_VENDOR;
    public static final String JAVA_VM_SPECIFICATION_VERSION;
    public static final String JAVA_VM_VENDOR;
    public static final String JAVA_VM_VERSION;
    public static final String LINE_SEPARATOR;
    public static final String OS_ARCH;
    public static final String OS_NAME;
    private static final String OS_NAME_WINDOWS_PREFIX = "Windows";
    public static final String OS_VERSION;
    public static final String PATH_SEPARATOR;
    public static final String USER_COUNTRY;
    public static final String USER_DIR;
    private static final String USER_DIR_KEY = "user.dir";
    public static final String USER_HOME;
    private static final String USER_HOME_KEY = "user.home";
    public static final String USER_LANGUAGE;
    public static final String USER_NAME;
    public static final String USER_TIMEZONE;

    public SystemUtils()
    {
    }

    public static File getJavaHome()
    {
        return new File(System.getProperty("java.home"));
    }

    public static File getJavaIoTmpDir()
    {
        return new File(System.getProperty("java.io.tmpdir"));
    }

    private static float getJavaVersionAsFloat()
    {
        return toVersionFloat(toJavaVersionIntArray(JAVA_VERSION, 3));
    }

    private static int getJavaVersionAsInt()
    {
        return toVersionInt(toJavaVersionIntArray(JAVA_VERSION, 3));
    }

    private static boolean getJavaVersionMatches(String s)
    {
        return isJavaVersionMatch(JAVA_VERSION_TRIMMED, s);
    }

    private static String getJavaVersionTrimmed()
    {
        if (JAVA_VERSION == null) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < JAVA_VERSION.length()) goto _L3; else goto _L2
_L2:
        return null;
_L3:
        char c = JAVA_VERSION.charAt(i);
        if (c >= '0' && c <= '9')
        {
            return JAVA_VERSION.substring(i);
        }
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    private static boolean getOSMatches(String s, String s1)
    {
        return isOSMatch(OS_NAME, OS_VERSION, s, s1);
    }

    private static boolean getOSMatchesName(String s)
    {
        return isOSNameMatch(OS_NAME, s);
    }

    private static String getSystemProperty(String s)
    {
        String s1;
        try
        {
            s1 = System.getProperty(s);
        }
        catch (SecurityException securityexception)
        {
            System.err.println((new StringBuilder("Caught a SecurityException reading the system property '")).append(s).append("'; the SystemUtils property value will default to null.").toString());
            return null;
        }
        return s1;
    }

    public static File getUserDir()
    {
        return new File(System.getProperty("user.dir"));
    }

    public static File getUserHome()
    {
        return new File(System.getProperty("user.home"));
    }

    public static boolean isJavaAwtHeadless()
    {
        if (JAVA_AWT_HEADLESS != null)
        {
            return JAVA_AWT_HEADLESS.equals(Boolean.TRUE.toString());
        } else
        {
            return false;
        }
    }

    public static boolean isJavaVersionAtLeast(float f)
    {
        return JAVA_VERSION_FLOAT >= f;
    }

    public static boolean isJavaVersionAtLeast(int i)
    {
        return JAVA_VERSION_INT >= i;
    }

    static boolean isJavaVersionMatch(String s, String s1)
    {
        if (s == null)
        {
            return false;
        } else
        {
            return s.startsWith(s1);
        }
    }

    static boolean isOSMatch(String s, String s1, String s2, String s3)
    {
        while (s == null || s1 == null || !s.startsWith(s2) || !s1.startsWith(s3)) 
        {
            return false;
        }
        return true;
    }

    static boolean isOSNameMatch(String s, String s1)
    {
        if (s == null)
        {
            return false;
        } else
        {
            return s.startsWith(s1);
        }
    }

    static float toJavaVersionFloat(String s)
    {
        return toVersionFloat(toJavaVersionIntArray(s, 3));
    }

    static int toJavaVersionInt(String s)
    {
        return toVersionInt(toJavaVersionIntArray(s, 3));
    }

    static int[] toJavaVersionIntArray(String s)
    {
        return toJavaVersionIntArray(s, 0x7fffffff);
    }

    private static int[] toJavaVersionIntArray(String s, int i)
    {
        int ai[];
        if (s == null)
        {
            ai = ArrayUtils.EMPTY_INT_ARRAY;
        } else
        {
            String as[] = Pattern.compile("[^\\d]").split(s);
            ai = new int[Math.min(i, as.length)];
            int j = 0;
            int k = 0;
            while (k < as.length && j < i) 
            {
                String s1 = as[k];
                if (s1.length() > 0)
                {
                    int l = j + 1;
                    ai[j] = Integer.parseInt(s1);
                    j = l;
                }
                k++;
            }
        }
        return ai;
    }

    private static float toVersionFloat(int ai[])
    {
        if (ai == null || ai.length == 0)
        {
            return 0.0F;
        }
        if (ai.length == 1)
        {
            return (float)ai[0];
        }
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(ai[0]);
        stringbuilder.append('.');
        int i = 1;
        do
        {
            if (i >= ai.length)
            {
                float f;
                try
                {
                    f = Float.parseFloat(stringbuilder.toString());
                }
                catch (Exception exception)
                {
                    return 0.0F;
                }
                return f;
            }
            stringbuilder.append(ai[i]);
            i++;
        } while (true);
    }

    private static int toVersionInt(int ai[])
    {
        int j;
        if (ai == null)
        {
            j = 0;
        } else
        {
            int i = ai.length;
            j = 0;
            if (i >= 1)
            {
                j = 100 * ai[0];
            }
            if (i >= 2)
            {
                j += 10 * ai[1];
            }
            if (i >= 3)
            {
                return j + ai[2];
            }
        }
        return j;
    }

    static 
    {
        boolean flag1;
        AWT_TOOLKIT = getSystemProperty("awt.toolkit");
        FILE_ENCODING = getSystemProperty("file.encoding");
        FILE_SEPARATOR = getSystemProperty("file.separator");
        JAVA_AWT_FONTS = getSystemProperty("java.awt.fonts");
        JAVA_AWT_GRAPHICSENV = getSystemProperty("java.awt.graphicsenv");
        JAVA_AWT_HEADLESS = getSystemProperty("java.awt.headless");
        JAVA_AWT_PRINTERJOB = getSystemProperty("java.awt.printerjob");
        JAVA_CLASS_PATH = getSystemProperty("java.class.path");
        JAVA_CLASS_VERSION = getSystemProperty("java.class.version");
        JAVA_COMPILER = getSystemProperty("java.compiler");
        JAVA_ENDORSED_DIRS = getSystemProperty("java.endorsed.dirs");
        JAVA_EXT_DIRS = getSystemProperty("java.ext.dirs");
        JAVA_HOME = getSystemProperty("java.home");
        JAVA_IO_TMPDIR = getSystemProperty("java.io.tmpdir");
        JAVA_LIBRARY_PATH = getSystemProperty("java.library.path");
        JAVA_RUNTIME_NAME = getSystemProperty("java.runtime.name");
        JAVA_RUNTIME_VERSION = getSystemProperty("java.runtime.version");
        JAVA_SPECIFICATION_NAME = getSystemProperty("java.specification.name");
        JAVA_SPECIFICATION_VENDOR = getSystemProperty("java.specification.vendor");
        JAVA_SPECIFICATION_VERSION = getSystemProperty("java.specification.version");
        JAVA_UTIL_PREFS_PREFERENCES_FACTORY = getSystemProperty("java.util.prefs.PreferencesFactory");
        JAVA_VENDOR = getSystemProperty("java.vendor");
        JAVA_VENDOR_URL = getSystemProperty("java.vendor.url");
        JAVA_VERSION = getSystemProperty("java.version");
        JAVA_VM_INFO = getSystemProperty("java.vm.info");
        JAVA_VM_NAME = getSystemProperty("java.vm.name");
        JAVA_VM_SPECIFICATION_NAME = getSystemProperty("java.vm.specification.name");
        JAVA_VM_SPECIFICATION_VENDOR = getSystemProperty("java.vm.specification.vendor");
        JAVA_VM_SPECIFICATION_VERSION = getSystemProperty("java.vm.specification.version");
        JAVA_VM_VENDOR = getSystemProperty("java.vm.vendor");
        JAVA_VM_VERSION = getSystemProperty("java.vm.version");
        LINE_SEPARATOR = getSystemProperty("line.separator");
        OS_ARCH = getSystemProperty("os.arch");
        OS_NAME = getSystemProperty("os.name");
        OS_VERSION = getSystemProperty("os.version");
        PATH_SEPARATOR = getSystemProperty("path.separator");
        String s;
        boolean flag;
        boolean flag2;
        if (getSystemProperty("user.country") == null)
        {
            s = getSystemProperty("user.region");
        } else
        {
            s = getSystemProperty("user.country");
        }
        USER_COUNTRY = s;
        USER_DIR = getSystemProperty("user.dir");
        USER_HOME = getSystemProperty("user.home");
        USER_LANGUAGE = getSystemProperty("user.language");
        USER_NAME = getSystemProperty("user.name");
        USER_TIMEZONE = getSystemProperty("user.timezone");
        JAVA_VERSION_TRIMMED = getJavaVersionTrimmed();
        JAVA_VERSION_FLOAT = getJavaVersionAsFloat();
        JAVA_VERSION_INT = getJavaVersionAsInt();
        IS_JAVA_1_1 = getJavaVersionMatches("1.1");
        IS_JAVA_1_2 = getJavaVersionMatches("1.2");
        IS_JAVA_1_3 = getJavaVersionMatches("1.3");
        IS_JAVA_1_4 = getJavaVersionMatches("1.4");
        IS_JAVA_1_5 = getJavaVersionMatches("1.5");
        IS_JAVA_1_6 = getJavaVersionMatches("1.6");
        IS_JAVA_1_7 = getJavaVersionMatches("1.7");
        IS_OS_AIX = getOSMatchesName("AIX");
        IS_OS_HP_UX = getOSMatchesName("HP-UX");
        IS_OS_IRIX = getOSMatchesName("Irix");
        if (!getOSMatchesName("Linux") && !getOSMatchesName("LINUX"))
        {
            flag = false;
        } else
        {
            flag = true;
        }
        IS_OS_LINUX = flag;
        IS_OS_MAC = getOSMatchesName("Mac");
        IS_OS_MAC_OSX = getOSMatchesName("Mac OS X");
        IS_OS_OS2 = getOSMatchesName("OS/2");
        IS_OS_SOLARIS = getOSMatchesName("Solaris");
        IS_OS_SUN_OS = getOSMatchesName("SunOS");
        if (IS_OS_AIX || IS_OS_HP_UX || IS_OS_IRIX || IS_OS_LINUX || IS_OS_MAC_OSX || IS_OS_SOLARIS) goto _L2; else goto _L1
_L1:
        flag2 = IS_OS_SUN_OS;
        flag1 = false;
        if (flag2) goto _L2; else goto _L3
_L3:
        IS_OS_UNIX = flag1;
        IS_OS_WINDOWS = getOSMatchesName("Windows");
        IS_OS_WINDOWS_2000 = getOSMatches("Windows", "5.0");
        IS_OS_WINDOWS_95 = getOSMatches("Windows 9", "4.0");
        IS_OS_WINDOWS_98 = getOSMatches("Windows 9", "4.1");
        IS_OS_WINDOWS_ME = getOSMatches("Windows", "4.9");
        IS_OS_WINDOWS_NT = getOSMatchesName("Windows NT");
        IS_OS_WINDOWS_XP = getOSMatches("Windows", "5.1");
        IS_OS_WINDOWS_VISTA = getOSMatches("Windows", "6.0");
        IS_OS_WINDOWS_7 = getOSMatches("Windows", "6.1");
        return;
_L2:
        flag1 = true;
        if (true) goto _L3; else goto _L4
_L4:
    }
}
