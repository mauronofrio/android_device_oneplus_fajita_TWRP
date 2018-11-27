# Device Tree for OnePlus 6T (fajita)

The OnePlus 6T (codenamed _"fajita"_) is a flagship smartphone from OnePlus.
It was released in Novemeber 2018.

| Basic                   | Spec Sheet                                                                                                                     |
| -----------------------:|:------------------------------------------------------------------------------------------------------------------------------ |
| CPU                     | Octa-core (4x2.8 GHz Kryo 385 Gold & 4x1.7 GHz Kryo 385 Silver)                                                                |
| Chipset                 | Qualcomm SDM845 Snapdragon 845                                                                                                 |
| GPU                     | Adreno 630                                                                                                                     |
| Memory                  | 6/8 GB RAM                                                                                                                     |
| Shipped Android Version | 9.0                                                                                                                            |
| Storage                 | 128/256 GB                                                                                                                     |
| Battery                 | Non-removable Li-Po 3710 mAh battery                                                                                           |
| Display                 | Optic AMOLED, 1080 x 2340 pixels, 19.5:9 ratio (~403 ppi density)                                                                |
| Camera (Back)           | Dual: 16 MP (f/1.7, 27mm, 1/2.6", 1.22µm, gyro-EIS, OIS) + 20 MP (16 MP effective, f/1.7, 1/2.8", 1.0µm), PDAF, dual-LED flash |
| Camera (Front)          | 16 MP (f/2.0, 25mm, 1/3", 1.0µm), gyro-EIS, Auto HDR, 1080p                                                                    |

Copyright 2018 - The LineageOS Project.



## Compile

First download omni-9.0 tree:

```
repo init --depth=1 -u https://github.com/omnirom/android.git -b android-9.0
```
Then add these string to .repo/manifests/remove.xml

```
<remove-project name="platform/bootable/recovery" />
```

Then add these projects to .repo/local_manifests/roomservice.xml (If you don't have it, you can add them to .repo/manifest.xml): 

```xml
<project name="mauronofrio/android_device_oneplus_fajita" path="device/oneplus/fajita" remote="github" revision="android-9.0" />
<project name="android_bootable_recovery" path="bootable/recovery" remote="omnirom" revision="android-9.0" />
<project name="android_external_busybox" path="external/busybox" remote="TeamWin" revision="android-9.0" />
```

Now you can sync your source:

```
repo sync
```

If you want to exclude twrp app you need of this commit: https://gerrit.omnirom.org/#/c/android_bootable_recovery/+/27694/

Now you need of this patch to make decryption working: https://gist.github.com/mauronofrio/af29bad34ad87a1a957d193794f0bf5f


To make all works you need to modify the buildinfo.sh in build/tools
echo "ro.build.version.release=$PLATFORM_VERSION"
echo "ro.build.version.security_patch=$PLATFORM_SECURITY_PATCH"
to
echo "ro.build.version.release_orig=$PLATFORM_VERSION"
echo "ro.build.version.security_patch_orig=$PLATFORM_SECURITY_PATCH"

And you need to increase the PLATFORM_VERSION to 16.1.0 in build/core/version_defaults.mk to override Google's anti-rollback features (This actually i don't know if is always needed)

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_fajita-eng 
mka adbd recoveryimage 
```

To test it:

```
fastboot boot out/target/product/fajita/recovery.img
```
## Thanks
