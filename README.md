# icu4c-android
This is ICU4C build project for Android. This builds ICU common and i18n static libraries which are used by Couchbase Lite Android.

#### How to setup the project
```
$git clone https://github.com/couchbaselabs/icu4c-android.git
$git submodule update --init --recursive
```

## How to build with NDK
```
ndk-build -C jni
```

## Outputs
```
obj/local/<TARGET_ARCH_ABI>/libicuuc_static.a
obj/local/<TARGET_ARCH_ABI>/libicui18n_static.a
```
