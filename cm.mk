# boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
TARGET_CONTINUOUS_SPLASH_ENABLED := true

# Inherit some common CM stuff.
$(call inherit-product, device/huawei/viva/device.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := viva
PRODUCT_NAME := cm_viva
PRODUCT_RELEASE_NAME := U9200
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9200
PRODUCT_MANUFACTURER := Huawei

ifneq ($(CM_BUILDTYPE),UNOFFICIAL)
    CM_BUILDTYPE := ShevT
    CM_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(CM_BUILDTYPE)-$(CM_BUILD)$(CM_EXTRAVERSION)
endif
