.class Lorg/apache/cordova/SplashScreenInternal$6;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/SplashScreenInternal;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 234
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$6;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iput-object p2, p0, Lorg/apache/cordova/SplashScreenInternal$6;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/SplashScreenInternal$6;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 236
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal$6;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    # invokes: Lorg/apache/cordova/SplashScreenInternal;->spinnerStop()V
    invoke-static {v0}, Lorg/apache/cordova/SplashScreenInternal;->access$300(Lorg/apache/cordova/SplashScreenInternal;)V

    .line 237
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal$6;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v0, v0, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/SplashScreenInternal$6;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal$6;->val$message:Ljava/lang/String;

    new-instance v5, Lorg/apache/cordova/SplashScreenInternal$6$1;

    invoke-direct {v5, p0}, Lorg/apache/cordova/SplashScreenInternal$6$1;-><init>(Lorg/apache/cordova/SplashScreenInternal$6;)V

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    # setter for: Lorg/apache/cordova/SplashScreenInternal;->spinnerDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lorg/apache/cordova/SplashScreenInternal;->access$402(Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 243
    return-void
.end method
