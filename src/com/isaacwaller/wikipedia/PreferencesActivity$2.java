// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.util.List;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PreferencesActivity

class val.entryValues
    implements android.content.iChoiceClickListener
{

    final PreferencesActivity this$0;
    private final List val$entryValues;
    private final String val$key;

    public void onClick(DialogInterface dialoginterface, int i, boolean flag)
    {
        PreferenceManager.getDefaultSharedPreferences(PreferencesActivity.this).edit().putString(val$key, ((CharSequence)val$entryValues.get(i)).toString()).commit();
        dialoginterface.dismiss();
    }

    ckListener()
    {
        this$0 = final_preferencesactivity;
        val$key = s;
        val$entryValues = List.this;
        super();
    }
}
