#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2015 ShevT
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

COMMON_FOLDER := device/huawei/front
VENDOR_DIR := vendor/huawei/front/proprietary

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_FOLDER)/include
PRODUCT_VENDOR_KERNEL_HEADERS := $(COMMON_FOLDER)/kernel-headers

# inherit from the proprietary version
-include vendor/huawei/front/BoardConfigVendor.mk

# Camera
USE_CAMERA_STUB := false
BOARD_USES_TI_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += \
    -DREFBASE_JB_MR1_COMPAT_SYMBOLS \
    -DNEEDS_VECTORIMPL_SYMBOLS

# Target arch settings
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := front
TARGET_BOARD_OMAP_CPU := 4460
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# TI Enhancement Settings (Part 1)
OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_MULTIGPU := true
BOARD_USE_TI_ENHANCED_DOMX := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
MR0_AUDIO_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB
USE_LEGACY_AUDIO_POLICY := 1

#HWcomposer
BOARD_USES_HWCOMPOSER := true
BOARD_USE_CUSTOM_HWC := true
BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true
# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# No sync framework for this device...
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Setup custom omap4xxx defines
BOARD_USE_CUSTOM_LIBION := true

# External SGX Module
SGX_MODULES:
	make clean -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android
	cp $(TARGET_KERNEL_SOURCE)/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make -j8 -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android ARCH=arm KERNEL_CROSS_COMPILE=arm-eabi- CROSS_COMPILE=arm-eabi- KERNELDIR=$(KERNEL_OUT) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=540 PLATFORM_VERSION=4.0
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx540_120.ko $(KERNEL_MODULES_OUT)
	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/pvrsrvkm_sgx540_120.ko

TARGET_KERNEL_MODULES += SGX_MODULES

TARGET_TI_HWC_HDMI_DISABLED := true

# TI Enhancement Settings (Part 2)
ifdef BOARD_USE_TI_ENHANCED_DOMX
#   Fix h264 sound/video sync
    BOARD_USE_TI_DUCATI_H264_PROFILE := false

    COMMON_GLOBAL_CFLAGS += -DENHANCED_DOMX
    ENHANCED_DOMX := true
else
    DOMX_PATH := hardware/ti/omap4xxx/domx
endif

ifdef OMAP_ENHANCEMENT
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

ifdef OMAP_ENHANCEMENT_BURST_CAPTURE
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_BURST_CAPTURE
endif

ifdef OMAP_ENHANCEMENT_S3D
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_S3D
endif

ifdef OMAP_ENHANCEMENT_CPCAM
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_CPCAM
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/sdk_addon/ti_omap_addon.mk
endif

ifdef OMAP_ENHANCEMENT_VTC
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_VTC
endif

ifdef USE_ITTIAM_AAC
    COMMON_GLOBAL_CFLAGS += -DUSE_ITTIAM_AAC
endif

ifdef OMAP_ENHANCEMENT_MULTIGPU
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_MULTIGPU
endif

# Kernel/Ramdisk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := front_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/front

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# EGL
USE_OPENGL_RENDERER := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# PowerHAL
TARGET_PROVIDES_POWERHAL := true

# Use a small subset of system fonts to keep image size lower
SMALLER_FONT_FOOTPRINT := true

# Wifi related defines
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_FOLDER)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(COMMON_FOLDER)/bluetooth/vnd_front.txt

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BUILD_FM_RADIO := true

# PIE
TARGET_ENABLE_NON_PIE_SUPPORT := true

# IPV6
USE_IPV6_ROUTE := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"

# fix this up by examining /proc/partitions on a running device. (value * 1024)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
# 6329204736 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6329188352
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Security
BOARD_USES_SECURE_SERVICES := true

# Recovery
RECOVERY_CHARGEMODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_RECOVERY_INITRC := $(COMMON_FOLDER)/recovery/init.rc
TARGET_PREBUILT_RECOVERY_KERNEL := $(COMMON_FOLDER)/recovery/recovery_kernel
TARGET_RECOVERY_FSTAB := $(COMMON_FOLDER)/ramdisk/fstab.front
RECOVERY_FSTAB_VERSION := 2
TARGET_NO_SEPARATE_RECOVERY := true
