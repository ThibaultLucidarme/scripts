#!/bin/sh

# Log in as the LightDM user account
sudo xhost +SI:localuser:lightdm
sudo su lightdm -s /bin/bash

# Disable NetworkManager popups
gsettings set org.gnome.nm-applet disable-connected-notifications true
gsettings set org.gnome.nm-applet disable-disconnected-notifications true
gsettings set org.gnome.nm-applet disable-vpn-notifications true
gsettings set org.gnome.nm-applet suppress-wireless-networks-available true

# Clean up
exit
sudo rm /var/lib/lightdm/.bash_history
