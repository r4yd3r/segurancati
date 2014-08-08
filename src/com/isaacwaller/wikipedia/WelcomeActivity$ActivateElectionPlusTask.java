// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.widget.Toast;
import java.net.URL;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia:
//            Utils, WelcomeActivity

private class <init> extends AsyncTask
{

    final WelcomeActivity this$0;

    protected volatile transient Object doInBackground(Object aobj[])
    {
        return doInBackground((Object[])aobj);
    }

    protected transient Void doInBackground(Object aobj[])
    {
        final ProgressDialog dialog;
        String s1;
        String s = (String)aobj[0];
        dialog = (ProgressDialog)aobj[1];
        s1 = (new StringBuilder("http://www.siriusapplications.com/wikidroidelectionsurvey/redeem.php?survey_id=")).append(Uri.encode(s)).toString();
        JSONObject jsonobject = new JSONObject(new JSONTokener(Utils.slurp((new URL(s1)).openStream())));
        if (!"error".equals(jsonobject.getString("status"))) goto _L2; else goto _L1
_L1:
        String s5;
        String s4 = getString(0x7f0b005b);
        Object aobj1[] = new Object[1];
        aobj1[0] = jsonobject.getString("reason");
        s5 = String.format(s4, aobj1);
        String s2 = s5;
_L4:
        final String _toastText = s2;
        runOnUiThread(new Runnable() {

            final WelcomeActivity.ActivateElectionPlusTask this$1;
            private final String val$_toastText;
            private final ProgressDialog val$dialog;

            public void run()
            {
                Toast.makeText(this$0, _toastText, 1).show();
                dialog.dismiss();
                WelcomeActivity.access$2(this$0);
            }

            
            {
                this$1 = WelcomeActivity.ActivateElectionPlusTask.this;
                _toastText = s;
                dialog = progressdialog;
                super();
            }
        });
        return null;
_L2:
        boolean flag = "success".equals(jsonobject.getString("status"));
        s2 = null;
        if (!flag)
        {
            continue; /* Loop/switch isn't completed */
        }
        String s3;
        android.content.nPlusTask nplustask = PreferenceManager.getDefaultSharedPreferences(WelcomeActivity.this).edit();
        nplustask._mth0("com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated", true);
        nplustask._mth0();
        s3 = getString(0x7f0b005c);
        s2 = s3;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        exception.printStackTrace();
        s2 = getString(0x7f0b005a);
        if (true) goto _L4; else goto _L3
_L3:
    }


    private _cls1.val.dialog()
    {
        this$0 = WelcomeActivity.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
