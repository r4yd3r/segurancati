// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlSerializer;

class ActivityChooserModel extends DataSetObservable
{
    public static interface ActivityChooserModelClient
    {

        public abstract void setActivityChooserModel(ActivityChooserModel activitychoosermodel);
    }

    public final class ActivityResolveInfo
        implements Comparable
    {

        public final ResolveInfo resolveInfo;
        final ActivityChooserModel this$0;
        public float weight;

        public int compareTo(ActivityResolveInfo activityresolveinfo)
        {
            return Float.floatToIntBits(activityresolveinfo.weight) - Float.floatToIntBits(weight);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((ActivityResolveInfo)obj);
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                {
                    return false;
                }
                if (getClass() != obj.getClass())
                {
                    return false;
                }
                ActivityResolveInfo activityresolveinfo = (ActivityResolveInfo)obj;
                if (Float.floatToIntBits(weight) != Float.floatToIntBits(activityresolveinfo.weight))
                {
                    return false;
                }
            }
            return true;
        }

        public int hashCode()
        {
            return 31 + Float.floatToIntBits(weight);
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append("[");
            stringbuilder.append("resolveInfo:").append(resolveInfo.toString());
            stringbuilder.append("; weight:").append(new BigDecimal(weight));
            stringbuilder.append("]");
            return stringbuilder.toString();
        }

