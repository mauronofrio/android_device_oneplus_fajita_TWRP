# android_device_oneplus_dumpling
Tree for building TWRP for OnePlus 5T

## Kernel Sources

https://github.com/lineageos/android_kernel_oneplus_msm8998/tree/lineage-15.1

## To compile

export ALLOW_MISSING_DEPENDENCIES=true

. build/envsetup.sh && lunch omni_dumpling-eng

mka adbd recoveryimage

## Device specifications

| Device       | OnePlus 5T                                      |
| -----------: | :---------------------------------------------- |
| SoC          | Qualcomm MSM8998 Snapdragon 835                 |
| CPU          | Quad-core 2.45GHz Kryo & quad-core 1.9GHz Kryo  |
| GPU          | 710MHz Adreno 540                               |
| Memory       | 6GB / 8GM RAM (LPDDR4X)                         |
| Shipped Android version | 7.1.1                                |
| Storage      | 64GB / 128GB (UFS 2.1 2-LANE Flash)             |
| Battery      | Non-removable Li-Po 3300 mAh                    |
| Dimensions   | 152.7 x 74.1 x 7.25 mm                          |
| Display      | 2160 x 1080 (18:9), 6 inch                      |
| Rear camera 1 | 16MP (IMX 398), 1.12-micron pixels, f/1.7 Dual LED flash, 4K 30 fps, 1080p 60 fps, 720p 120 fps video |
| Rear camera 2 | 20MP (IMX 376k), 1-micron pixels, f/1.7        |
| Front camera | 16MP (IMX 371), 1-micron pixels, f/2.0 1080p 30 fps video |

## Device picture

![OnePlus 5T](https://image01.oneplus.net/shop/201711/16/1850/c2baf281695709898707dd551a05274c_260_0.png "OnePlus 5T in black")
