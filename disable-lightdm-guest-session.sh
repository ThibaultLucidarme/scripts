#!/bin/sh

# Do a root check
if [ $(id -u) -ne 0 ]; then echo "This script must be run as root."; exit 99; fi

# Disable LightDM guest session
mkdir /etc/lightdm/lightdm.conf.d/
echo "[SeatDefaults]
allow-guest=false" > /etc/lightdm/lightdm.conf.d/20-guest.conf