        public ActivityResolveInfo(ResolveInfo resolveinfo)
        {
            this$0 = ActivityChooserModel.this;
            super();
            resolveInfo = resolveinfo;
        }
    }

    public static interface ActivitySorter
    {

        public abstract void sort(Intent intent, List list, List list1);
    }

    private final class DefaultSorter
        implements ActivitySorter
    {

        private static final float WEIGHT_DECAY_COEFFICIENT = 0.95F;
        private final Map mPackageNameToActivityMap;
        final ActivityChooserModel this$0;

        public void sort(Intent intent, List list, List list1)
        {
            Map map;
            int i;
            int j;
            map = mPackageNameToActivityMap;
            map.clear();
            i = list.size();
            j = 0;
_L3:
            if (j < i) goto _L2; else goto _L1
_L1:
            float f;
            int l;
            int k = -1 + list1.size();
            f = 1.0F;
            l = k;
_L4:
            if (l < 0)
            {
                Collections.sort(list);
                return;
            }
            break MISSING_BLOCK_LABEL_104;
_L2:
            ActivityResolveInfo activityresolveinfo = (ActivityResolveInfo)list.get(j);
            activityresolveinfo.weight = 0.0F;
            map.put(activityresolveinfo.resolveInfo.activityInfo.packageName, activityresolveinfo);
            j++;
              goto _L3
            HistoricalRecord historicalrecord = (HistoricalRecord)list1.get(l);
            ActivityResolveInfo activityresolveinfo1 = (ActivityResolveInfo)map.get(historicalrecord.activity.getPackageName());
            if (activityresolveinfo1 != null)
            {
                activityresolveinfo1.weight = activityresolveinfo1.weight + f * historicalrecord.weight;
                f *= 0.95F;
            }
            l--;
              goto _L4
        }

        private DefaultSorter()
        {
            this$0 = ActivityChooserModel.this;
            super();
            mPackageNameToActivityMap = new HashMap();
        }

        DefaultSorter(DefaultSorter defaultsorter)
        {
            this();
        }
    }

    public static final class HistoricalRecord
    {

        public final ComponentName activity;
        public final long time;
        public final float weight;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                {
                    return false;
                }
                if (getClass() != obj.getClass())
                {
                    return false;
                }
                HistoricalRecord historicalrecord = (HistoricalRecord)obj;
                if (activity == null)
                {
                    if (historicalrecord.activity != null)
                    {
                        return false;
                    }
                } else
                if (!activity.equals(historicalrecord.activity))
                {
                    return false;
                }
                if (time != historicalrecord.time)
                {
                    return false;
                }
                if (Float.floatToIntBits(weight) != Float.floatToIntBits(historicalrecord.weight))
                {
                    return false;
                }
            }
            return true;
        }

        public int hashCode()
        {
            int i;
            if (activity == null)
            {
                i = 0;
            } else
            {
                i = activity.hashCode();
            }
            return 31 * (31 * (i + 31) + (int)(time ^ time >>> 32)) + Float.floatToIntBits(weight);
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append("[");
            stringbuilder.append("; activity:").append(activity);
            stringbuilder.append("; time:").append(time);
            stringbuilder.append("; weight:").append(new BigDecimal(weight));
            stringbuilder.append("]");
            return stringbuilder.toString();
        }

        public HistoricalRecord(ComponentName componentname, long l, float f)
        {
            activity = componentname;
            time = l;
            weight = f;
        }

        public HistoricalRecord(String s, long l, float f)
        {
            this(ComponentName.unflattenFromString(s), l, f);
        }
    }

    private final class HistoryLoader
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
                fileinputstream = mContext.openFileInput(mHistoryFileName);
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
            Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error reading historical recrod file: ")).append(mHistoryFileName).toString(), xmlpullparserexception);
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
            Object obj = mInstanceLock;
            obj;
            JVM INSTR monitorenter ;
            LinkedHashSet linkedhashset;
            List list;
            int k;
            linkedhashset = new LinkedHashSet(arraylist);
            list = mHistoricalRecords;
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
            Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error reading historical recrod file: ")).append(mHistoryFileName).toString(), ioexception1);
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
            arraylist.add(new HistoricalRecord(xmlpullparser.getAttributeValue(null, "activity"), Long.parseLong(xmlpullparser.getAttributeValue(null, "time")), Float.parseFloat(xmlpullparser.getAttributeValue(null, "weight"))));
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
            linkedhashset.add((HistoricalRecord)list.get(k));
            k--;
              goto _L12
            list.clear();
            list.addAll(linkedhashset);
            mHistoricalRecordsChanged = true;
            mHandler.post(new Runnable() {

                final HistoryLoader this$1;

                public void run()
                {
                    pruneExcessiveHistoricalRecordsLocked();
                    sortActivities();
                }

            
            {
                this$1 = HistoryLoader.this;
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


        private HistoryLoader()
        {
            this$0 = ActivityChooserModel.this;
            super();
        }

        HistoryLoader(HistoryLoader historyloader)
        {
            this();
        }
    }

    private final class HistoryPersister
        implements Runnable
    {

        final ActivityChooserModel this$0;

        public void run()
        {
            Object obj = mInstanceLock;
            obj;
            JVM INSTR monitorenter ;
            ArrayList arraylist = new ArrayList(mHistoricalRecords);
            obj;
            JVM INSTR monitorexit ;
            Exception exception;
            FileOutputStream fileoutputstream;
            XmlSerializer xmlserializer;
            int j;
            int i;
            try
            {
                fileoutputstream = mContext.openFileOutput(mHistoryFileName, 0);
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error writing historical recrod file: ")).append(mHistoryFileName).toString(), filenotfoundexception);
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
            HistoricalRecord historicalrecord = (HistoricalRecord)arraylist.remove(0);
            xmlserializer.startTag(null, "historical-record");
            xmlserializer.attribute(null, "activity", historicalrecord.activity.flattenToString());
            xmlserializer.attribute(null, "time", String.valueOf(historicalrecord.time));
            xmlserializer.attribute(null, "weight", String.valueOf(historicalrecord.weight));
            xmlserializer.endTag(null, "historical-record");
            j++;
              goto _L3
            IllegalArgumentException illegalargumentexception;
            illegalargumentexception;
            Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error writing historical recrod file: ")).append(mHistoryFileName).toString(), illegalargumentexception);
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
            Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error writing historical recrod file: ")).append(mHistoryFileName).toString(), illegalstateexception);
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
            Log.e(ActivityChooserModel.LOG_TAG, (new StringBuilder("Error writing historical recrod file: ")).append(mHistoryFileName).toString(), ioexception1);
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

        private HistoryPersister()
        {
            this$0 = ActivityChooserModel.this;
            super();
        }

        HistoryPersister(HistoryPersister historypersister)
        {
            this();
        }
    }

    public static interface OnChooseActivityListener
    {

        public abstract boolean onChooseActivity(ActivityChooserModel activitychoosermodel, Intent intent);
    }


    private static final String ATTRIBUTE_ACTIVITY = "activity";
    private static final String ATTRIBUTE_TIME = "time";
    private static final String ATTRIBUTE_WEIGHT = "weight";
    private static final boolean DEBUG = false;
    private static final int DEFAULT_ACTIVITY_INFLATION = 5;
    private static final float DEFAULT_HISTORICAL_RECORD_WEIGHT = 1F;
    public static final String DEFAULT_HISTORY_FILE_NAME = "activity_choser_model_history.xml";
    public static final int DEFAULT_HISTORY_MAX_LENGTH = 50;
    private static final String HISTORY_FILE_EXTENSION = ".xml";
    private static final int INVALID_INDEX = -1;
    private static final String LOG_TAG = com/actionbarsherlock/widget/ActivityChooserModel.getSimpleName();
    private static final Executor SERIAL_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final String TAG_HISTORICAL_RECORD = "historical-record";
    private static final String TAG_HISTORICAL_RECORDS = "historical-records";
    private static final Map sDataModelRegistry = new HashMap();
    private static final Object sRegistryLock = new Object();
    private final List mActivites = new ArrayList();
    private OnChooseActivityListener mActivityChoserModelPolicy;
    private ActivitySorter mActivitySorter;
    private boolean mCanReadHistoricalData;
    private final Context mContext;
    private final Handler mHandler = new Handler();
    private final List mHistoricalRecords = new ArrayList();
    private boolean mHistoricalRecordsChanged;
    private final String mHistoryFileName;
    private int mHistoryMaxSize;
    private final Object mInstanceLock = new Object();
    private Intent mIntent;
    private boolean mReadShareHistoryCalled;

    private ActivityChooserModel(Context context, String s)
    {
        mActivitySorter = new DefaultSorter(null);
        mHistoryMaxSize = 50;
        mCanReadHistoricalData = true;
        mReadShareHistoryCalled = false;
        mHistoricalRecordsChanged = true;
        mContext = context.getApplicationContext();
        if (!TextUtils.isEmpty(s) && !s.endsWith(".xml"))
        {
            mHistoryFileName = (new StringBuilder(String.valueOf(s))).append(".xml").toString();
            return;
        } else
        {
            mHistoryFileName = s;
            return;
        }
    }

    private boolean addHisoricalRecord(HistoricalRecord historicalrecord)
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        boolean flag = mHistoricalRecords.add(historicalrecord);
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_41;
        }
        mHistoricalRecordsChanged = true;
        pruneExcessiveHistoricalRecordsLocked();
        persistHistoricalData();
        sortActivities();
        obj;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static ActivityChooserModel get(Context context, String s)
    {
        Object obj = sRegistryLock;
        obj;
        JVM INSTR monitorenter ;
        ActivityChooserModel activitychoosermodel = (ActivityChooserModel)sDataModelRegistry.get(s);
        if (activitychoosermodel != null)
        {
            break MISSING_BLOCK_LABEL_48;
        }
        activitychoosermodel = new ActivityChooserModel(context, s);
        sDataModelRegistry.put(s, activitychoosermodel);
        activitychoosermodel.readHistoricalData();
        obj;
        JVM INSTR monitorexit ;
        return activitychoosermodel;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void loadActivitiesLocked()
    {
        mActivites.clear();
        if (mIntent != null)
        {
            List list = mContext.getPackageManager().queryIntentActivities(mIntent, 0);
            int i = list.size();
            int j = 0;
            do
            {
                if (j >= i)
                {
                    sortActivities();
                    return;
                }
                ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
                mActivites.add(new ActivityResolveInfo(resolveinfo));
                j++;
            } while (true);
        } else
        {
            notifyChanged();
            return;
        }
    }

    private void persistHistoricalData()
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        if (!mReadShareHistoryCalled)
        {
            throw new IllegalStateException("No preceding call to #readHistoricalData");
        }
        break MISSING_BLOCK_LABEL_29;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (mHistoricalRecordsChanged)
        {
            break MISSING_BLOCK_LABEL_39;
        }
        obj;
        JVM INSTR monitorexit ;
        return;
        mHistoricalRecordsChanged = false;
        mCanReadHistoricalData = true;
        if (!TextUtils.isEmpty(mHistoryFileName))
        {
            SERIAL_EXECUTOR.execute(new HistoryPersister(null));
        }
        obj;
        JVM INSTR monitorexit ;
    }

    private void pruneExcessiveHistoricalRecordsLocked()
    {
        List list = mHistoricalRecords;
        int i = list.size() - mHistoryMaxSize;
        if (i > 0)
        {
            mHistoricalRecordsChanged = true;
            int j = 0;
            while (j < i) 
            {
                HistoricalRecord _tmp = (HistoricalRecord)list.remove(0);
                j++;
            }
        }
    }

    private void readHistoricalData()
    {
label0:
        {
            synchronized (mInstanceLock)
            {
                if (mCanReadHistoricalData && mHistoricalRecordsChanged)
                {
                    break label0;
                }
            }
            return;
        }
        mCanReadHistoricalData = false;
        mReadShareHistoryCalled = true;
        if (!TextUtils.isEmpty(mHistoryFileName))
        {
            SERIAL_EXECUTOR.execute(new HistoryLoader(null));
        }
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void sortActivities()
    {
        synchronized (mInstanceLock)
        {
            if (mActivitySorter != null && !mActivites.isEmpty())
            {
                mActivitySorter.sort(mIntent, mActivites, Collections.unmodifiableList(mHistoricalRecords));
                notifyChanged();
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Intent chooseActivity(int i)
    {
        ActivityResolveInfo activityresolveinfo = (ActivityResolveInfo)mActivites.get(i);
        ComponentName componentname = new ComponentName(activityresolveinfo.resolveInfo.activityInfo.packageName, activityresolveinfo.resolveInfo.activityInfo.name);
        Intent intent = new Intent(mIntent);
        intent.setComponent(componentname);
        if (mActivityChoserModelPolicy != null)
        {
            Intent intent1 = new Intent(intent);
            if (mActivityChoserModelPolicy.onChooseActivity(this, intent1))
            {
                return null;
            }
        }
        addHisoricalRecord(new HistoricalRecord(componentname, System.currentTimeMillis(), 1.0F));
        return intent;
    }

    public ResolveInfo getActivity(int i)
    {
        ResolveInfo resolveinfo;
        synchronized (mInstanceLock)
        {
            resolveinfo = ((ActivityResolveInfo)mActivites.get(i)).resolveInfo;
        }
        return resolveinfo;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getActivityCount()
    {
        int i;
        synchronized (mInstanceLock)
        {
            i = mActivites.size();
        }
        return i;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getActivityIndex(ResolveInfo resolveinfo)
    {
        List list;
        int i;
        int j;
        list = mActivites;
        i = list.size();
        j = 0;
_L6:
        if (j < i) goto _L2; else goto _L1
_L1:
        j = -1;
_L4:
        return j;
_L2:
        if (((ActivityResolveInfo)list.get(j)).resolveInfo == resolveinfo) goto _L4; else goto _L3
_L3:
        j++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public ResolveInfo getDefaultActivity()
    {
        Object obj = mInstanceLock;
        obj;
        JVM INSTR monitorenter ;
        ResolveInfo resolveinfo;
        if (mActivites.isEmpty())
        {
            break MISSING_BLOCK_LABEL_40;
        }
        resolveinfo = ((ActivityResolveInfo)mActivites.get(0)).resolveInfo;
        return resolveinfo;
        obj;
        JVM INSTR monitorexit ;
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getHistoryMaxSize()
    {
        int i;
        synchronized (mInstanceLock)
        {
            i = mHistoryMaxSize;
        }
        return i;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getHistorySize()
    {
        int i;
        synchronized (mInstanceLock)
        {
            i = mHistoricalRecords.size();
        }
        return i;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Intent getIntent()
    {
        Intent intent;
        synchronized (mInstanceLock)
        {
            intent = mIntent;
        }
        return intent;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setActivitySorter(ActivitySorter activitysorter)
    {
label0:
        {
            synchronized (mInstanceLock)
            {
                if (mActivitySorter != activitysorter)
                {
                    break label0;
                }
            }
            return;
        }
        mActivitySorter = activitysorter;
        sortActivities();
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setDefaultActivity(int i)
    {
        ActivityResolveInfo activityresolveinfo = (ActivityResolveInfo)mActivites.get(i);
        ActivityResolveInfo activityresolveinfo1 = (ActivityResolveInfo)mActivites.get(0);
        float f;
        if (activityresolveinfo1 != null)
        {
            f = 5F + (activityresolveinfo1.weight - activityresolveinfo.weight);
        } else
        {
            f = 1.0F;
        }
        addHisoricalRecord(new HistoricalRecord(new ComponentName(activityresolveinfo.resolveInfo.activityInfo.packageName, activityresolveinfo.resolveInfo.activityInfo.name), System.currentTimeMillis(), f));
    }

    public void setHistoryMaxSize(int i)
    {
label0:
        {
            synchronized (mInstanceLock)
            {
                if (mHistoryMaxSize != i)
                {
                    break label0;
                }
            }
            return;
        }
        mHistoryMaxSize = i;
        pruneExcessiveHistoricalRecordsLocked();
        sortActivities();
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setIntent(Intent intent)
    {
label0:
        {
            synchronized (mInstanceLock)
            {
                if (mIntent != intent)
                {
                    break label0;
                }
            }
            return;
        }
        mIntent = intent;
        loadActivitiesLocked();
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setOnChooseActivityListener(OnChooseActivityListener onchooseactivitylistener)
    {
        mActivityChoserModelPolicy = onchooseactivitylistener;
    }










}
