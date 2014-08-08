// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.text;

import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.SystemUtils;

// Referenced classes of package org.apache.commons.lang3.text:
//            StrMatcher, StrTokenizer

public class StrBuilder
    implements CharSequence, Appendable
{
    class StrBuilderReader extends Reader
    {

        private int mark;
        private int pos;
        final StrBuilder this$0;

        public void close()
        {
        }

        public void mark(int i)
        {
            mark = pos;
        }

        public boolean markSupported()
        {
            return true;
        }

        public int read()
        {
            if (!ready())
            {
                return -1;
            } else
            {
                StrBuilder strbuilder = StrBuilder.this;
                int i = pos;
                pos = i + 1;
                return strbuilder.charAt(i);
            }
        }

        public int read(char ac[], int i, int j)
        {
            if (i < 0 || j < 0 || i > ac.length || i + j > ac.length || i + j < 0)
            {
                throw new IndexOutOfBoundsException();
            }
            if (j == 0)
            {
                return 0;
            }
            if (pos >= size())
            {
                return -1;
            }
            if (j + pos > size())
            {
                j = size() - pos;
            }
            getChars(pos, j + pos, ac, i);
            pos = j + pos;
            return j;
        }

        public boolean ready()
        {
            return pos < size();
        }

        public void reset()
        {
            pos = mark;
        }

        public long skip(long l)
        {
            if (l + (long)pos > (long)size())
            {
                l = size() - pos;
            }
            if (l < 0L)
            {
                return 0L;
            } else
            {
                pos = (int)(l + (long)pos);
                return l;
            }
        }

        StrBuilderReader()
        {
            this$0 = StrBuilder.this;
            super();
        }
    }

    class StrBuilderTokenizer extends StrTokenizer
    {

        final StrBuilder this$0;

        public String getContent()
        {
            String s = super.getContent();
            if (s == null)
            {
                s = toString();
            }
            return s;
        }

        protected List tokenize(char ac[], int i, int j)
        {
            if (ac == null)
            {
                return super.tokenize(buffer, 0, size());
            } else
            {
                return super.tokenize(ac, i, j);
            }
        }

        StrBuilderTokenizer()
        {
            this$0 = StrBuilder.this;
            super();
        }
    }

    class StrBuilderWriter extends Writer
    {

        final StrBuilder this$0;

        public void close()
        {
        }

        public void flush()
        {
        }

        public void write(int i)
        {
            append((char)i);
        }

        public void write(String s)
        {
            append(s);
        }

        public void write(String s, int i, int j)
        {
            append(s, i, j);
        }

        public void write(char ac[])
        {
            append(ac);
        }

        public void write(char ac[], int i, int j)
        {
            append(ac, i, j);
        }

        StrBuilderWriter()
        {
            this$0 = StrBuilder.this;
            super();
        }
    }


    static final int CAPACITY = 32;
    private static final long serialVersionUID = 0x69dea51fe8fc7e4bL;
    protected char buffer[];
    private String newLine;
    private String nullText;
    protected int size;

    public StrBuilder()
    {
        this(32);
    }

    public StrBuilder(int i)
    {
        if (i <= 0)
        {
            i = 32;
        }
        buffer = new char[i];
    }

    public StrBuilder(String s)
    {
        if (s == null)
        {
            buffer = new char[32];
            return;
        } else
        {
            buffer = new char[32 + s.length()];
            append(s);
            return;
        }
    }

    private void deleteImpl(int i, int j, int k)
    {
        System.arraycopy(buffer, j, buffer, i, size - j);
        size = size - k;
    }

    private StrBuilder replaceImpl(StrMatcher strmatcher, String s, int i, int j, int k)
    {
        if (strmatcher != null && size != 0)
        {
            int l;
            char ac[];
            int i1;
            if (s == null)
            {
                l = 0;
            } else
            {
                l = s.length();
            }
            ac = buffer;
            i1 = i;
            while (i1 < j && k != 0) 
            {
                int j1 = strmatcher.isMatch(ac, i1, i, j);
                if (j1 > 0)
                {
                    replaceImpl(i1, i1 + j1, j1, s, l);
                    j = l + (j - j1);
                    i1 = -1 + (i1 + l);
                    if (k > 0)
                    {
                        k--;
                    }
                }
                i1++;
            }
        }
        return this;
    }

    private void replaceImpl(int i, int j, int k, String s, int l)
    {
        int i1 = l + (size - k);
        if (l != k)
        {
            ensureCapacity(i1);
            System.arraycopy(buffer, j, buffer, i + l, size - j);
            size = i1;
        }
        if (l > 0)
        {
            s.getChars(0, l, buffer, i);
        }
    }

    public volatile Appendable append(char c)
        throws IOException
    {
        return append(c);
    }

    public volatile Appendable append(CharSequence charsequence)
        throws IOException
    {
        return append(charsequence);
    }

    public volatile Appendable append(CharSequence charsequence, int i, int j)
        throws IOException
    {
        return append(charsequence, i, j);
    }

    public StrBuilder append(char c)
    {
        ensureCapacity(1 + length());
        char ac[] = buffer;
        int i = size;
        size = i + 1;
        ac[i] = c;
        return this;
    }

    public StrBuilder append(double d)
    {
        return append(String.valueOf(d));
    }

    public StrBuilder append(float f)
    {
        return append(String.valueOf(f));
    }

    public StrBuilder append(int i)
    {
        return append(String.valueOf(i));
    }

    public StrBuilder append(long l)
    {
        return append(String.valueOf(l));
    }

    public StrBuilder append(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            return appendNull();
        } else
        {
            return append(charsequence.toString());
        }
    }

    public StrBuilder append(CharSequence charsequence, int i, int j)
    {
        if (charsequence == null)
        {
            return appendNull();
        } else
        {
            return append(charsequence.toString(), i, j);
        }
    }

    public StrBuilder append(Object obj)
    {
        if (obj == null)
        {
            return appendNull();
        } else
        {
            return append(obj.toString());
        }
    }

    public StrBuilder append(String s)
    {
        if (s == null)
        {
            this = appendNull();
        } else
        {
            int i = s.length();
            if (i > 0)
            {
                int j = length();
                ensureCapacity(j + i);
                s.getChars(0, i, buffer, j);
                size = i + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(String s, int i, int j)
    {
        if (s == null)
        {
            this = appendNull();
        } else
        {
            if (i < 0 || i > s.length())
            {
                throw new StringIndexOutOfBoundsException("startIndex must be valid");
            }
            if (j < 0 || i + j > s.length())
            {
                throw new StringIndexOutOfBoundsException("length must be valid");
            }
            if (j > 0)
            {
                int k = length();
                ensureCapacity(k + j);
                s.getChars(i, i + j, buffer, k);
                size = j + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(StringBuffer stringbuffer)
    {
        if (stringbuffer == null)
        {
            this = appendNull();
        } else
        {
            int i = stringbuffer.length();
            if (i > 0)
            {
                int j = length();
                ensureCapacity(j + i);
                stringbuffer.getChars(0, i, buffer, j);
                size = i + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(StringBuffer stringbuffer, int i, int j)
    {
        if (stringbuffer == null)
        {
            this = appendNull();
        } else
        {
            if (i < 0 || i > stringbuffer.length())
            {
                throw new StringIndexOutOfBoundsException("startIndex must be valid");
            }
            if (j < 0 || i + j > stringbuffer.length())
            {
                throw new StringIndexOutOfBoundsException("length must be valid");
            }
            if (j > 0)
            {
                int k = length();
                ensureCapacity(k + j);
                stringbuffer.getChars(i, i + j, buffer, k);
                size = j + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(StrBuilder strbuilder)
    {
        if (strbuilder == null)
        {
            this = appendNull();
        } else
        {
            int i = strbuilder.length();
            if (i > 0)
            {
                int j = length();
                ensureCapacity(j + i);
                System.arraycopy(strbuilder.buffer, 0, buffer, j, i);
                size = i + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(StrBuilder strbuilder, int i, int j)
    {
        if (strbuilder == null)
        {
            this = appendNull();
        } else
        {
            if (i < 0 || i > strbuilder.length())
            {
                throw new StringIndexOutOfBoundsException("startIndex must be valid");
            }
            if (j < 0 || i + j > strbuilder.length())
            {
                throw new StringIndexOutOfBoundsException("length must be valid");
            }
            if (j > 0)
            {
                int k = length();
                ensureCapacity(k + j);
                strbuilder.getChars(i, i + j, buffer, k);
                size = j + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(boolean flag)
    {
        if (flag)
        {
            ensureCapacity(4 + size);
            char ac5[] = buffer;
            int j1 = size;
            size = j1 + 1;
            ac5[j1] = 't';
            char ac6[] = buffer;
            int k1 = size;
            size = k1 + 1;
            ac6[k1] = 'r';
            char ac7[] = buffer;
            int l1 = size;
            size = l1 + 1;
            ac7[l1] = 'u';
            char ac8[] = buffer;
            int i2 = size;
            size = i2 + 1;
            ac8[i2] = 'e';
            return this;
        } else
        {
            ensureCapacity(5 + size);
            char ac[] = buffer;
            int i = size;
            size = i + 1;
            ac[i] = 'f';
            char ac1[] = buffer;
            int j = size;
            size = j + 1;
            ac1[j] = 'a';
            char ac2[] = buffer;
            int k = size;
            size = k + 1;
            ac2[k] = 'l';
            char ac3[] = buffer;
            int l = size;
            size = l + 1;
            ac3[l] = 's';
            char ac4[] = buffer;
            int i1 = size;
            size = i1 + 1;
            ac4[i1] = 'e';
            return this;
        }
    }

    public StrBuilder append(char ac[])
    {
        if (ac == null)
        {
            this = appendNull();
        } else
        {
            int i = ac.length;
            if (i > 0)
            {
                int j = length();
                ensureCapacity(j + i);
                System.arraycopy(ac, 0, buffer, j, i);
                size = i + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder append(char ac[], int i, int j)
    {
        if (ac == null)
        {
            this = appendNull();
        } else
        {
            if (i < 0 || i > ac.length)
            {
                throw new StringIndexOutOfBoundsException((new StringBuilder("Invalid startIndex: ")).append(j).toString());
            }
            if (j < 0 || i + j > ac.length)
            {
                throw new StringIndexOutOfBoundsException((new StringBuilder("Invalid length: ")).append(j).toString());
            }
            if (j > 0)
            {
                int k = length();
                ensureCapacity(k + j);
                System.arraycopy(ac, i, buffer, k, j);
                size = j + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder appendAll(Iterable iterable)
    {
        if (iterable == null) goto _L2; else goto _L1
_L1:
        Iterator iterator = iterable.iterator();
_L5:
        if (iterator.hasNext()) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(iterator.next());
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendAll(Iterator iterator)
    {
        if (iterator == null) goto _L2; else goto _L1
_L1:
        if (iterator.hasNext()) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(iterator.next());
        if (true) goto _L1; else goto _L4
_L4:
    }

    public StrBuilder appendAll(Object aobj[])
    {
        if (aobj == null || aobj.length <= 0) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < aobj.length) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(aobj[i]);
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendFixedWidthPadLeft(int i, int j, char c)
    {
        return appendFixedWidthPadLeft(String.valueOf(i), j, c);
    }

    public StrBuilder appendFixedWidthPadLeft(Object obj, int i, char c)
    {
        if (i <= 0) goto _L2; else goto _L1
_L1:
        String s;
        int j;
        ensureCapacity(i + size);
        if (obj == null)
        {
            s = getNullText();
        } else
        {
            s = obj.toString();
        }
        if (s == null)
        {
            s = "";
        }
        j = s.length();
        if (j < i) goto _L4; else goto _L3
_L3:
        s.getChars(j - i, j, buffer, size);
_L6:
        size = i + size;
_L2:
        return this;
_L4:
        int k = i - j;
        int l = 0;
        do
        {
label0:
            {
                if (l < k)
                {
                    break label0;
                }
                s.getChars(0, j, buffer, k + size);
            }
            if (true)
            {
                continue;
            }
            buffer[l + size] = c;
            l++;
        } while (true);
        if (true) goto _L6; else goto _L5
_L5:
    }

    public StrBuilder appendFixedWidthPadRight(int i, int j, char c)
    {
        return appendFixedWidthPadRight(String.valueOf(i), j, c);
    }

    public StrBuilder appendFixedWidthPadRight(Object obj, int i, char c)
    {
        if (i > 0)
        {
            ensureCapacity(i + size);
            String s;
            int j;
            if (obj == null)
            {
                s = getNullText();
            } else
            {
                s = obj.toString();
            }
            if (s == null)
            {
                s = "";
            }
            j = s.length();
            if (j >= i)
            {
                s.getChars(0, i, buffer, size);
            } else
            {
                int k = i - j;
                s.getChars(0, j, buffer, size);
                int l = 0;
                while (l < k) 
                {
                    buffer[l + (j + size)] = c;
                    l++;
                }
            }
            size = i + size;
        }
        return this;
    }

    public StrBuilder appendNewLine()
    {
        if (newLine == null)
        {
            append(SystemUtils.LINE_SEPARATOR);
            return this;
        } else
        {
            return append(newLine);
        }
    }

    public StrBuilder appendNull()
    {
        if (nullText == null)
        {
            return this;
        } else
        {
            return append(nullText);
        }
    }

    public StrBuilder appendPadding(int i, char c)
    {
        if (i < 0) goto _L2; else goto _L1
_L1:
        int j;
        ensureCapacity(i + size);
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        char ac[] = buffer;
        int k = size;
        size = k + 1;
        ac[k] = c;
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendSeparator(char c)
    {
        if (size() > 0)
        {
            append(c);
        }
        return this;
    }

    public StrBuilder appendSeparator(char c, char c1)
    {
        if (size() > 0)
        {
            append(c);
            return this;
        } else
        {
            append(c1);
            return this;
        }
    }

    public StrBuilder appendSeparator(char c, int i)
    {
        if (i > 0)
        {
            append(c);
        }
        return this;
    }

    public StrBuilder appendSeparator(String s)
    {
        return appendSeparator(s, ((String) (null)));
    }

    public StrBuilder appendSeparator(String s, int i)
    {
        if (s != null && i > 0)
        {
            append(s);
        }
        return this;
    }

    public StrBuilder appendSeparator(String s, String s1)
    {
        String s2;
        if (isEmpty())
        {
            s2 = s1;
        } else
        {
            s2 = s;
        }
        if (s2 != null)
        {
            append(s2);
        }
        return this;
    }

    public StrBuilder appendWithSeparators(Iterable iterable, String s)
    {
        if (iterable == null) goto _L2; else goto _L1
_L1:
        Iterator iterator;
        if (s == null)
        {
            s = "";
        }
        iterator = iterable.iterator();
_L5:
        if (iterator.hasNext()) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(iterator.next());
        if (iterator.hasNext())
        {
            append(s);
        }
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendWithSeparators(Iterator iterator, String s)
    {
        if (iterator == null) goto _L2; else goto _L1
_L1:
        if (s == null)
        {
            s = "";
        }
_L5:
        if (iterator.hasNext()) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(iterator.next());
        if (iterator.hasNext())
        {
            append(s);
        }
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendWithSeparators(Object aobj[], String s)
    {
        if (aobj == null || aobj.length <= 0) goto _L2; else goto _L1
_L1:
        int i;
        if (s == null)
        {
            s = "";
        }
        append(aobj[0]);
        i = 1;
_L5:
        if (i < aobj.length) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        append(s);
        append(aobj[i]);
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder appendln(char c)
    {
        return append(c).appendNewLine();
    }

    public StrBuilder appendln(double d)
    {
        return append(d).appendNewLine();
    }

    public StrBuilder appendln(float f)
    {
        return append(f).appendNewLine();
    }

    public StrBuilder appendln(int i)
    {
        return append(i).appendNewLine();
    }

    public StrBuilder appendln(long l)
    {
        return append(l).appendNewLine();
    }

    public StrBuilder appendln(Object obj)
    {
        return append(obj).appendNewLine();
    }

    public StrBuilder appendln(String s)
    {
        return append(s).appendNewLine();
    }

    public StrBuilder appendln(String s, int i, int j)
    {
        return append(s, i, j).appendNewLine();
    }

    public StrBuilder appendln(StringBuffer stringbuffer)
    {
        return append(stringbuffer).appendNewLine();
    }

    public StrBuilder appendln(StringBuffer stringbuffer, int i, int j)
    {
        return append(stringbuffer, i, j).appendNewLine();
    }

    public StrBuilder appendln(StrBuilder strbuilder)
    {
        return append(strbuilder).appendNewLine();
    }

    public StrBuilder appendln(StrBuilder strbuilder, int i, int j)
    {
        return append(strbuilder, i, j).appendNewLine();
    }

    public StrBuilder appendln(boolean flag)
    {
        return append(flag).appendNewLine();
    }

    public StrBuilder appendln(char ac[])
    {
        return append(ac).appendNewLine();
    }

    public StrBuilder appendln(char ac[], int i, int j)
    {
        return append(ac, i, j).appendNewLine();
    }

    public Reader asReader()
    {
        return new StrBuilderReader();
    }

    public StrTokenizer asTokenizer()
    {
        return new StrBuilderTokenizer();
    }

    public Writer asWriter()
    {
        return new StrBuilderWriter();
    }

    public int capacity()
    {
        return buffer.length;
    }

    public char charAt(int i)
    {
        if (i < 0 || i >= length())
        {
            throw new StringIndexOutOfBoundsException(i);
        } else
        {
            return buffer[i];
        }
    }

    public StrBuilder clear()
    {
        size = 0;
        return this;
    }

    public boolean contains(char c)
    {
        char ac[] = buffer;
        int i = 0;
        do
        {
            if (i >= size)
            {
                return false;
            }
            if (ac[i] == c)
            {
                return true;
            }
            i++;
        } while (true);
    }

    public boolean contains(String s)
    {
        int i = indexOf(s, 0);
        boolean flag = false;
        if (i >= 0)
        {
            flag = true;
        }
        return flag;
    }

    public boolean contains(StrMatcher strmatcher)
    {
        int i = indexOf(strmatcher, 0);
        boolean flag = false;
        if (i >= 0)
        {
            flag = true;
        }
        return flag;
    }

    public StrBuilder delete(int i, int j)
    {
        int k = validateRange(i, j);
        int l = k - i;
        if (l > 0)
        {
            deleteImpl(i, k, l);
        }
        return this;
    }

    public StrBuilder deleteAll(char c)
    {
        int i = 0;
        do
        {
            if (i >= size)
            {
                return this;
            }
            if (buffer[i] == c)
            {
                int j = i;
                int k;
                while (++i < size && buffer[i] == c) ;
                k = i - j;
                deleteImpl(j, i, k);
                i -= k;
            }
            i++;
        } while (true);
    }

    public StrBuilder deleteAll(String s)
    {
        int i;
        int j;
        if (s == null)
        {
            i = 0;
        } else
        {
            i = s.length();
        }
        if (i <= 0) goto _L2; else goto _L1
_L1:
        j = indexOf(s, 0);
_L5:
        if (j >= 0) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        deleteImpl(j, j + i, i);
        j = indexOf(s, j);
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder deleteAll(StrMatcher strmatcher)
    {
        return replace(strmatcher, null, 0, size, -1);
    }

    public StrBuilder deleteCharAt(int i)
    {
        if (i < 0 || i >= size)
        {
            throw new StringIndexOutOfBoundsException(i);
        } else
        {
            deleteImpl(i, i + 1, 1);
            return this;
        }
    }

    public StrBuilder deleteFirst(char c)
    {
        int i = 0;
        do
        {
            if (i >= size)
            {
                return this;
            }
            if (buffer[i] == c)
            {
                deleteImpl(i, i + 1, 1);
                return this;
            }
            i++;
        } while (true);
    }

    public StrBuilder deleteFirst(String s)
    {
        int i;
        if (s == null)
        {
            i = 0;
        } else
        {
            i = s.length();
        }
        if (i > 0)
        {
            int j = indexOf(s, 0);
            if (j >= 0)
            {
                deleteImpl(j, j + i, i);
            }
        }
        return this;
    }

    public StrBuilder deleteFirst(StrMatcher strmatcher)
    {
        return replace(strmatcher, null, 0, size, 1);
    }

    public boolean endsWith(String s)
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = s.length();
        if (i == 0)
        {
            return true;
        }
        if (i > size)
        {
            continue;
        }
        int j = size - i;
        int k = 0;
        do
        {
            if (k >= i)
            {
                return true;
            }
            if (buffer[j] != s.charAt(k))
            {
                continue;
            }
            k++;
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public StrBuilder ensureCapacity(int i)
    {
        if (i > buffer.length)
        {
            char ac[] = buffer;
            buffer = new char[i * 2];
            System.arraycopy(ac, 0, buffer, 0, size);
        }
        return this;
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof StrBuilder)
        {
            return equals((StrBuilder)obj);
        } else
        {
            return false;
        }
    }

    public boolean equals(StrBuilder strbuilder)
    {
        if (this != strbuilder)
        {
            if (size != strbuilder.size)
            {
                return false;
            }
            char ac[] = buffer;
            char ac1[] = strbuilder.buffer;
            int i = -1 + size;
            while (i >= 0) 
            {
                if (ac[i] != ac1[i])
                {
                    return false;
                }
                i--;
            }
        }
        return true;
    }

    public boolean equalsIgnoreCase(StrBuilder strbuilder)
    {
        if (this != strbuilder)
        {
            if (size != strbuilder.size)
            {
                return false;
            }
            char ac[] = buffer;
            char ac1[] = strbuilder.buffer;
            int i = -1 + size;
            while (i >= 0) 
            {
                char c = ac[i];
                char c1 = ac1[i];
                if (c != c1 && Character.toUpperCase(c) != Character.toUpperCase(c1))
                {
                    return false;
                }
                i--;
            }
        }
        return true;
    }

    public void getChars(int i, int j, char ac[], int k)
    {
        if (i < 0)
        {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (j < 0 || j > length())
        {
            throw new StringIndexOutOfBoundsException(j);
        }
        if (i > j)
        {
            throw new StringIndexOutOfBoundsException("end < start");
        } else
        {
            System.arraycopy(buffer, i, ac, k, j - i);
            return;
        }
    }

    public char[] getChars(char ac[])
    {
        int i = length();
        if (ac == null || ac.length < i)
        {
            ac = new char[i];
        }
        System.arraycopy(buffer, 0, ac, 0, i);
        return ac;
    }

    public String getNewLineText()
    {
        return newLine;
    }

    public String getNullText()
    {
        return nullText;
    }

    public int hashCode()
    {
        char ac[] = buffer;
        int i = 0;
        int j = -1 + size;
        do
        {
            if (j < 0)
            {
                return i;
            }
            i = i * 31 + ac[j];
            j--;
        } while (true);
    }

    public int indexOf(char c)
    {
        return indexOf(c, 0);
    }

    public int indexOf(char c, int i)
    {
        if (i < 0)
        {
            i = 0;
        }
        if (i < size) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        char ac[] = buffer;
        j = i;
        do
        {
            if (j >= size)
            {
                return -1;
            }
            if (ac[j] == c)
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public int indexOf(String s)
    {
        return indexOf(s, 0);
    }

    public int indexOf(String s, int i)
    {
        if (i < 0)
        {
            i = 0;
        }
        if (s != null && i < size) goto _L2; else goto _L1
_L1:
        i = -1;
_L4:
        return i;
_L2:
        int j;
        j = s.length();
        if (j == 1)
        {
            return indexOf(s.charAt(0), i);
        }
        if (j == 0) goto _L4; else goto _L3
_L3:
        char ac[];
        int k;
        int l;
        if (j > size)
        {
            return -1;
        }
        ac = buffer;
        k = 1 + (size - j);
        l = i;
_L6:
        if (l >= k)
        {
            return -1;
        }
        int i1 = 0;
        do
        {
label0:
            {
                if (i1 >= j)
                {
                    return l;
                }
                if (s.charAt(i1) == ac[l + i1])
                {
                    break label0;
                }
                l++;
            }
            if (true)
            {
                continue;
            }
            i1++;
        } while (true);
        if (true) goto _L6; else goto _L5
_L5:
    }

    public int indexOf(StrMatcher strmatcher)
    {
        return indexOf(strmatcher, 0);
    }

    public int indexOf(StrMatcher strmatcher, int i)
    {
        if (i < 0)
        {
            i = 0;
        }
        if (strmatcher != null && i < size) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        int k = size;
        char ac[] = buffer;
        j = i;
        do
        {
            if (j >= k)
            {
                return -1;
            }
            if (strmatcher.isMatch(ac, j, i, k) > 0)
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public StrBuilder insert(int i, char c)
    {
        validateIndex(i);
        ensureCapacity(1 + size);
        System.arraycopy(buffer, i, buffer, i + 1, size - i);
        buffer[i] = c;
        size = 1 + size;
        return this;
    }

    public StrBuilder insert(int i, double d)
    {
        return insert(i, String.valueOf(d));
    }

    public StrBuilder insert(int i, float f)
    {
        return insert(i, String.valueOf(f));
    }

    public StrBuilder insert(int i, int j)
    {
        return insert(i, String.valueOf(j));
    }

    public StrBuilder insert(int i, long l)
    {
        return insert(i, String.valueOf(l));
    }

    public StrBuilder insert(int i, Object obj)
    {
        if (obj == null)
        {
            return insert(i, nullText);
        } else
        {
            return insert(i, obj.toString());
        }
    }

    public StrBuilder insert(int i, String s)
    {
        validateIndex(i);
        if (s == null)
        {
            s = nullText;
        }
        int j;
        if (s == null)
        {
            j = 0;
        } else
        {
            j = s.length();
        }
        if (j > 0)
        {
            int k = j + size;
            ensureCapacity(k);
            System.arraycopy(buffer, i, buffer, i + j, size - i);
            size = k;
            s.getChars(0, j, buffer, i);
        }
        return this;
    }

    public StrBuilder insert(int i, boolean flag)
    {
        validateIndex(i);
        if (flag)
        {
            ensureCapacity(4 + size);
            System.arraycopy(buffer, i, buffer, i + 4, size - i);
            char ac4[] = buffer;
            int j1 = i + 1;
            ac4[i] = 't';
            char ac5[] = buffer;
            int k1 = j1 + 1;
            ac5[j1] = 'r';
            char ac6[] = buffer;
            int l1 = k1 + 1;
            ac6[k1] = 'u';
            buffer[l1] = 'e';
            size = 4 + size;
            return this;
        } else
        {
            ensureCapacity(5 + size);
            System.arraycopy(buffer, i, buffer, i + 5, size - i);
            char ac[] = buffer;
            int j = i + 1;
            ac[i] = 'f';
            char ac1[] = buffer;
            int k = j + 1;
            ac1[j] = 'a';
            char ac2[] = buffer;
            int l = k + 1;
            ac2[k] = 'l';
            char ac3[] = buffer;
            int i1 = l + 1;
            ac3[l] = 's';
            buffer[i1] = 'e';
            size = 5 + size;
            return this;
        }
    }

    public StrBuilder insert(int i, char ac[])
    {
        validateIndex(i);
        if (ac == null)
        {
            this = insert(i, nullText);
        } else
        {
            int j = ac.length;
            if (j > 0)
            {
                ensureCapacity(j + size);
                System.arraycopy(buffer, i, buffer, i + j, size - i);
                System.arraycopy(ac, 0, buffer, i, j);
                size = j + size;
                return this;
            }
        }
        return this;
    }

    public StrBuilder insert(int i, char ac[], int j, int k)
    {
        validateIndex(i);
        if (ac == null)
        {
            this = insert(i, nullText);
        } else
        {
            if (j < 0 || j > ac.length)
            {
                throw new StringIndexOutOfBoundsException((new StringBuilder("Invalid offset: ")).append(j).toString());
            }
            if (k < 0 || j + k > ac.length)
            {
                throw new StringIndexOutOfBoundsException((new StringBuilder("Invalid length: ")).append(k).toString());
            }
            if (k > 0)
            {
                ensureCapacity(k + size);
                System.arraycopy(buffer, i, buffer, i + k, size - i);
                System.arraycopy(ac, j, buffer, i, k);
                size = k + size;
                return this;
            }
        }
        return this;
    }

    public boolean isEmpty()
    {
        return size == 0;
    }

    public int lastIndexOf(char c)
    {
        return lastIndexOf(c, -1 + size);
    }

    public int lastIndexOf(char c, int i)
    {
        if (i >= size)
        {
            i = -1 + size;
        }
        if (i >= 0) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        j = i;
        do
        {
            if (j < 0)
            {
                return -1;
            }
            if (buffer[j] == c)
            {
                continue;
            }
            j--;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public int lastIndexOf(String s)
    {
        return lastIndexOf(s, -1 + size);
    }

    public int lastIndexOf(String s, int i)
    {
        if (i >= size)
        {
            i = -1 + size;
        }
        if (s != null && i >= 0) goto _L2; else goto _L1
_L1:
        int j = -1;
_L8:
        return j;
_L2:
        int k = s.length();
        if (k <= 0 || k > size) goto _L4; else goto _L3
_L3:
        if (k == 1)
        {
            return lastIndexOf(s.charAt(0), i);
        }
        j = 1 + (i - k);
_L9:
        if (j >= 0) goto _L6; else goto _L5
_L5:
        return -1;
_L6:
        int l = 0;
_L10:
        if (l >= k) goto _L8; else goto _L7
_L7:
label0:
        {
            if (s.charAt(l) == buffer[j + l])
            {
                break label0;
            }
            j--;
        }
          goto _L9
        l++;
          goto _L10
_L4:
        if (k != 0) goto _L5; else goto _L11
_L11:
        return i;
          goto _L9
    }

    public int lastIndexOf(StrMatcher strmatcher)
    {
        return lastIndexOf(strmatcher, size);
    }

    public int lastIndexOf(StrMatcher strmatcher, int i)
    {
        if (i >= size)
        {
            i = -1 + size;
        }
        if (strmatcher != null && i >= 0) goto _L2; else goto _L1
_L1:
        int j = -1;
_L4:
        return j;
_L2:
        char ac[] = buffer;
        int k = i + 1;
        j = i;
        do
        {
            if (j < 0)
            {
                return -1;
            }
            if (strmatcher.isMatch(ac, j, 0, k) > 0)
            {
                continue;
            }
            j--;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public String leftString(int i)
    {
        if (i <= 0)
        {
            return "";
        }
        if (i >= size)
        {
            return new String(buffer, 0, size);
        } else
        {
            return new String(buffer, 0, i);
        }
    }

    public int length()
    {
        return size;
    }

    public String midString(int i, int j)
    {
        if (i < 0)
        {
            i = 0;
        }
        if (j <= 0 || i >= size)
        {
            return "";
        }
        if (size <= i + j)
        {
            return new String(buffer, i, size - i);
        } else
        {
            return new String(buffer, i, j);
        }
    }

    public StrBuilder minimizeCapacity()
    {
        if (buffer.length > length())
        {
            char ac[] = buffer;
            buffer = new char[length()];
            System.arraycopy(ac, 0, buffer, 0, size);
        }
        return this;
    }

    public StrBuilder replace(int i, int j, String s)
    {
        int k = validateRange(i, j);
        int l;
        if (s == null)
        {
            l = 0;
        } else
        {
            l = s.length();
        }
        replaceImpl(i, k, k - i, s, l);
        return this;
    }

    public StrBuilder replace(StrMatcher strmatcher, String s, int i, int j, int k)
    {
        return replaceImpl(strmatcher, s, i, validateRange(i, j), k);
    }

    public StrBuilder replaceAll(char c, char c1)
    {
        if (c == c1) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < size) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        if (buffer[i] == c)
        {
            buffer[i] = c1;
        }
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder replaceAll(String s, String s1)
    {
        int i;
        int j;
        int k;
        if (s == null)
        {
            i = 0;
        } else
        {
            i = s.length();
        }
        if (i <= 0) goto _L2; else goto _L1
_L1:
        if (s1 == null)
        {
            j = 0;
        } else
        {
            j = s1.length();
        }
        k = indexOf(s, 0);
_L5:
        if (k >= 0) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        replaceImpl(k, k + i, i, s1, j);
        k = indexOf(s, k + j);
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder replaceAll(StrMatcher strmatcher, String s)
    {
        return replace(strmatcher, s, 0, size, -1);
    }

    public StrBuilder replaceFirst(char c, char c1)
    {
        if (c == c1) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < size) goto _L3; else goto _L2
_L2:
        return this;
_L3:
        if (buffer[i] == c)
        {
            buffer[i] = c1;
            return this;
        }
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public StrBuilder replaceFirst(String s, String s1)
    {
        int i;
        if (s == null)
        {
            i = 0;
        } else
        {
            i = s.length();
        }
        if (i > 0)
        {
            int j = indexOf(s, 0);
            if (j >= 0)
            {
                int k = 0;
                if (s1 != null)
                {
                    k = s1.length();
                }
                replaceImpl(j, j + i, i, s1, k);
            }
        }
        return this;
    }

    public StrBuilder replaceFirst(StrMatcher strmatcher, String s)
    {
        return replace(strmatcher, s, 0, size, 1);
    }

    public StrBuilder reverse()
    {
        if (size != 0)
        {
            int i = size / 2;
            char ac[] = buffer;
            int j = 0;
            int k = -1 + size;
            while (j < i) 
            {
                char c = ac[j];
                ac[j] = ac[k];
                ac[k] = c;
                j++;
                k--;
            }
        }
        return this;
    }

    public String rightString(int i)
    {
        if (i <= 0)
        {
            return "";
        }
        if (i >= size)
        {
            return new String(buffer, 0, size);
        } else
        {
            return new String(buffer, size - i, i);
        }
    }

    public StrBuilder setCharAt(int i, char c)
    {
        if (i < 0 || i >= length())
        {
            throw new StringIndexOutOfBoundsException(i);
        } else
        {
            buffer[i] = c;
            return this;
        }
    }

    public StrBuilder setLength(int i)
    {
        if (i < 0)
        {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (i >= size) goto _L2; else goto _L1
_L1:
        size = i;
_L4:
        return this;
_L2:
        if (i > size)
        {
            ensureCapacity(i);
            int j = size;
            size = i;
            int k = j;
            while (k < i) 
            {
                buffer[k] = '\0';
                k++;
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public StrBuilder setNewLineText(String s)
    {
        newLine = s;
        return this;
    }

    public StrBuilder setNullText(String s)
    {
        if (s != null && s.length() == 0)
        {
            s = null;
        }
        nullText = s;
        return this;
    }

    public int size()
    {
        return size;
    }

    public boolean startsWith(String s)
    {
        if (s != null) goto _L2; else goto _L1
_L1:
        return false;
_L2:
        int i = s.length();
        if (i == 0)
        {
            return true;
        }
        if (i > size)
        {
            continue;
        }
        int j = 0;
        do
        {
            if (j >= i)
            {
                return true;
            }
            if (buffer[j] != s.charAt(j))
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public CharSequence subSequence(int i, int j)
    {
        if (i < 0)
        {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (j > size)
        {
            throw new StringIndexOutOfBoundsException(j);
        }
        if (i > j)
        {
            throw new StringIndexOutOfBoundsException(j - i);
        } else
        {
            return substring(i, j);
        }
    }

    public String substring(int i)
    {
        return substring(i, size);
    }

    public String substring(int i, int j)
    {
        int k = validateRange(i, j);
        return new String(buffer, i, k - i);
    }

    public char[] toCharArray()
    {
        if (size == 0)
        {
            return ArrayUtils.EMPTY_CHAR_ARRAY;
        } else
        {
            char ac[] = new char[size];
            System.arraycopy(buffer, 0, ac, 0, size);
            return ac;
        }
    }

    public char[] toCharArray(int i, int j)
    {
        int k = validateRange(i, j) - i;
        if (k == 0)
        {
            return ArrayUtils.EMPTY_CHAR_ARRAY;
        } else
        {
            char ac[] = new char[k];
            System.arraycopy(buffer, i, ac, 0, k);
            return ac;
        }
    }

    public String toString()
    {
        return new String(buffer, 0, size);
    }

    public StringBuffer toStringBuffer()
    {
        return (new StringBuffer(size)).append(buffer, 0, size);
    }

    public StrBuilder trim()
    {
        if (size != 0)
        {
label0:
            {
                int i = size;
                char ac[] = buffer;
                for (int j = 0; j < i && ac[j] <= ' '; j++)
                {
                    break label0;
                }

                for (; j < i && ac[i - 1] <= ' '; i--)
                {
                    break MISSING_BLOCK_LABEL_86;
                }

                if (i < size)
                {
                    delete(i, size);
                }
                if (j > 0)
                {
                    delete(0, j);
                    return this;
                }
            }
        }
        return this;
    }

    protected void validateIndex(int i)
    {
        if (i < 0 || i > size)
        {
            throw new StringIndexOutOfBoundsException(i);
        } else
        {
            return;
        }
    }

    protected int validateRange(int i, int j)
    {
        if (i < 0)
        {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (j > size)
        {
            j = size;
        }
        if (i > j)
        {
            throw new StringIndexOutOfBoundsException("end < start");
        } else
        {
            return j;
        }
    }
}
