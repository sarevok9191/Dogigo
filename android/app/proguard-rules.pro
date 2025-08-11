# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.bouncycastle.jce.provider.BouncyCastleProvider
-dontwarn org.bouncycastle.pqc.jcajce.provider.BouncyCastlePQCProvider
-keep class org.xmlpull.v1.** { *; }

# Temel Android ve Flutter Kuralları
-keep class androidx.lifecycle.** { *; }
-keep class androidx.fragment.** { *; }
-keep class androidx.core.** { *; }
-keep class androidx.appcompat.app.** { *; }
-keep class com.google.android.material.** { *; }
-keepattributes Signature,InnerClasses,Exceptions,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

# Flutter'a Özel Kurallar
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }


# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Firebase Authentication
-keep class com.google.firebase.auth.** { *; }
-keep class com.google.firebase.auth.api.** { *; }
-keepattributes *Annotation*

# Firebase Cloud Messaging (FCM)
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.iid.** { *; } # Firebase Instance ID (artık pek kullanılmıyor, ama bazı eski sürümler için gerekebilir)

# Diğer Bağımlılıklar için Kurallar (Örnekler)

# auto_size_text
-keep class com.gl.flutter_autosizetext.** { *; }

# cached_network_image
-keep class com.cachednetworkimage.** {*;}

# cloud_firestore
-keep class io.grpc.** { *; }

# cloud_functions
-keep class com.google.cloud.functions.** { *; }


# google_sign_in
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.identity.** { *;}


# image_picker
-keep class com.imagepicker.** {*;}

# shared_preferences
-keep class shared_preferences.** {*;}

# url_launcher
-keep class com.url_launcher.** { *; }

# provider
-keep class provider.** { *; }

# google_maps_flutter
-keep class com.google.maps.** { *; }
-keep class com.google.android.gms.maps.** { *; }
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task
-dontwarn com.squareup.okhttp.CipherSuite
-dontwarn com.squareup.okhttp.ConnectionSpec
-dontwarn com.squareup.okhttp.TlsVersion

