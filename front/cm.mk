# Inherit device configuration for ALL front
$(call inherit-product, device/huawei/front/device_front.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration for front gsm
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := front

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := front
PRODUCT_NAME := cm_front
PRODUCT_RELEASE_NAME := U9500
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9500
PRODUCT_MANUFACTURER := Huawei

ifneq ($(CM_BUILDTYPE),UNOFFICIAL)
    CM_BUILDTYPE := ShevT
    CM_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(CM_BUILDTYPE)-$(CM_BUILD)$(CM_EXTRAVERSION)
endif
