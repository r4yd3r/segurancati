.class public Lcom/slidingmenu/lib/SlidingMenu$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "SlidingMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/slidingmenu/lib/SlidingMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/slidingmenu/lib/SlidingMenu$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mBehindShowing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 866
    new-instance v0, Lcom/slidingmenu/lib/SlidingMenu$SavedState$1;

    invoke-direct {v0}, Lcom/slidingmenu/lib/SlidingMenu$SavedState$1;-><init>()V

    .line 865
    sput-object v0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 874
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 877
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 878
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->mBehindShowing:Z

    .line 879
    return-void

    .line 878
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/slidingmenu/lib/SlidingMenu$SavedState;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 876
    invoke-direct {p0, p1}, Lcom/slidingmenu/lib/SlidingMenu$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;Z)V
    .locals 0
    .parameter "superState"
    .parameter "isBehindShowing"

    .prologue
    .line 853
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 854
    iput-boolean p2, p0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->mBehindShowing:Z

    .line 855
    return-void
.end method

.method static synthetic access$1(Lcom/slidingmenu/lib/SlidingMenu$SavedState;)Z
    .locals 1
    .parameter

    .prologue
    .line 850
    iget-boolean v0, p0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->mBehindShowing:Z

    return v0
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 861
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 862
    iget-boolean v0, p0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->mBehindShowing:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 863
    return-void

    .line 862
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
