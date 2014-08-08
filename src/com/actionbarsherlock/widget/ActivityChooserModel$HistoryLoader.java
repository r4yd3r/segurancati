// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.util.Xml;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package com.actionbarsherlock.widget:
//            ActivityChooserModel

private final class <init>
    implements Runnable
{

    final ActivityChooserModel this$0;

    public void run()
    {
        FileInputStream fileinputstream;
        XmlPullParserException xmlpullparserexception;
        XmlPullParser xmlpullparser;
        int i;
        try
        {
            fileinputstream = ActivityChooserModel.access$0(ActivityChooserModel.this).openFileInput(ActivityChooserModel.access$1(ActivityChooserModel.this));
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            return;
        }
        xmlpullparser = Xml.newPullParser();
        xmlpullparser.setInput(fileinputstream, null);
        i = 0;
          goto _L1
_L14:
        if (!"historical-records".equals(xmlpullparser.getName()))
        {
            throw new XmlPullParserException("Share records file does not start with historical-records tag.");
        }
          goto _L2
        xmlpullparserexception;
        Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error reading historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), xmlpullparserexception);
        if (fileinputstream == null)
        {
            break MISSING_BLOCK_LABEL_104;
        }
        fileinputstream.close();
_L8:
        return;
_L15:
        i = xmlpullparser.next();
        continue; /* Loop/switch isn't completed */
_L2:
        ArrayList arraylist = new ArrayList();
_L10:
        int j = xmlpullparser.next();
        if (j != 1) goto _L4; else goto _L3
_L3:
        Object obj = ActivityChooserModel.access$2(ActivityChooserModel.this);
        obj;
        JVM INSTR monitorenter ;
        LinkedHashSet linkedhashset;
        List list;
        int k;
        linkedhashset = new LinkedHashSet(arraylist);
        list = ActivityChooserModel.access$3(ActivityChooserModel.this);
        k = -1 + list.size();
_L12:
        if (k >= 0) goto _L6; else goto _L5
_L5:
        if (list.size() != linkedhashset.size())
        {
            break MISSING_BLOCK_LABEL_396;
        }
        obj;
        JVM INSTR monitorexit ;
        if (fileinputstream == null) goto _L8; else goto _L7
_L7:
        try
        {
            fileinputstream.close();
            return;
        }
        catch (IOException ioexception5)
        {
            return;
        }
_L4:
        if (j == 3 || j == 4) goto _L10; else goto _L9
_L9:
        if (!"historical-record".equals(xmlpullparser.getName()))
        {
            throw new XmlPullParserException("Share records file not well-formed.");
        }
        break MISSING_BLOCK_LABEL_305;
        IOException ioexception1;
        ioexception1;
        Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error reading historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), ioexception1);
        if (fileinputstream == null) goto _L8; else goto _L11
_L11:
        try
        {
            fileinputstream.close();
            return;
        }
        catch (IOException ioexception2)
        {
            return;
        }
        arraylist.add(new rd(xmlpullparser.getAttributeValue(null, "activity"), Long.parseLong(xmlpullparser.getAttributeValue(null, "time")), Float.parseFloat(xmlpullparser.getAttributeValue(null, "weight"))));
          goto _L10
        Exception exception;
        exception;
        IOException ioexception3;
        Exception exception1;
        IOException ioexception4;
        if (fileinputstream != null)
        {
            try
            {
                fileinputstream.close();
            }
            catch (IOException ioexception) { }
        }
        throw exception;
_L6:
        linkedhashset.add((rd)list.get(k));
        k--;
          goto _L12
        list.clear();
        list.addAll(linkedhashset);
        ActivityChooserModel.access$4(ActivityChooserModel.this, true);
        ActivityChooserModel.access$5(ActivityChooserModel.this).post(new Runnable() {

            final ActivityChooserModel.HistoryLoader this$1;

            public void run()
            {
                ActivityChooserModel.access$6(this$0);
                ActivityChooserModel.access$7(this$0);
            }

            
            {
                this$1 = ActivityChooserModel.HistoryLoader.this;
                super();
            }
        });
        obj;
        JVM INSTR monitorexit ;
        if (fileinputstream == null) goto _L8; else goto _L13
_L13:
        try
        {
            fileinputstream.close();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception4)
        {
            return;
        }
        exception1;
        obj;
        JVM INSTR monitorexit ;
        throw exception1;
        ioexception3;
        return;
_L1:
        if (i != 1 && i != 2) goto _L15; else goto _L14
    }


    private _cls1.this._cls1()
    {
        this$0 = ActivityChooserModel.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
