#!/bin/sh

# Do a root check
if [ $(id -u) -ne 0 ]; then echo "This script must be run as root.";exit 99;fi


# Disable installation of recommended and suggested packages
echo "APT::Install-Recommends "0";
APT::Install-Suggests "0";" > /etc/apt/apt.conf


# Mark everything as automatically installed
apt-mark showmanual | xargs apt-mark auto


# Update the package sources and do a full upgrade
apt-get update
apt-get dist-upgrade -y


# Install the base system
apt-get install -y alsa-base alsa-utils anacron apparmor apparmor-profiles apparmor-utils avahi-autoipd avahi-daemon avahi-utils bash bash-completion command-not-found coreutils friendly-recovery grub-pc iputils-arping iputils-ping irqbalance libnss-mdns libpam-cap linux-image-generic manpages mlocate nano network-manager openssh-server pm-utils ubuntu-keyring ubuntu-minimal ubuntu-standard wireless-tools x11-xserver-utils xserver-xorg xserver-xorg-core xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-vesa


# Install Unity
apt-get install -y activity-log-manager appmenu-qt appmenu-qt5 compizconfig-settings-manager dmz-cursor-theme hud indicator-application indicator-appmenu indicator-messages indicator-printers indicator-session language-selector-gnome light-themes lightdm notify-osd notify-osd-icons overlay-scrollbar plymouth-theme-ubuntu-logo sni-qt ubuntu-docs ubuntu-mono ubuntu-session ubuntu-settings ubuntu-wallpapers unity unity-control-center unity-greeter unity-gtk2-module unity-gtk3-module unity-lens-applications unity-lens-files unity-settings-daemon


# Install GNOME applications
apt-get install -y dconf-editor eog evince gedit gnome-calculator gnome-icon-theme-full gnome-keyring gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gnome-user-guide gvfs-backends gvfs-fuse libgnome2-bin libgsf-bin libgtk2-perl libgtkspell0 libpam-gnome-keyring mesa-utils nautilus nautilus-open-terminal network-manager-gnome policykit-desktop-privileges seahorse ssh-askpass-gnome xdg-user-dirs


# Install fonts
apt-get install -y fonts-cantarell fonts-croscore fonts-crosextra-caladea fonts-crosextra-carlito fonts-droid fonts-dustin gnome-font-viewer gsfonts-x11 gucharmap ttf-ancient-fonts ttf-ubuntu-font-family xfonts-base


# Install package management
apt-get install -y apt-xapian-index gdebi-core software-properties-gtk synaptic update-manager update-notifier


# Install file/disk tools
apt-get install -y baobab bzip2 exfat-fuse exfat-utils file-roller gnome-disk-utility gzip iotop ntfs-3g preload tar unrar unzip zip


# Install Python
apt-get install -y python-appindicator python-crypto python-gnomekeyring python-openssl python-pyasn1


# Install printers and scanners
apt-get install -y cups cups-browsed cups-bsd cups-pk-helper foomatic-db-compressed-ppds foomatic-db-engine openprinting-ppds simple-scan system-config-printer-gnome


# Install audio
apt-get install -y gstreamer1.0-alsa gstreamer1.0-libav gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio pulseaudio pulseaudio-module-x11 pulseaudio-utils rtkit


# Install browsers, e-mail, chat, and web tools
apt-get install -y enigmail firefox gajim iftop nethogs thunderbird thunderbird-gnome-support traceroute


# Install multimedia
apt-get install -y brasero brasero-cdrkit cdrdao dvdauthor ffmpegthumbnailer flac libav-tools vlc vlc-plugin-notify vlc-plugin-pulse vorbis-tools

/usr/share/doc/libdvdread4/install-css.sh


# Install LibreOffice
add-apt-repository ppa:libreoffice/ppa
apt-get update
apt-get install -y libreoffice-avmedia-backend-gstreamer libreoffice-calc libreoffice-draw libreoffice-gtk libreoffice-impress libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-sifr libreoffice-templates libreoffice-writer


# Install graphical tools
apt-get install -y gimp


# Install language packs
apt-get install -y firefox-locale-nl language-pack-gnome-nl libreoffice-l10n-nl myspell-en-us myspell-nl thunderbird-locale-nl


# Install hardware-specific tools
apt-get install -y ecryptfs-utils i965-va-driver lm-sensors


# Install games
apt-get install -y aisleriot branding-ubuntu gnome-cards-data gnome-mahjongg


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
