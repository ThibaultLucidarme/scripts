#!/bin/sh

# Do a root check

if [ $(id -u) -ne 0 ]; then echo "This script must be run as root."; exit 99; fi


# Disable installation of recommended and suggested packages

echo "APT::Install-Recommends "0";
APT::Install-Suggests "0";" > /etc/apt/apt.conf


# Mark everything as automatically installed

apt-mark showmanual | xargs apt-mark auto


# Update the package sources and do a full upgrade

apt-get update
apt-get dist-upgrade -y


# Install the base system

apt-get install -y alsa-base alsa-utils anacron apparmor apparmor-profiles apparmor-utils avahi-autoipd avahi-daemon avahi-utils bash-completion friendly-recovery grub-pc irqbalance libnss-mdns libpam-cap linux-image-generic manpages mlocate nano network-manager pm-utils rfkill rtkit ubuntu-keyring ubuntu-minimal ubuntu-standard wireless-tools x11-xserver-utils xserver-xorg xserver-xorg-core xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-input-wacom xserver-xorg-video-ati xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-modesetting xserver-xorg-video-nouveau xserver-xorg-video-vesa


# Install Unity

apt-get install -y activity-log-manager appmenu-qt appmenu-qt5 dmz-cursor-theme hud indicator-application indicator-appmenu indicator-messages indicator-printers indicator-session language-selector-gnome lightdm light-themes notify-osd notify-osd-icons overlay-scrollbar plymouth-theme-ubuntu-logo sni-qt ubuntu-docs ubuntu-mono ubuntu-session ubuntu-settings ubuntu-system-service ubuntu-wallpapers unity unity-control-center unity-greeter unity-gtk2-module unity-gtk3-module unity-lens-applications unity-lens-files unity-settings-daemon zeitgeist


# Install GNOME applications

apt-get install -y dconf-cli dconf-editor eog evince file-roller gedit gnome-calculator gnome-keyring gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gnome-user-guide gvfs-backends gvfs-fuse libgnome2-bin libgsf-bin libgtk2-perl libpam-gnome-keyring nautilus nautilus-open-terminal network-manager-gnome policykit-1-gnome policykit-desktop-privileges seahorse ssh-askpass-gnome xdg-user-dirs


# Install fonts

apt-get install -y fonts-cantarell fonts-croscore fonts-crosextra-caladea fonts-crosextra-carlito fonts-dejavu-core fonts-droid fonts-freefont-ttf gsfonts-x11 ttf-ubuntu-font-family xfonts-base


# Install package management

apt-get install -y apt-xapian-index gdebi-core software-properties-gtk synaptic update-manager update-notifier


# Install printers and scanners

apt-get install -y cups cups-pk-helper cups-browsed foomatic-db-compressed-ppds foomatic-db-engine openprinting-ppds simple-scan system-config-printer-gnome system-config-printer-udev


# Install multimedia

apt-get install -y brasero brasero-cdrkit ffmpegthumbnailer gstreamer1.0-alsa gstreamer1.0-libav gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio pulseaudio pulseaudio-module-bluetooth pulseaudio-module-x11 pulseaudio-utils vlc vlc-plugin-notify vlc-plugin-pulse


# Install browser, e-mail, and chat

apt-get install -y firefox pidgin thunderbird thunderbird-gnome-support xul-ext-lightning


# Install LibreOffice

add-apt-repository ppa:libreoffice/ppa
apt-get update

apt-get install -y libreoffice-avmedia-backend-gstreamer libreoffice-calc libreoffice-gtk libreoffice-impress libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-sifr libreoffice-writer


# Automatically remove all unneeded packages

apt-get autoremove -y
apt-get clean


# Purge all remaining configuration files

dpkg -l | grep  ^rc | awk '{print $2}' | xargs dpkg --purge remove


# Clear the network interfaces

echo "auto lo
iface lo inet loopback" > /etc/network/interfaces
