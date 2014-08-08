// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.widget.Toast;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia:
//            Utils, BookmarkExporter

public class PreferencesActivity extends PreferenceActivity
{

    public static final String KEY_FULLSCREEN = "com.isaacwaller.wikipedia.FullScreen";
    public static final String KEY_KEEP_SCREEN_ON = "com.isaacwaller.wikipedia.KeepScreenOn";
    public static final String KEY_LOAD_HOME_PAGE = "loadHomePage";

    public PreferencesActivity()
    {
    }

    private void showLanguageDialog(final String key)
    {
        final android.app.AlertDialog.Builder dialog;
        ArrayList arraylist;
        final ArrayList entryValues;
        dialog = new android.app.AlertDialog.Builder(this);
        dialog.setTitle(0x7f0b0015);
        dialog.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final PreferencesActivity this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                dialoginterface.dismiss();
            }

            
            {
                this$0 = PreferencesActivity.this;
                super();
            }
        });
        arraylist = new ArrayList();
        entryValues = new ArrayList();
        Iterator iterator = getLanugages().entrySet().iterator();
_L1:
        boolean flag = iterator.hasNext();
        if (!flag)
        {
            String s = PreferenceManager.getDefaultSharedPreferences(this).getString(key, "en");
            boolean aflag[] = new boolean[arraylist.size()];
            if (entryValues.contains(s))
            {
                aflag[entryValues.indexOf(s)] = true;
            }
            dialog.setMultiChoiceItems((CharSequence[])arraylist.toArray(new CharSequence[0]), aflag, new android.content.DialogInterface.OnMultiChoiceClickListener() {

                final PreferencesActivity this$0;
                private final List val$entryValues;
                private final String val$key;

                public void onClick(DialogInterface dialoginterface, int i, boolean flag1)
                {
                    PreferenceManager.getDefaultSharedPreferences(PreferencesActivity.this).edit().putString(key, ((CharSequence)entryValues.get(i)).toString()).commit();
                    dialoginterface.dismiss();
                }

            
            {
                this$0 = PreferencesActivity.this;
                key = s;
                entryValues = list;
                super();
            }
            });
            runOnUiThread(new Runnable() {

                final PreferencesActivity this$0;
                private final android.app.AlertDialog.Builder val$dialog;

                public void run()
                {
                    dialog.show();
                }

            
            {
                this$0 = PreferencesActivity.this;
                dialog = builder;
                super();
            }
            });
            return;
        }
        try
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            arraylist.add((CharSequence)entry.getKey());
            entryValues.add((CharSequence)entry.getValue());
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
            Toast.makeText(this, 0x7f0b004b, 1).show();
            return;
        }
          goto _L1
    }

    Map getLanugages()
        throws JSONException, MalformedURLException, IOException
    {
        JSONObject jsonobject;
        TreeMap treemap;
        JSONArray jsonarray;
        int i;
        int j;
        jsonobject = (new JSONObject(new JSONTokener(Utils.slurp((new URL("http://en.wikipedia.org/w/api.php?action=sitematrix&format=json")).openStream())))).getJSONObject("sitematrix");
        treemap = new TreeMap();
        jsonarray = jsonobject.names();
        i = jsonarray.length();
        j = 2;
_L2:
        if (j >= i)
        {
            return treemap;
        }
        if (jsonarray.getString(j).matches("[1234567890]*"))
        {
            break; /* Loop/switch isn't completed */
        }
_L3:
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        JSONObject jsonobject1 = jsonobject.getJSONObject(jsonarray.getString(j));
        String s = jsonobject1.getString("code");
        String s1 = jsonobject1.getString("name");
        JSONArray jsonarray1 = jsonobject1.getJSONArray("site");
        int k = 0;
        while (k < jsonarray1.length()) 
        {
            if (jsonarray1.getJSONObject(k).getString("code").equals("wiki"))
            {
                treemap.put(s1, s);
            }
            k++;
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050000);
        Preference preference = findPreference("com.isaacwaller.wikipedia.Language");
        Preference preference1 = findPreference("language2");
        android.preference.Preference.OnPreferenceClickListener onpreferenceclicklistener = new android.preference.Preference.OnPreferenceClickListener() {

            final PreferencesActivity this$0;

            public boolean onPreferenceClick(final Preference preference)
            {
                String s = getString(0x7f0b0015);
                String s1 = getString(0x7f0b003f);
                (new Thread(ProgressDialog.show(PreferencesActivity.this, s, s1, true, false). new Runnable() {

                    final _cls4 this$1;
                    private final ProgressDialog val$dialog;
                    private final Preference val$preference;

                    public void run()
                    {
                        showLanguageDialog(preference.getKey());
                        runOnUiThread(dialog. new Runnable() {

                            final _cls1 this$2;
                            private final ProgressDialog val$dialog;

                            public void run()
                            {
                                dialog.dismiss();
                            }

            
            {
                this$2 = final__pcls1;
                dialog = ProgressDialog.this;
                super();
            }
                        });
                    }

            
            {
                this$1 = final__pcls4;
                preference = preference1;
                dialog = ProgressDialog.this;
                super();
            }
                })).start();
                return true;
            }


            
            {
                this$0 = PreferencesActivity.this;
                super();
            }
        };
        preference.setOnPreferenceClickListener(onpreferenceclicklistener);
        preference1.setOnPreferenceClickListener(onpreferenceclicklistener);
        findPreference("com.isaacwaller.wikipedia.ExportBookmarks").setOnPreferenceClickListener(new android.preference.Preference.OnPreferenceClickListener() {

            final PreferencesActivity this$0;

            public boolean onPreferenceClick(Preference preference2)
            {
                (new Thread(new Runnable() {

                    final _cls5 this$1;

                    public void run()
                    {
                        boolean flag = false;
                        PreferencesActivity preferencesactivity;
                        int i;
                        String s;
                        try
                        {
                            BookmarkExporter.saveBookmarks(_fld0);
                        }
                        catch (IOException ioexception)
                        {
                            ioexception.printStackTrace();
                            flag = true;
                        }
                        preferencesactivity = _fld0;
                        if (flag)
                        {
                            i = 0x7f0b0032;
                        } else
                        {
                            i = 0x7f0b0033;
                        }
                        s = preferencesactivity.getString(i);
                        runOnUiThread(s. new Runnable() {

                            final _cls1 this$2;
                            private final String val$toastMessage;

                            public void run()
                            {
                                Toast.makeText(_fld0, toastMessage, 1).show();
                            }

            
            {
                this$2 = final__pcls1;
                toastMessage = String.this;
                super();
            }
                        });
                    }


            
            {
                this$1 = _cls5.this;
                super();
            }
                })).start();
                return false;
            }


            
            {
                this$0 = PreferencesActivity.this;
                super();
            }
        });
    }

}
