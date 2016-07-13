$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/sharp/sh01f/sh01f-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
  $(LOCAL_PATH)/root/init.sharp.usb.rc:root/init.sharp.usb.rc \
  $(LOCAL_PATH)/root/init.sharp.usb.rc:root/init.recovery.usb.rc \
  $(LOCAL_PATH)/root/fstab.qcom:root/fstab.qcom \

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/system/usr/idc/shtps_key.idc:system/usr/idc/shtps_key.idc \
  $(LOCAL_PATH)/system/usr/idc/shtps_rmi.idc:system/usr/idc/shtps_rmi.idc \
  $(LOCAL_PATH)/system/usr/idc/shcts_key.idc:system/usr/idc/shcts_key.idc \
  $(LOCAL_PATH)/system/usr/idc/SH_gpio-keys.idc:system/usr/idc/SH_gpio-keys.idc \
  $(LOCAL_PATH)/system/usr/idc/Headset.idc:system/usr/idc/Headset.idc \
  $(LOCAL_PATH)/system/usr/idc/pmic8xxx_pwrkey.idc:system/usr/idc/pmic8xxx_pwrkey.idc \
  $(LOCAL_PATH)/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
  $(LOCAL_PATH)/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_sh01f
PRODUCT_DEVICE := sh01f

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8974

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Camera
PRODUCT_PACKAGES += \
    camera.qcom \
    CameraWorkaround

PRODUCT_PACKAGES += \
    libcutilz

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Ion
PRODUCT_PACKAGES += \
    libion

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974


# Media
PRODUCT_PACKAGES += \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw


# Power
PRODUCT_PACKAGES += \
    power.qcom

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.perf.cores_online=2 \
    ro.vendor.extension_library=libqti-perfd-client.so

# Recovery
PRODUCT_PACKAGES += \
    keycheck

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyRIL

# Thermal management
PRODUCT_PACKAGES += \
    thermanager

# USB OTG
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Include non-opensource parts
$(call inherit-product, vendor/sharp/sh01f/sh01f-vendor.mk)

