## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := SH-01F

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sharp/sh01f/device_sh01f.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sh01f
PRODUCT_NAME := cm_sh01f
PRODUCT_BRAND := DOCOMO
PRODUCT_MODEL := SH-01F
PRODUCT_MANUFACTURER := SHARP

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=DOCOMO/SH-01F/SH-01F:4.4.2/SA090/02.00.01:user/release-keys \
    PRIVATE_BUILD_DESC="SH-01F-user 4.4.2 SA090 02.00.01 release-key"
