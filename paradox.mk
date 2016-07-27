$(call inherit-product, device/hp/polaris-common/polaris-common.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
#$(call inherit-product, device/hp/polaris-common/rild/polaris_3gdongle.mk)

# HP serial number, sku & bt_mac
PRODUCT_COPY_FILES += \
	device/hp/redwood/vendor/bt_mac.txt:system/etc/bluetooth/bt_mac.txt \
	device/hp/redwood/vendor/sku.txt:system/vendor/sku.txt \
	device/hp/redwood/vendor/snum.txt:system/vendor/snum.txt \

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/hp/redwood/kernel:kernel \
	device/hp/redwood/modules/modules/nand.ko:root/nand.ko \
	device/hp/redwood/init.sun8i.rc:root/init.sun8i.rc \
	device/hp/redwood/ueventd.sun8i.rc:root/ueventd.sun8i.rc \
	device/hp/redwood/initlogo.rle:root/initlogo.rle  \
	device/hp/redwood/media/bootanimation.zip:system/media/bootanimation.zip \
	device/hp/redwood/fstab.sun8i:root/fstab.sun8i \
	device/hp/redwood/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

#key and tp config file
PRODUCT_COPY_FILES += \
	device/hp/redwood/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
	device/hp/redwood/configs/tp.idc:system/usr/idc/tp.idc \
	device/hp/redwood/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery ramdisk
PRODUCT_COPY_FILES += \
    device/hp/redwood/modules/modules/disp.ko:obj/disp.ko \
    device/hp/redwood/modules/modules/sunxi-keyboard.ko:obj/sunxi-keyboard.ko \
    device/hp/redwood/modules/modules/lcd.ko:obj/lcd.ko \
    device/hp/redwood/modules/modules/gt82x.ko:obj/gt82x.ko \
    device/hp/redwood/modules/modules/gt818_ts.ko:obj/gt818_ts.ko \
    device/hp/redwood/modules/modules/ft5x_ts.ko:obj/ft5x_ts.ko \
    device/hp/redwood/modules/modules/sw-device.ko:obj/sw-device.ko

# ap6476 sdio wifi fw and nvram
$(call inherit-product-if-exists, hardware/broadcom/wlan/firmware/ap6476/device-bcm.mk)

# bplus
PRODUCT_COPY_FILES += \
	device/hp/redwood/ap6476/bplus.default.so:system/lib/hw/bplus.default.so \
	device/hp/redwood/ap6476/gps.default.so:system/lib/hw/gps.default.so \
	device/hp/redwood/ap6476/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	device/hp/redwood/ap6476/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
	device/hp/redwood/ap6476/glgps:system/bin/glgps \
	external/bluetooth/bluedroid/conf/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#vold config
PRODUCT_COPY_FILES += \
	device/hp/redwood/recovery.fstab:recovery.fstab 
# camera
PRODUCT_COPY_FILES += \
	device/hp/redwood/configs/camera.cfg:system/etc/camera.cfg \
	device/hp/redwood/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml 

# camera config for camera detector
PRODUCT_COPY_FILES += \
	device/hp/redwood/hawkview/sensor_list_cfg.ini:system/etc/hawkview/sensor_list_cfg.ini

#add gms features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml 

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	device/hp/polaris-common/rild/ip-down:system/etc/ppp/ip-down \
	device/hp/polaris-common/rild/ip-up:system/etc/ppp/ip-up \
	device/hp/polaris-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/hp/polaris-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/hp/polaris-common/rild/call-pppd:system/xbin/call-pppd \
	device/hp/polaris-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/hp/polaris-common/rild/apns-conf_sdk.xml:system/etc/apns-conf.xml \
	device/hp/polaris-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so
	
#PRODUCT_COPY_FILES += \
#	device/hp/polaris-common/rild/init.3gdongle.rc:root/init.sunxi.3gdongle.rc

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/hp/polaris-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sw.embeded.telephony = false

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=America/Mexico_City \
	persist.sys.language=es \
	persist.sys.country=US

#bluetooth
PRODUCT_PACKAGES += Bluetooth

PRODUCT_PACKAGES += \
	com.broadcom.bt \
	com.broadcom.xml \
	lib-client-api

#GPS Feature
PRODUCT_PACKAGES +=  gps.polaris

# evb logger
PRODUCT_COPY_FILES += \
    device/hp/redwood/tools/logger.sh:system/bin/logger.sh

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.storage_type = emulated \
	persist.sys.usb.config=mtp,adb \
	ro.udisk.lable=Polaris \
	ro.font.scale=1.0 \
	ro.hwa.force=false \
	rw.logger=0 \
	ro.sys.bootfast=true \
	debug.hwc.showfps=0 \
	debug.hwui.render_dirty_regions=false

#for gms
PRODUCT_PROPERTY_OVERRIDES += \
        ro.sys.mutedrm=true \
        ro.adb.secure=0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.product.firmware=v1.0

$(call inherit-product-if-exists, device/hp/redwood/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/hp/redwood/overlay
PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_BRAND  := hp
PRODUCT_NAME   := paradox
PRODUCT_DEVICE := redwood
PRODUCT_MODEL  := HP 7 G2
PRODUCT_MANUFACTURER := Hewlett-Packard

include device/hp/polaris-common/prebuild/google/products/gms_base.mk
