# brand
PRODUCT_BRAND ?= AOSP

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=3

# selinux dialog
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1

# Disable multithreaded dexopt by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.multithread=false

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Installer
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/aosp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

# main packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    Camera \
    Development \
    CMFileManager \
    Galaxy4 \
    HoloSpiralWallpaper \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    LockClock \
    MagicSmokeWallpapers \
    NoiseField \
    OmniSwitch \
    PhaseBeam \
    PhotoPhase \
    PhotoTable \
    SoundRecorder \
    Superuser \
    su \
    Torch \
    VisualizationWallpapers \
    VoicePlus \
    libemoji

else
    #CAF MusicFX
    PRODUCT_PACKAGES += \
        MusicFX
endif

# Screen recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

PRODUCT_PACKAGES += \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    nano \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# themes
include vendor/aosp/config/theme_chooser.mk

# korean
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/sysinit:system/bin/sysinit

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/aosp/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/aosp/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/aosp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# nfc
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/com.carbon.android.xml:system/etc/permissions/com.carbon.android.xml \
    vendor/aosp/config/permissions/com.carbon.nfc.enhanced.xml:system/etc/permissions/com.carbon.nfc.enhanced.xml

#

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

# Audio
$(call inherit-product-if-exists, frameworks/base/data/sounds/OldAudio.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/NewAudio.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackageNewWave.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage8.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage9.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage10.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage11.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage12.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage12_48.mk)
