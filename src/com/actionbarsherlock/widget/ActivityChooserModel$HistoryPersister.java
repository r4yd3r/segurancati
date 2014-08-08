// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.content.ComponentName;
import android.content.Context;
import android.util.Log;
import android.util.Xml;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlSerializer;

// Referenced classes of package com.actionbarsherlock.widget:
//            ActivityChooserModel

private final class <init>
    implements Runnable
{

    final ActivityChooserModel this$0;

    public void run()
    {
        Object obj = ActivityChooserModel.access$2(ActivityChooserModel.this);
        obj;
        JVM INSTR monitorenter ;
        ArrayList arraylist = new ArrayList(ActivityChooserModel.access$3(ActivityChooserModel.this));
        obj;
        JVM INSTR monitorexit ;
        Exception exception;
        FileOutputStream fileoutputstream;
        XmlSerializer xmlserializer;
        int j;
        int i;
        try
        {
            fileoutputstream = ActivityChooserModel.access$0(ActivityChooserModel.this).openFileOutput(ActivityChooserModel.access$1(ActivityChooserModel.this), 0);
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error writing historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), filenotfoundexception);
            return;
        }
        xmlserializer = Xml.newSerializer();
        xmlserializer.setOutput(fileoutputstream, null);
        xmlserializer.startDocument("UTF-8", Boolean.valueOf(true));
        xmlserializer.startTag(null, "historical-records");
        i = arraylist.size();
        j = 0;
_L3:
        if (j < i) goto _L2; else goto _L1
_L1:
        xmlserializer.endTag(null, "historical-records");
        xmlserializer.endDocument();
        if (fileoutputstream == null)
        {
            break MISSING_BLOCK_LABEL_132;
        }
        fileoutputstream.close();
_L4:
        return;
        exception;
_L6:
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        <init> <init>1 = (this._cls0)arraylist.remove(0);
        xmlserializer.startTag(null, "historical-record");
        xmlserializer.attribute(null, "activity", <init>1.activity.flattenToString());
        xmlserializer.attribute(null, "time", String.valueOf(<init>1.time));
        xmlserializer.attribute(null, "weight", String.valueOf(<init>1.weight));
        xmlserializer.endTag(null, "historical-record");
        j++;
          goto _L3
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error writing historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), illegalargumentexception);
        if (fileoutputstream != null)
        {
            try
            {
                fileoutputstream.close();
                return;
            }
            catch (IOException ioexception4)
            {
                return;
            }
        }
          goto _L4
        IllegalStateException illegalstateexception;
        illegalstateexception;
        Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error writing historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), illegalstateexception);
        if (fileoutputstream != null)
        {
            try
            {
                fileoutputstream.close();
                return;
            }
            catch (IOException ioexception3)
            {
                return;
            }
        }
          goto _L4
        IOException ioexception1;
        ioexception1;
        Log.e(ActivityChooserModel.access$8(), (new StringBuilder("Error writing historical recrod file: ")).append(ActivityChooserModel.access$1(ActivityChooserModel.this)).toString(), ioexception1);
        if (fileoutputstream == null) goto _L4; else goto _L5
_L5:
        try
        {
            fileoutputstream.close();
            return;
        }
        catch (IOException ioexception2)
        {
            return;
        }
        Exception exception1;
        exception1;
        if (fileoutputstream != null)
        {
            try
            {
                fileoutputstream.close();
            }
            catch (IOException ioexception) { }
        }
        throw exception1;
        IOException ioexception5;
        ioexception5;
        return;
        exception;
          goto _L6
    }

    private ()
    {
        this$0 = ActivityChooserModel.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
