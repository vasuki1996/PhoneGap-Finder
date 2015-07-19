.class public Lorg/apache/cordova/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# static fields
.field private static final SLOW_EXEC_WARNING_THRESHOLD:I

.field private static TAG:Ljava/lang/String;


# instance fields
.field private final app:Lorg/apache/cordova/CordovaWebView;

.field private final ctx:Lorg/apache/cordova/CordovaInterface;

.field private final entryMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final pluginMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CordovaPlugin;",
            ">;"
        }
    .end annotation
.end field

.field protected urlMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "PluginManager"

    sput-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    .line 45
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x3c

    :goto_0
    sput v0, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    return-void

    :cond_0
    const/16 v0, 0x10

    goto :goto_0
.end method

.method constructor <init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;)V
    .locals 1
    .param p1, "cordovaWebView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/cordova/PluginManager;-><init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Ljava/util/List;)V

    .line 61
    return-void
.end method

.method constructor <init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Ljava/util/List;)V
    .locals 2
    .param p1, "cordovaWebView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/cordova/CordovaWebView;",
            "Lorg/apache/cordova/CordovaInterface;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p3, "pluginEntries":Ljava/util/List;, "Ljava/util/List<Lorg/apache/cordova/PluginEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    .line 49
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/HashMap;

    .line 56
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/cordova/PluginManager;->urlMap:Ljava/util/HashMap;

    .line 64
    iput-object p2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    .line 65
    iput-object p1, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    .line 66
    if-nez p3, :cond_0

    .line 67
    new-instance v0, Lorg/apache/cordova/ConfigXmlParser;

    invoke-direct {v0}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 68
    .local v0, "parser":Lorg/apache/cordova/ConfigXmlParser;
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/ConfigXmlParser;->parse(Landroid/app/Activity;)V

    .line 69
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getPluginEntries()Ljava/util/ArrayList;

    move-result-object p3

    .line 71
    .end local v0    # "parser":Lorg/apache/cordova/ConfigXmlParser;
    :cond_0
    invoke-virtual {p0, p3}, Lorg/apache/cordova/PluginManager;->setPluginEntries(Ljava/util/List;)V

    .line 72
    return-void
.end method

.method private instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .locals 7
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 399
    const/4 v3, 0x0

    .line 401
    .local v3, "ret":Lorg/apache/cordova/CordovaPlugin;
    const/4 v1, 0x0

    .line 402
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_0

    :try_start_0
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 403
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 405
    :cond_0
    if-eqz v1, :cond_2

    const/4 v4, 0x1

    :goto_0
    const-class v5, Lorg/apache/cordova/CordovaPlugin;

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    and-int/2addr v4, v5

    if-eqz v4, :cond_1

    .line 406
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    :cond_1
    :goto_1
    return-object v3

    .line 405
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .line 408
    :catch_0
    move-exception v2

    .line 409
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 410
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error adding plugin "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 209
    new-instance v0, Lorg/apache/cordova/PluginEntry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 210
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    .line 211
    return-void
.end method

.method public addService(Lorg/apache/cordova/PluginEntry;)V
    .locals 5
    .param p1, "entry"    # Lorg/apache/cordova/PluginEntry;

    .prologue
    .line 220
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/HashMap;

    iget-object v2, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    invoke-virtual {p1}, Lorg/apache/cordova/PluginEntry;->getUrlFilters()Ljava/util/List;

    move-result-object v0

    .line 222
    .local v0, "urlFilters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 223
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->urlMap:Ljava/util/HashMap;

    iget-object v2, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :cond_0
    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v1, :cond_1

    .line 226
    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 227
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    iget-object v2, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    :cond_1
    return-void
.end method

.method public clearPluginObjects()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 105
    return-void
.end method

