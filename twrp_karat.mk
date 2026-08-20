#
# Copyright (C) 2026 The Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_RELEASE_NAME := karat
PRODUCT_DEVICE := karat
PRODUCT_NAME := twrp_karat
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := Fire TV Stick 4K
PRODUCT_MANUFACTURER := Amazon

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=karat \
    PRODUCT_NAME=karat
