// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.Context;

public class ApplicationManager
{
    public static final class Application extends Enum
    {

        private static final Application ENUM$VALUES[];
        public static final Application MINECRAFT_WIKI;
        public static final Application WIKIDROID;
        String packageName;

        public static Application getApplicationFromPackageName(String s)
        {
            Application aapplication[] = values();
            int i = aapplication.length;
            int j = 0;
            do
            {
                if (j >= i)
                {
                    throw new IllegalArgumentException(s);
                }
                Application application = aapplication[j];
                if (application.packageName.equals(s))
                {
                    return application;
                }
                j++;
            } while (true);
        }

        public static Application valueOf(String s)
        {
            return (Application)Enum.valueOf(com/isaacwaller/wikipedia/ApplicationManager$Application, s);
        }

        public static Application[] values()
        {
            Application aapplication[] = ENUM$VALUES;
            int i = aapplication.length;
            Application aapplication1[] = new Application[i];
            System.arraycopy(aapplication, 0, aapplication1, 0, i);
            return aapplication1;
        }

        static 
        {
            MINECRAFT_WIKI = new Application("MINECRAFT_WIKI", 0, "com.siriusapplications.minecraftwiki");
            WIKIDROID = new Application("WIKIDROID", 1, "com.isaacwaller.wikipedia");
            Application aapplication[] = new Application[2];
            aapplication[0] = MINECRAFT_WIKI;
            aapplication[1] = WIKIDROID;
            ENUM$VALUES = aapplication;
        }

        private Application(String s, int i, String s1)
        {
            super(s, i);
            packageName = s1;
        }
    }


    private static Application MY_APPLICATION = null;

    public ApplicationManager()
    {
    }

    public static Application getApplication(Context context)
    {
        if (MY_APPLICATION != null)
        {
            return MY_APPLICATION;
        } else
        {
            MY_APPLICATION = Application.getApplicationFromPackageName(context.getPackageName());
            return MY_APPLICATION;
        }
    }

}
