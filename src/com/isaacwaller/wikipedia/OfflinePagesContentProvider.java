// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

// Referenced classes of package com.isaacwaller.wikipedia:
//            OfflinePageSaver

public class OfflinePagesContentProvider extends ContentProvider
{

    public OfflinePagesContentProvider()
    {
    }

    public int delete(Uri uri, String s, String as[])
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Offline Page Provider");
    }

    public String getType(Uri uri)
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Offline Page Provider");
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Offline Page Provider");
    }

    public boolean onCreate()
    {
        return true;
    }

    public ParcelFileDescriptor openFile(Uri uri, String s)
        throws FileNotFoundException
    {
        List list = uri.getPathSegments();
        String s1 = OfflinePageSaver.SAVE_DIR;
        int i = 0;
        do
        {
            if (i >= list.size())
            {
                File file = new File((new StringBuilder(String.valueOf(s1))).append("/file").toString());
                Log.i("OfflinePagesContentProvider", (new StringBuilder("Page requested ")).append(uri).append(".\nReturning ").append(file).append("\nFile exists: ").append(file.exists()).append("\nSave dir: ").append(OfflinePageSaver.SAVE_DIR).toString());
                return ParcelFileDescriptor.open(file, 0x10000000);
            }
            s1 = (new StringBuilder(String.valueOf(s1))).append((String)list.get(i)).append("/").toString();
            i++;
        } while (true);
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        throw new UnsupportedOperationException("You cannot query the Wikipedia Offline Page Provider");
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        throw new UnsupportedOperationException("You cannot modify the Wikipedia Offline Page Provider");
    }
}
