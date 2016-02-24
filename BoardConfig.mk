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

# inherit from omap4
-include hardware/ti/huawei-omap4/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/huawei/front/BoardConfigVendor.mk

BOARD_HARDWARE_CLASS := $(OMAP4_NEXT_FOLDER)/cmhw/

# Camera
TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 2
#TI_CAMERAHAL_DEBUG_ENABLED := true

# OMX buffer reallocate
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# Apply the compass filter
BOARD_INVENSENSE_APPLY_COMPASS_NOISE_FILTER := true

# Platform
TARGET_BOARD_OMAP_CPU := 4460
TARGET_BOOTLOADER_BOARD_NAME := front
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

# For RIL
TARGET_NEEDS_BIONIC_MD5 := true

# Webkit
ENABLE_WEBGL := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
USE_LEGACY_AUDIO_POLICY := 1
CONVERT_AUDIO_DEVICES := true
BUILD_AUDIO_HW_WRAPPER := true
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true

# Graphics
BOARD_EGL_CFG := $(COMMON_FOLDER)/configs/egl/egl.cfg
USE_OPENGL_RENDERER := true
# As in the kernel (2)
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

BOARD_USE_TI_DUCATI_H264_PROFILE := true

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# External SGX Module
SGX_MODULES:
	make clean -C $(HARDWARE_TI_OMAP4_BASE)/pvr-source/eurasiacon/build/linux2/omap4430_android
	cp $(TARGET_KERNEL_SOURCE)/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make -j8 -C $(HARDWARE_TI_OMAP4_BASE)/pvr-source/eurasiacon/build/linux2/omap4430_android ARCH=arm KERNEL_CROSS_COMPILE=arm-eabi- CROSS_COMPILE=arm-eabi- KERNELDIR=$(KERNEL_OUT) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=540
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx540_120.ko $(KERNEL_MODULES_OUT)
	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/pvrsrvkm_sgx540_120.ko

TARGET_KERNEL_MODULES += SGX_MODULES

# Kernel/Ramdisk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := front_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/front
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/../../linaro-4.9/bin/
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

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

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"

# Charger/Healthd
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# fix this up by examining /proc/partitions on a running device. (value * 1024)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
# 6329204736 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6329188352
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(COMMON_FOLDER)/sepolicy

BOARD_SEPOLICY_UNION += \
    akmd8975.te \
    bluetooth.te \
    debuggerd.te \
    device.te \
    domain.te \
    file_contexts \
    file.te \
    genfs_contexts \
    gpsd.te \
    imcdownload_app.te \
    init.te \
    injection_nv.te \
    kernel.te \
    mediaserver.te \
    netd.te \
    postinit.te \
    pvrsrvinit.te \
    rild.te \
    servicemanager.te \
    setup_fs.te \
    shell.te \
    smc_pa.te \
    system_app.te \
    system_server.te \
    uim_sysfs.te \
    untrusted_app.te \
    wpa_supplicant.te \
    zygote.te

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(COMMON_FOLDER)/rootdir/fstab.front
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_RECOVERY_SWIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_PREBUILT_RECOVERY_KERNEL := $(COMMON_FOLDER)/recovery/recovery_kernel
