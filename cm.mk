## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := SH-01F

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sharp/sh01f/device_sh01f.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := SH-01F
PRODUCT_NAME := cm_sh01f
PRODUCT_BRAND := DOCOMO
PRODUCT_MODEL := SH-01F
PRODUCT_MANUFACTURER := SHARP
