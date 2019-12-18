#!/bin/sh -e
#
# Script used to setup and run virtualhere
echo '*** Listing all usb-devices. Use this list to adjust AllowedDevices in config.ini ...'
lsusb || echo 'Execution of command lsusb failed. Make sure you have access to USB-Devices on the host.'

cd data

echo '*** Deleting previous bus_usb_*-files from data directory ...'
find . -name '*bus_usb_*' -delete
echo '*** Checking for new version of VirtualHere ...'
wget -N http://www.virtualhere.com/sites/default/files/usbserver/vhusbdarm || echo 'Checking for remote copy of VirtualHere failed'

chmod +x ./vhusbdarm
./vhusbdarm

exit 0
