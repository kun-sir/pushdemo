# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers
-dontpreverify
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
-keepattributes Signature
-keepattributes *Annotation*,InnerClasses
-keepattributes *JavascriptInterface*
#保留crash日志的行号
-keepattributes SourceFile,LineNumberTable

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.android.vending.licensing.ILicensingService

-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

-keepclassmembers class **.R$* {
    public static <fields>;
}
-keepclassmembers class * {
    void *(**On*Event);
}

#3.webview
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
   public *;
}

-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.webView, jav.lang.String);
}

-keep @com.yitong.mobile.annotation.KeepNotProguard class * {*;}
-keep class * {
    @com.yitong.mobile.annotation.KeepNotProguard <fields>;
}
-keepclassmembers class * {
    @com.yitong.mobile.annotation.KeepNotProguard <methods>;
}

-dontwarn
-ignorewarnings

# support
-keep class android.support.** {*;}
-keep class androidx.** {*;}

## 移除所有android.util.Log相关的代码
-assumenosideeffects class android.util.Log {
  public static int v(...);
  public static int i(...);
  public static int w(...);
  public static int d(...);
  public static int e(...);
}

#实体类
-keepclassmembers class * extends com.yitong.mobile.framework.entity.YTBaseVo { *;}
#插件
#-keep public class * extends cn.com.yitong.mpaas.nebula.plugin.MpaasBasePlugin { public <methods>; }
#-keep public class * extends com.alipay.mobile.h5container.api.H5SimplePlugin { public <methods>; }
#-keep class cn.com.yitong.mpaas.nebula.plugin.YTPluginEntry {*;}

# 加密数据库
-dontwarn net.sqlciphe.**
-keep class net.sqlcipher.** { *;}
-keep public class net.sqlcipher.database.** { *;}

-keep class com.google.gson.** {*;}

# commons-codec
-dontwarn org.apache.commons.**
-keep class org.apache.commons.codec.** {*;}

# eventbus
-dontwarn org.greenrobot.**
-keepclassmembers class ** {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }
-keep class org.greenrobot.event.** {*;}

# ARouter
-keep class com.alibaba.android.arouter.** {*;}


-keep class com.i2trust.** {*;}
-keep class com.sensetime.senseid.sdk.liveness.silent.** {*;}
-keep class com.alibaba.** {*;}
-keep class com.alipay.** {*;}
-keep class com.mpass.** {*;}
-keep class com.mpaas.** {*;}
-keep class com.youku.** {*;}
-keep class test.aompfilemanager.** {*;}
-keep class test.tinyapp.** {*;}
-keep class com.amap.** {*;}
-keep class tv.danmaku.ijk.media.** {*;}
-keep class com.android.** {*;}
-keep class com.laiwang.** {*;}
-keep class com.sina.** {*;}
-keep class com.tencent.** {*;}
-keep class xnn.** {*;}
-keep class com.dodola.** {*;}
-keep class com.abq.** {*;}
-keep class com.eg.** {*;}
-keep class com.linearallocpatch.** {*;}
-keep class com.seiginonakama.** {*;}
-keep class com.j256.** {*;}
-keep class alipay.yunpushcore.rpc.** {*;}
-keep class com.autonavi.** {*;}
-keep class com.ta.** {*;}
-keep class com.ut.** {*;}
-keep class com.xiaomi.** {*;}
-keep class com.example.** {*;}
-keep class android.phone.wallet.** {*;}
-keep class com.google.** {*;}
-keep class com.uc.** {*;}
-keep class android.webkit.** {*;}
-keep class com.uc.** {*;}
-keep class com.bytedance.boost_multidex.** {*;}
-keep class com.flyco.tablayout.** {*;}
-keep class com.bumptech.glide.** {*;}
-keep class com.stx.xhb.xbanner.** {*;}
-keep class com.gyf.immersionbar.** {*;}
-keep class com.huawei.** {*;}
-keep class com.nostra13.universalimageloader.** {*;}
-keep class com.orhanobut.logger.** {*;}
-keep class com.sina.** {*;}
-keep class okio.** {*;}
-keep class com.squareup.wire.** {*;}
-keep class com.youth.banner.** {*;}
-keep class me.jessyan.autosize.** {*;}
-keep class org.greenrobot.** {*;}
-keep class pub.devrel.easypermissions.** {*;}
-keep class cn.pf.passguard.** {*;}
-keep class cn.microdone.** {*;}
-keep class cn.geemee.** {*;}
-keep class com.a.a.** {*;}
-keep class com.abq.qba.** {*;}
-keep class com.ant.** {*;}
-keep class com.autonavi.amap.mapcore2d.** {*;}
-keep class com.baidu.** {*;}
-keep class com.devices.** {*;}
-keep class com.fdbank.newmobile.face.** {*;}
-keep class com.ftbankdemo.utils.** {*;}
-keep class com.ftsafe.keyinterface.** {*;}
-keep class com.loc.** {*;}
-keep class com.weibo.ssosdk.** {*;}
# 腾讯浏览服务
-dontwarn dalvik.**
-dontwarn com.tencent.smtt.**

-keep class com.tencent.smtt.** {
    *;
}

-keep class com.tencent.tbs.** {
    *;
}


-ignorewarnings
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable
-keep class com.huawei.hianalytics.**{*;}
-keep class com.huawei.updatesdk.**{*;}
-keep class com.huawei.hms.**{*;}
-dontwarn com.vivo.push.**

-keep class com.vivo.push.**{*; }

-keep class com.vivo.vms.**{*; }

-keep class   xxx.xxx.xxx.PushMessageReceiverImpl{*;}