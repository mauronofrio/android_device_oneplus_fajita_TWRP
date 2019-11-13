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
<project name="mauronofrio/android_bootable_recovery" path="bootable/recovery" remote="github" revision="android-9.0" />
<project name="android_external_busybox" path="external/busybox" remote="TeamWin" revision="android-9.0" />
```

Now you can sync your source:

```
repo sync
```
Actually i'm using this bootable/recovery: https://github.com/mauronofrio/android_bootable_recovery

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

Kernel Source: https://github.com/pappschlumpf/op6/tree/9.0
## Credits
I want to say a big thanks to @twinnfamous
