#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

COMMON_PATH := device/huawei/front

# This file includes all definitions that apply to ALL front devices, and
# are also specific to front devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/huawei/front/overlay

# Audio Packages
PRODUCT_PACKAGES += \
    libtinyalsa \
    tinycap \
    tinymix \
    tinyplay \
    libaudioutils

# Hardware HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.policy.omap4 \
    audio.hdmi.omap4 \
    audio.primary.omap4

PRODUCT_PACKAGES += \
    libnetcmdiface

# PowerHAL
PRODUCT_PACKAGES += \
    hwcomposer.front \
    libedid \
    libion_ti \
    libstagefrighthw

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.front.rc:root/init.front.rc \
    $(LOCAL_PATH)/ramdisk/init.front.usb.rc:root/init.front.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.front.rc:root/ueventd.front.rc \
    $(LOCAL_PATH)/ramdisk/fstab.front:root/fstab.front

# Utilities
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/rootro:system/bin/rootro \
    $(LOCAL_PATH)/prebuilt/bin/rootrw:system/bin/rootrw \
    $(LOCAL_PATH)/prebuilt/bin/sysro:system/bin/sysro \
    $(LOCAL_PATH)/prebuilt/bin/sysrw:system/bin/sysrw \
    $(LOCAL_PATH)/prebuilt/etc/utils/optimizedb:system/etc/utils/optimizedb \
    $(LOCAL_PATH)/prebuilt/etc/utils/optimizestorage:system/etc/utils/optimizestorage \
    $(LOCAL_PATH)/prebuilt/etc/init.d/10sysctl:system/etc/init.d/10sysctl \
    $(LOCAL_PATH)/prebuilt/etc/sysctl:system/etc/sysctl \
    $(LOCAL_PATH)/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# Media / Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/huawei/audio/cm_front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
    $(LOCAL_PATH)/audio/huawei/audio/cm_front_audio_config.conf:system/etc/huawei/audio/pac_front_audio_config.conf \
    $(LOCAL_PATH)/audio/huawei/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
    $(LOCAL_PATH)/audio/huawei/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/BCM4330B1.hcd:system/etc/bluetooth/BCM4330B1.hcd \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Common
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck \
    l2ping \
    com.android.future.usb.accessory

# Key maps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(LOCAL_PATH)/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(LOCAL_PATH)/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(LOCAL_PATH)/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# Replace Bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Ghost Commander
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/app/com.ghostsq.commander.apk:system/app/com.ghostsq.commander.apk \
    $(LOCAL_PATH)/prebuilt/app/GhostCommander-GoogleDrive_plugin.apk:system/app/GhostCommander-GoogleDrive_plugin.apk \
    $(LOCAL_PATH)/prebuilt/app/GhostCommander-Samba_plugin.apk:system/app/GhostCommander-Samba_plugin.apk \
    $(LOCAL_PATH)/prebuilt/app/com.ghostsq.commander.sftp.apk:system/app/com.ghostsq.commander.sftp.apk

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

#Lib Skia test
PRODUCT_PACKAGES += \
    SkLibTiJpeg_Test

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    persist.sys.root_access=3

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# Regional
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale.language=ru \
    ro.product.locale.region=RU \
    ro.com.android.dateformat=dd-MM-yyyy \
    persist.sys.timezone=Europe/Moscow

# Default ringtones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Plennica.mp3 \
    ro.config.notification_sound=Car_Lock.ogg \
    ro.config.alarm_alert=dream_is_over.ogg

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=1 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0

# Here crashes gallery
# if ro.build.display.id is such "cm_front-userdebug 4.2.2 JDQ39E eng.shev.20130805.153138 test-keys" then gellry crashshshsh
# as well - does not crash
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=KVT49L-ShevT

PRODUCT_TAGS                 += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS      := default
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=$(shell date +"%s")
PRODUCT_AAPT_CONFIG          := hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG     := xhdpi
PRODUCT_LOCALES              += en_US xhdpi
BOARD_WLAN_DEVICE_REV        := bcm4330_b1
WIFI_BAND                    := 802_11_ABG
