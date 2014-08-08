.class public Lorg/apache/commons/lang3/builder/StandardToStringStyle;
.super Lorg/apache/commons/lang3/builder/ToStringStyle;
.source "StandardToStringStyle.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;-><init>()V

    .line 48
    return-void
.end method


# virtual methods
.method public getArrayEnd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getArrayEnd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArraySeparator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 244
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getArraySeparator()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArrayStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getArrayStart()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentEnd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getContentEnd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getContentStart()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFieldNameValueSeparator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 319
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getFieldNameValueSeparator()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFieldSeparator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 344
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getFieldSeparator()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNullText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 421
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getNullText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSizeEndText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 480
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getSizeEndText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSizeStartText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 449
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getSizeStartText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSummaryObjectEndText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 542
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getSummaryObjectEndText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSummaryObjectStartText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->getSummaryObjectStartText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isArrayContentDetail()Z
    .locals 1

    .prologue
    .line 172
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isArrayContentDetail()Z

    move-result v0

    return v0
.end method

.method public isDefaultFullDetail()Z
    .locals 1

    .prologue
    .line 149
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isDefaultFullDetail()Z

    move-result v0

    return v0
.end method

.method public isFieldSeparatorAtEnd()Z
    .locals 1

    .prologue
    .line 397
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isFieldSeparatorAtEnd()Z

    move-result v0

    return v0
.end method

.method public isFieldSeparatorAtStart()Z
    .locals 1

    .prologue
    .line 371
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isFieldSeparatorAtStart()Z

    move-result v0

    return v0
.end method

.method public isUseClassName()Z
    .locals 1

    .prologue
    .line 59
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isUseClassName()Z

    move-result v0

    return v0
.end method

.method public isUseFieldNames()Z
    .locals 1

    .prologue
    .line 126
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isUseFieldNames()Z

    move-result v0

    return v0
.end method

.method public isUseIdentityHashCode()Z
    .locals 1

    .prologue
    .line 104
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isUseIdentityHashCode()Z

    move-result v0

    return v0
.end method

.method public isUseShortClassName()Z
    .locals 1

    .prologue
    .line 82
    invoke-super {p0}, Lorg/apache/commons/lang3/builder/ToStringStyle;->isUseShortClassName()Z

    move-result v0

    return v0
.end method

.method public setArrayContentDetail(Z)V
    .locals 0
    .parameter "arrayContentDetail"

    .prologue
    .line 182
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setArrayContentDetail(Z)V

    .line 183
    return-void
.end method

.method public setArrayEnd(Ljava/lang/String;)V
    .locals 0
    .parameter "arrayEnd"

    .prologue
    .line 232
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setArrayEnd(Ljava/lang/String;)V

    .line 233
    return-void
.end method

.method public setArraySeparator(Ljava/lang/String;)V
    .locals 0
    .parameter "arraySeparator"

    .prologue
    .line 257
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setArraySeparator(Ljava/lang/String;)V

    .line 258
    return-void
.end method

.method public setArrayStart(Ljava/lang/String;)V
    .locals 0
    .parameter "arrayStart"

    .prologue
    .line 207
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setArrayStart(Ljava/lang/String;)V

    .line 208
    return-void
.end method

.method public setContentEnd(Ljava/lang/String;)V
    .locals 0
    .parameter "contentEnd"

    .prologue
    .line 307
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setContentEnd(Ljava/lang/String;)V

    .line 308
    return-void
.end method

.method public setContentStart(Ljava/lang/String;)V
    .locals 0
    .parameter "contentStart"

    .prologue
    .line 282
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setContentStart(Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method public setDefaultFullDetail(Z)V
    .locals 0
    .parameter "defaultFullDetail"

    .prologue
    .line 160
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setDefaultFullDetail(Z)V

    .line 161
    return-void
.end method

.method public setFieldNameValueSeparator(Ljava/lang/String;)V
    .locals 0
    .parameter "fieldNameValueSeparator"

    .prologue
    .line 332
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setFieldNameValueSeparator(Ljava/lang/String;)V

    .line 333
    return-void
.end method

.method public setFieldSeparator(Ljava/lang/String;)V
    .locals 0
    .parameter "fieldSeparator"

    .prologue
    .line 357
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setFieldSeparator(Ljava/lang/String;)V

    .line 358
    return-void
.end method

.method public setFieldSeparatorAtEnd(Z)V
    .locals 0
    .parameter "fieldSeparatorAtEnd"

    .prologue
    .line 409
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setFieldSeparatorAtEnd(Z)V

    .line 410
    return-void
.end method

.method public setFieldSeparatorAtStart(Z)V
    .locals 0
    .parameter "fieldSeparatorAtStart"

    .prologue
    .line 383
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setFieldSeparatorAtStart(Z)V

    .line 384
    return-void
.end method

.method public setNullText(Ljava/lang/String;)V
    .locals 0
    .parameter "nullText"

    .prologue
    .line 434
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setNullText(Ljava/lang/String;)V

    .line 435
    return-void
.end method

.method public setSizeEndText(Ljava/lang/String;)V
    .locals 0
    .parameter "sizeEndText"

    .prologue
    .line 496
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setSizeEndText(Ljava/lang/String;)V

    .line 497
    return-void
.end method

.method public setSizeStartText(Ljava/lang/String;)V
    .locals 0
    .parameter "sizeStartText"

    .prologue
    .line 465
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setSizeStartText(Ljava/lang/String;)V

    .line 466
    return-void
.end method

.method public setSummaryObjectEndText(Ljava/lang/String;)V
    .locals 0
    .parameter "summaryObjectEndText"

    .prologue
    .line 558
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setSummaryObjectEndText(Ljava/lang/String;)V

    .line 559
    return-void
.end method

.method public setSummaryObjectStartText(Ljava/lang/String;)V
    .locals 0
    .parameter "summaryObjectStartText"

    .prologue
    .line 527
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setSummaryObjectStartText(Ljava/lang/String;)V

    .line 528
    return-void
.end method

.method public setUseClassName(Z)V
    .locals 0
    .parameter "useClassName"

    .prologue
    .line 69
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setUseClassName(Z)V

    .line 70
    return-void
.end method

.method public setUseFieldNames(Z)V
    .locals 0
    .parameter "useFieldNames"

    .prologue
    .line 136
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setUseFieldNames(Z)V

    .line 137
    return-void
.end method

.method public setUseIdentityHashCode(Z)V
    .locals 0
    .parameter "useIdentityHashCode"

    .prologue
    .line 114
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setUseIdentityHashCode(Z)V

    .line 115
    return-void
.end method

.method public setUseShortClassName(Z)V
    .locals 0
    .parameter "useShortClassName"

    .prologue
    .line 93
    invoke-super {p0, p1}, Lorg/apache/commons/lang3/builder/ToStringStyle;->setUseShortClassName(Z)V

    .line 94
    return-void
.end method
