#!/bin/sh

# Do a root check

if [ $(id -u) -ne 0 ]; then echo "This script must be run as root.";exit 99;fi


# Mark everything as automatically installed

apt-mark showmanual | xargs apt-mark auto


# Update the package sources and do a full upgrade

apt-get update
apt-get dist-upgrade -y


# Install the base system

apt-get install -y acpi-support alsa-base apparmor apparmor-profiles apparmor-utils avahi-autoipd avahi-daemon avahi-utils grub-pc linux-image-generic network-manager pm-utils ubuntu-minimal ubuntu-standard x11-xserver-utils xserver-xorg xserver-xorg-core xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-input-wacom xserver-xorg-video-ati xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-nouveau xserver-xorg-video-vesa


# Install Unity

apt-get install -y activity-log-manager branding-ubuntu dmz-cursor-theme language-selector-gnome lightdm notify-osd overlay-scrollbar plymouth-theme-ubuntu-logo sni-qt ubuntu-artwork ubuntu-docs ubuntu-minimal ubuntu-session ubuntu-settings ubuntu-standard ubuntu-wallpapers unity unity-control-center unity-settings-daemon zeitgeist


# Install GNOME applications

apt-get install -y baobab dconf-editor eog evince file-roller gedit gnome-calculator gnome-disk-utility gnome-font-viewer gnome-keyring gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gnome-user-guide gucharmap libgnome2-bin libgsf-bin libgtk2-perl libxss1 nautilus nautilus-open-terminal network-manager-gnome policykit-desktop-privileges seahorse ssh-askpass-gnome xdg-user-dirs


# Install fonts

apt-get install -y fonts-croscore fonts-crosextra-caladea fonts-crosextra-carlito fonts-droid gsfonts-x11 ttf-ancient-fonts ttf-ubuntu-font-family xfonts-base


# Install package management

apt-get install -y apturl gdebi-core software-center update-manager update-notifier


# Install printers and scanners

apt-get install -y cups foomatic-db-compressed-ppds foomatic-db-engine hplip openprinting-ppds printer-driver-c2esp printer-driver-foo2zjs printer-driver-gutenprint printer-driver-hpcups printer-driver-hpijs printer-driver-m2300w printer-driver-min12xxw printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-ptouch printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix simple-scan


# Install audio

apt-get install -y gstreamer1.0-alsa gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio pulseaudio pulseaudio-module-bluetooth


# Install browsers, e-mail, and chat

apt-get install -y chromium-browser firefox pidgin thunderbird thunderbird-gnome-support xul-ext-lightning


# Install multimedia

apt-get install -y brasero ffmpegthumbnailer rhythmbox vlc

/usr/share/doc/libdvdread4/install-css.sh


# Install LibreOffice

add-apt-repository ppa:libreoffice/ppa
apt-get update

apt-get install -y libreoffice-avmedia-backend-gstreamer libreoffice-calc libreoffice-draw libreoffice-gtk libreoffice-impress libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-sifr libreoffice-writer


# Install graphical tools

apt-get install -y calibre gimp shotwell


# Install language packs

apt-get install -y chromium-browser-l10n firefox-locale-nl language-pack-gnome-nl libreoffice-l10n-nl myspell-de-de myspell-en-us myspell-fr myspell-nl thunderbird-locale-nl


# Install games

apt-get install -y aisleriot gnome-mahjongg gnome-mines


# Install (semi-)proprietary stuff

apt-get install -y exfat-fuse exfat-utils network-manager-pptp-gnome ntfs-3g remmina unrar


# Update locales

dpkg-reconfigure locales
locale-gen


# Automatically remove all unneeded packages

apt-get autoremove -y
apt-get clean


# Purge all remaining configuration files

dpkg -l | grep  ^rc | awk '{print $2}' | xargs dpkg --purge remove


# Disable guest session

mkdir /etc/lightdm/lightdm.conf.d/

echo "[SeatDefaults]
allow-guest=false" > /etc/lightdm/lightdm.conf.d/20-guest.conf


# Clear the network interfaces

echo "# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback" > /etc/network/interfaces
