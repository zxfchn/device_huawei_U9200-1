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

DEVICE_PATH := device/huawei/front
VENDOR_DIR := vendor/huawei/front/proprietary

# inherit from the proprietary version
-include vendor/huawei/front/BoardConfigVendor.mk
# inherit from omap4
-include hardware/ti/huawei-omap4/BoardConfigCommon.mk
# inherit from common
-include device/huawei/omap4-common/BoardConfigCommon.mk

BOARD_HARDWARE_CLASS := $(OMAP4_NEXT_FOLDER)/cmhw/

# Platform
TARGET_BOOTLOADER_BOARD_NAME := front

# Kernel/Ramdisk
TARGET_KERNEL_CONFIG := front_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/front

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(DEVICE_PATH)/bluetooth/vnd_front.txt

# fix this up by examining /proc/partitions on a running device. (value * 1024)
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
# 6329204736 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6329188352

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

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
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.front
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_RECOVERY_SWIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
