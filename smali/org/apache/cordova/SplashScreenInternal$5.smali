.class Lorg/apache/cordova/SplashScreenInternal$5;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal;->showSplashScreen(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/SplashScreenInternal;

.field final synthetic val$drawableId:I

.field final synthetic val$hideAfterDelay:Z

.field final synthetic val$splashscreenTime:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal;IZI)V
    .locals 0

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iput p2, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$drawableId:I

    iput-boolean p3, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$hideAfterDelay:Z

    iput p4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$splashscreenTime:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    const/16 v7, 0x400

    .line 161
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v4, v4, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 162
    .local v1, "display":Landroid/view/Display;
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v4, v4, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 165
    .local v0, "context":Landroid/content/Context;
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 166
    .local v3, "root":Landroid/widget/LinearLayout;
    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 167
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 168
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 172
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v4, v4, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "backgroundColor"

    const/high16 v6, -0x1000000

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 173
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    invoke-direct {v4, v8, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    iget v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$drawableId:I

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 178
    new-instance v4, Landroid/app/Dialog;

    const v5, 0x1030010

    invoke-direct {v4, v0, v5}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    # setter for: Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lorg/apache/cordova/SplashScreenInternal;->access$102(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 180
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v4, v4, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v4, v4, 0x400

    if-ne v4, v7, :cond_0

    .line 182
    # getter for: Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v7, v7}, Landroid/view/Window;->setFlags(II)V

    .line 185
    :cond_0
    # getter for: Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 186
    # getter for: Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$100()Landroid/app/Dialog;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 187
    # getter for: Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    .line 190
    iget-boolean v4, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$hideAfterDelay:Z

    if-eqz v4, :cond_1

    .line 191
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 192
    .local v2, "handler":Landroid/os/Handler;
    new-instance v4, Lorg/apache/cordova/SplashScreenInternal$5$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/SplashScreenInternal$5$1;-><init>(Lorg/apache/cordova/SplashScreenInternal$5;)V

    iget v5, p0, Lorg/apache/cordova/SplashScreenInternal$5;->val$splashscreenTime:I

    int-to-long v5, v5

    invoke-virtual {v2, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 198
    .end local v2    # "handler":Landroid/os/Handler;
    :cond_1
    return-void
.end method
