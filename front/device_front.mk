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

# overlay
DEVICE_PACKAGE_OVERLAYS := device/huawei/front/overlay

# vendor
$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

#Camera
PRODUCT_PACKAGES += \
        Camera

# PowerHAL
PRODUCT_PACKAGES += \
	power.front \
	hwcomposer.front \
	audio.primary.front \
	libion_ti

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/fstab.front:root/fstab.front \
	$(LOCAL_PATH)/ramdisk/init:root/init \
	$(LOCAL_PATH)/ramdisk/init.front.rc:root/init.front.rc \
	$(LOCAL_PATH)/ramdisk/init.front.usb.rc:root/init.front.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.front.rc:root/ueventd.front.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc

# Media / Audio -готово
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/audio/es305img.bin:system/etc/es305img.bin \
	$(LOCAL_PATH)/audio/huawei/audio/cm_front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
	$(LOCAL_PATH)/audio/huawei/audio/cm_front_audio_config.conf:system/etc/huawei/audio/pac_front_audio_config.conf \
	$(LOCAL_PATH)/audio/huawei/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
	$(LOCAL_PATH)/audio/huawei/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf \
	$(LOCAL_PATH)/audio/huawei/audio/U9500_audio_config.conf:system/etc/huawei/audio/U9500_audio_config.conf \
	$(LOCAL_PATH)/audio/huawei/audio/U9500_factory_audio_config.conf:system/etc/huawei/audio/U9500_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# BT
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/BCM4330B1.hcd:system/etc/bluetooth/BCM4330B1.hcd \
	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Vold
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

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

# Audio Packages
PRODUCT_PACKAGES += \
	audio.usb.default \
	libtinyalsa \
	tinycap \
	tinymix \
	tinyplay \
	tinurec \
	libaudioutils \
	audio.a2dp.default

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs \
	libnetcmdiface

#Lib Skia test
PRODUCT_PACKAGES += \
	SkLibTiJpeg_Test

# Torch
PRODUCT_PACKAGES += \
        Torch

# BT
#PRODUCT_PACKAGES += \
#    uim-sysfs \
#    libbt-vendor

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Common
PRODUCT_PACKAGES += \
	l2ping \
	com.android.future.usb.accessory \
        mischelp \
        libinvensense_mpl

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

#Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapstartsize=32m \
	dalvik.vm.heapgrowthlimit=64m \
	dalvik.vm.heapsize=384m \
	dalvik.vm.heaputilization=0.25 \
	dalvik.vm.heapidealfree=8388608 \
	dalvik.vm.heapconcurrentstart=2097152 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	dalvik.vm.verify_bytecode=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1 \
	ro.product.board=U9500 \
	ro.product.locale.language=ru \
	ro.product.locale.region=RU

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.secure=0 \
        ro.allow.mock.location=1 \
        persist.sys.usb.config=modem,nmea,mass_storage,adb,diag \
        ro.adb.secure=0 \
        ro.debuggable=1

PRODUCT_CHARACTERISTICS := default

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
###PRODUCT_LOCALES += en_US hdpi
BOARD_WLAN_DEVICE_REV := bcm4330_b1
WIFI_BAND             := 802_11_ABG