.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;
    .param p4, "rawArgs"    # Ljava/lang/String;

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v6

    .line 142
    .local v6, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-nez v6, :cond_1

    .line 143
    sget-object v10, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "exec() call to unknown plugin: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 145
    .local v2, "cr":Lorg/apache/cordova/PluginResult;
    iget-object v10, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v0, p3

    invoke-virtual {v10, v2, v0}, Lorg/apache/cordova/CordovaWebView;->sendPluginResult(Lorg/apache/cordova/PluginResult;Ljava/lang/String;)V

    .line 168
    .end local v2    # "cr":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    new-instance v1, Lorg/apache/cordova/CallbackContext;

    iget-object v10, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v0, p3

    invoke-direct {v1, v0, v10}, Lorg/apache/cordova/CallbackContext;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaWebView;)V

    .line 150
    .local v1, "callbackContext":Lorg/apache/cordova/CallbackContext;
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 151
    .local v7, "pluginStartTime":J
    move-object/from16 v0, p4

    invoke-virtual {v6, p2, v0, v1}, Lorg/apache/cordova/CordovaPlugin;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z

    move-result v9

    .line 152
    .local v9, "wasValidAction":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v3, v10, v7

    .line 154
    .local v3, "duration":J
    sget v10, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    int-to-long v10, v10

    cmp-long v10, v3, v10

    if-lez v10, :cond_2

    .line 155
    sget-object v10, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "THREAD WARNING: exec() call to "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " blocked the main thread for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "ms. Plugin should use CordovaInterface.getThreadPool()."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    :cond_2
    if-nez v9, :cond_0

    .line 158
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 159
    .restart local v2    # "cr":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 161
    .end local v2    # "cr":Lorg/apache/cordova/PluginResult;
    .end local v3    # "duration":J
    .end local v7    # "pluginStartTime":J
    .end local v9    # "wasValidAction":Z
    :catch_0
    move-exception v5

    .line 162
    .local v5, "e":Lorg/json/JSONException;
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 163
    .restart local v2    # "cr":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 164
    .end local v2    # "cr":Lorg/apache/cordova/PluginResult;
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v5

    .line 165
    .local v5, "e":Ljava/lang/Exception;
    sget-object v10, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string v11, "Uncaught exception from plugin"

    invoke-static {v10, v11, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 166
    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;
    .param p4, "jsonArgs"    # Ljava/lang/String;
    .param p5, "async"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 172
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/cordova/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    return-void
.end method

.method public getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .locals 5
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 184
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 185
    .local v1, "ret":Lorg/apache/cordova/CordovaPlugin;
    if-nez v1, :cond_1

    .line 186
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 187
    .local v0, "pe":Lorg/apache/cordova/PluginEntry;
    if-nez v0, :cond_0

    .line 188
    const/4 v2, 0x0

    .line 198
    .end local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    :goto_0
    return-object v2

    .line 190
    .restart local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    :cond_0
    iget-object v2, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_2

    .line 191
    iget-object v1, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    .line 195
    :goto_1
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 196
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    :cond_1
    move-object v2, v1

    .line 198
    goto :goto_0

    .line 193
    .restart local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    :cond_2
    iget-object v2, v0, Lorg/apache/cordova/PluginEntry;->pluginClass:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/cordova/PluginManager;->instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v1

    goto :goto_1
.end method

.method public init()V
    .locals 2

    .prologue
    .line 88
    sget-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string v1, "init()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 90
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 91
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 92
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->startupPlugins()V

    .line 93
    return-void
.end method

.method public loadPlugins()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 97
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 302
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 303
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 304
    invoke-virtual {v1}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    goto :goto_0

    .line 307
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_1
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 336
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 337
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 338
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_0

    .line 341
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_1
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 8
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 354
    iget-object v6, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 355
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v6, p0, Lorg/apache/cordova/PluginManager;->urlMap:Ljava/util/HashMap;

    iget-object v7, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 356
    .local v5, "urlFilters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v5, :cond_2

    .line 357
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 358
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 359
    iget-object v6, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {p0, v6}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/apache/cordova/CordovaPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v6

    .line 369
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "urlFilters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    return v6

    .line 363
    .restart local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    .restart local v5    # "urlFilters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    iget-object v6, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    iget-object v7, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/CordovaPlugin;

    .line 364
    .local v3, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v3, :cond_0

    invoke-virtual {v3, p1}, Lorg/apache/cordova/CordovaPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 365
    const/4 v6, 0x1

    goto :goto_0

    .line 369
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    .end local v3    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    .end local v5    # "urlFilters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 238
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 239
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 240
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    goto :goto_0

    .line 243
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_1
    return-void
.end method

.method public onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z
    .locals 3
    .param p1, "view"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "request"    # Lorg/apache/cordova/ICordovaClientCertRequest;

    .prologue
    .line 277
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 278
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    invoke-virtual {v1, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 279
    const/4 v2, 0x1

    .line 282
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "handler"    # Lorg/apache/cordova/ICordovaHttpAuthHandler;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "realm"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 259
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    invoke-virtual {v1, p1, p2, p3, p4}, Lorg/apache/cordova/CordovaPlugin;->onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 260
    const/4 v2, 0x1

    .line 263
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onReset()V
    .locals 3

    .prologue
    .line 376
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 377
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 378
    invoke-virtual {v1}, Lorg/apache/cordova/CordovaPlugin;->onReset()V

    goto :goto_0

    .line 381
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_1
    return-void
.end method

.method public onResume(Z)V
    .locals 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 291
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 292
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 293
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    goto :goto_0

    .line 296
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_1
    return-void
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 317
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3, p1, p2}, Lorg/apache/cordova/CordovaInterface;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 318
    .local v1, "obj":Ljava/lang/Object;
    if-eqz v1, :cond_0

    move-object v3, v1

    .line 329
    :goto_0
    return-object v3

    .line 321
    :cond_0
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    .line 322
    .local v2, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v2, :cond_1

    .line 323
    invoke-virtual {v2, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 324
    if-eqz v1, :cond_1

    move-object v3, v1

    .line 325
    goto :goto_0

    .line 329
    .end local v2    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 384
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 385
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_0

    .line 386
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 387
    .local v2, "ret":Landroid/net/Uri;
    if-eqz v2, :cond_0

    .line 392
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    .end local v2    # "ret":Landroid/net/Uri;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setPluginEntries(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "pluginEntries":Ljava/util/List;, "Ljava/util/List<Lorg/apache/cordova/PluginEntry;>;"
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 76
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 77
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 78
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->urlMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 79
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 80
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    goto :goto_0

    .line 82
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    :cond_0
    return-void
.end method

.method public startupPlugins()V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 112
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 115
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-boolean v2, v0, Lorg/apache/cordova/PluginEntry;->onload:Z

    if-eqz v2, :cond_0

    .line 116
    iget-object v2, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    goto :goto_0

    .line 118
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/HashMap;

    iget-object v3, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 121
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    :cond_1
    return-void
.end method
