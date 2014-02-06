#
# Copyright (C) 2007 The Android Open Source Project
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

# Base configuration for communication-oriented android devices
# (phones, tablets, etc.).  If you want a change to apply to ALL
# devices (including non-phones and non-tablets), modify
# core_minimal.mk instead.

PRODUCT_PROPERTY_OVERRIDES := \
    ro.config.notification_sound=OnTheHunt.ogg \
    ro.config.alarm_alert=Alarm_Classic.ogg \

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3

PRODUCT_PACKAGES += \
    BasicDreams \
    Browser \
    Contacts \
    ContactsProvider \
    DefaultContainerService \
    Home \
    KeyChain \
    PicoTts \
    SharedStorageBackup \
    Superuser \
    TelephonyProvider \
    UserDictionaryProvider \
    VpnDialogs \
    atrace \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mke2fs \
    libandroidfw \
    libaudiopreprocessing \
    libaudioutils \
    libbcc \
    libfilterpack_imageproc \
    libgabi++ \
    libkeystore \
    libmdnssd \
    libnfc_ndef \
    libportable \
    libpowermanager \
    libspeexresampler \
    libstagefright_chromium_http \
    libstagefright_soft_aacdec \
    libstagefright_soft_aacenc \
    libstagefright_soft_amrdec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_flacenc \
    libstagefright_soft_g711dec \
    libstagefright_soft_gsmdec \
    libstagefright_soft_h264dec \
    libstagefright_soft_h264enc \
    libstagefright_soft_mp3dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_mpeg4enc \
    libstagefright_soft_rawdec \
    libstagefright_soft_vorbisdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_vpxenc \
    libvariablespeed \
    libwebrtc_audio_preprocessing \
    mdnsd \
    mms-common \
    requestsync \
    su \
    telephony-common \
    voip-common

# host-only dependencies
ifeq ($(WITH_HOST_DALVIK),true)
    PRODUCT_PACKAGES += \
        apache-xml-hostdex \
        bouncycastle-hostdex \
        core-hostdex \
        libcrypto \
        libexpat \
        libicui18n \
        libicuuc \
        libjavacore \
        libssl \
        libz-host \
        dalvik
endif

#SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.superuser

# CM-specific init file
PRODUCT_COPY_FILES += \
    etc/init.local.rc:root/init.cm.rc

# init.d support
PRODUCT_COPY_FILES += \
    vendor/spege/prebuilt/common/bin/sysinit:system/bin/sysinit

# World APN list
PRODUCT_COPY_FILES += \
    etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    etc/spn-conf.xml:system/etc/spn-conf.xml


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

