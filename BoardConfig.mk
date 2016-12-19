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

COMMON_FOLDER := device/huawei/omap4-common
VENDOR_DIR := vendor/huawei/viva/proprietary

# inherit from the proprietary version
-include vendor/huawei/viva/BoardConfigVendor.mk
# inherit from omap4
-include hardware/ti/huawei-omap4/BoardConfigCommon.mk
# inherit from common
-include $(COMMON_FOLDER)/BoardConfigCommon.mk
# inherit from viva common
-include $(COMMON_FOLDER)/viva-common/BoardConfigCommon.mk

BOARD_HARDWARE_CLASS := $(OMAP4_NEXT_FOLDER)/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy-cm

BOARD_SEPOLICY_UNION += \
    untrusted_app-cm.te
