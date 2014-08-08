// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.Serializable;

// Referenced classes of package org.apache.commons.lang3:
//            SerializationException

public class SerializationUtils
{

    public SerializationUtils()
    {
    }

    public static Object clone(Serializable serializable)
    {
        return deserialize(serialize(serializable));
    }

    public static Object deserialize(InputStream inputstream)
    {
        ObjectInputStream objectinputstream;
        if (inputstream == null)
        {
            throw new IllegalArgumentException("The InputStream must not be null");
        }
        objectinputstream = null;
        ObjectInputStream objectinputstream1 = new ObjectInputStream(inputstream);
        Object obj = objectinputstream1.readObject();
        ClassNotFoundException classnotfoundexception;
        Exception exception;
        IOException ioexception1;
        if (objectinputstream1 != null)
        {
            try
            {
                objectinputstream1.close();
            }
            catch (IOException ioexception2)
            {
                return obj;
            }
        }
        return obj;
        classnotfoundexception;
_L4:
        throw new SerializationException(classnotfoundexception);
        exception;
_L1:
        if (objectinputstream != null)
        {
            try
            {
                objectinputstream.close();
            }
            catch (IOException ioexception) { }
        }
        throw exception;
        ioexception1;
_L2:
        throw new SerializationException(ioexception1);
        exception;
        objectinputstream = objectinputstream1;
          goto _L1
        ioexception1;
        objectinputstream = objectinputstream1;
          goto _L2
        classnotfoundexception;
        objectinputstream = objectinputstream1;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static Object deserialize(byte abyte0[])
    {
        if (abyte0 == null)
        {
            throw new IllegalArgumentException("The byte[] must not be null");
        } else
        {
            return deserialize(((InputStream) (new ByteArrayInputStream(abyte0))));
        }
    }

    public static void serialize(Serializable serializable, OutputStream outputstream)
    {
        ObjectOutputStream objectoutputstream;
        if (outputstream == null)
        {
            throw new IllegalArgumentException("The OutputStream must not be null");
        }
        objectoutputstream = null;
        ObjectOutputStream objectoutputstream1 = new ObjectOutputStream(outputstream);
        objectoutputstream1.writeObject(serializable);
        if (objectoutputstream1 == null)
        {
            break MISSING_BLOCK_LABEL_38;
        }
        objectoutputstream1.close();
        return;
        IOException ioexception;
        ioexception;
_L4:
        throw new SerializationException(ioexception);
        Exception exception;
        exception;
_L2:
        if (objectoutputstream != null)
        {
            try
            {
                objectoutputstream.close();
            }
            catch (IOException ioexception1) { }
        }
        throw exception;
        IOException ioexception2;
        ioexception2;
        return;
        exception;
        objectoutputstream = objectoutputstream1;
        if (true) goto _L2; else goto _L1
_L1:
        ioexception;
        objectoutputstream = objectoutputstream1;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static byte[] serialize(Serializable serializable)
    {
        ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream(512);
        serialize(serializable, ((OutputStream) (bytearrayoutputstream)));
        return bytearrayoutputstream.toByteArray();
    }
}
