#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2016 ShevT
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

LOCAL_PATH := device/huawei/front
DEVCOMMON_PATH := device/huawei/omap4-common

$(call inherit-product, vendor/huawei/front/front-vendor.mk)
$(call inherit-product, hardware/ti/huawei-omap4/omap4.mk)
$(call inherit-product, $(DEVCOMMON_PATH)/device-common.mk)
$(call inherit-product, $(DEVCOMMON_PATH)/device-common_cm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(DEVCOMMON_PATH)/overlay/cm

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.front.rc:root/init.front.rc \
    $(LOCAL_PATH)/rootdir/init.front.usb.rc:root/init.front.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.front.rc:root/ueventd.front.rc \
    $(LOCAL_PATH)/rootdir/fstab.front:root/fstab.front

# Media / Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
    $(LOCAL_PATH)/configs/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
    $(LOCAL_PATH)/configs/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf

# Post init script
PRODUCT_PACKAGES += \
    post-init.sh

# supolicy
PRODUCT_PACKAGES += \
    supolicy \
    libsupol.so

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_gps=47511

# LCD density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
