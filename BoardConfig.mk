#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_CMDLINE += skip_override androidboot.fastboot=1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_PREBUILT_KERNEL := device/oneplus/fajita/prebuilt/Image.gz-dtb

# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630
QCOM_BOARD_PLATFORMS += sdm845

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2998927360
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 118112366592
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := device/oneplus/fajita/recovery.wipe
TARGET_RECOVERY_FSTAB := device/oneplus/fajita/recovery.fstab

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP specific build flags
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
AB_OTA_UPDATER := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 1023
TW_DEFAULT_BRIGHTNESS := 420
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_THEME := portrait_hdpi
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    vbmeta \
    dtbo 

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# Extras
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_LEDS_HAPTICS := true
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := device/oneplus/fajita/installer
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_USB_STORAGE := true
PLATFORM_VERSION := 16.1.0