#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_DEVICE_LIB="/data/local/tmp"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

# Install so
echo "----------Uninstall so--------------"
for S in libiconv.so libxml2.so libplist.so libplist++.so libusb.so libusbmuxd.so libcrypto.so libssl.so libimobiledevice.so libzip.so
do
  adb shell rm "$PATH_DEVICE_LIB/$S"
done


# Install binary
echo "----------Uninstall binary--------------"
for B in listdevs openssl usbmuxdd ideviceid ideviceinfo idevicedate idevicediagnostics idevicescreenshot idevicesyslog ideviceinstaller ifuse fusermount
do
  adb shell rm "$PATH_DEVICE_LIB/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"


echo "----------ls $PATH_DEVICE_LIB--------------"
adb shell su -c "ls $PATH_DEVICE_LIB"

echo "----------list usb devs--------------"
adb shell su -c "listdevs"