#!/bin/sh

# Do a root check

if [ $(id -u) -ne 0 ]; then echo "This script must be run as root.";exit 99;fi


# Mark everything as automatically installed

apt-mark showmanual | xargs apt-mark auto


# Update the package sources and do a full upgrade

apt-get update
apt-get dist-upgrade -y


# Install the base system

apt-get install -y acpi-support alsa-base alsa-utils anacron apparmor apparmor-profiles apparmor-utils avahi-autoipd avahi-daemon avahi-utils bash bash-completion coreutils friendly-recovery grub-pc irqbalance libnss-mdns libpam-cap linux-image-generic manpages network-manager pm-utils ubuntu-keyring ubuntu-minimal ubuntu-standard wireless-tools x11-xserver-utils xserver-xorg xserver-xorg-core xserver-xorg-input-evdev xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-modesetting xserver-xorg-video-vesa


# Install Unity

apt-get install -y activity-log-manager appmenu-qt appmenu-qt5 compizconfig-settings-manager dmz-cursor-theme hud indicator-application indicator-appmenu indicator-messages indicator-printers indicator-session language-selector-gnome light-themes lightdm notify-osd overlay-scrollbar plymouth-theme-ubuntu-logo sni-qt ubuntu-docs ubuntu-mono ubuntu-session ubuntu-settings ubuntu-wallpapers unity unity-control-center unity-greeter unity-gtk2-module unity-gtk3-module unity-lens-applications unity-lens-files unity-settings-daemon zeitgeist


# Install GNOME applications

apt-get install -y dconf-editor eog evince file-roller gedit gedit-plugins gnome-calculator gnome-font-viewer gnome-icon-theme-full gnome-keyring gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gnome-user-guide gucharmap gvfs-backends gvfs-fuse libgnome2-bin libgsf-bin libgtk2-perl libpam-gnome-keyring nautilus nautilus-open-terminal network-manager-gnome policykit-desktop-privileges seahorse ssh-askpass-gnome xdg-user-dirs


# Install fonts

apt-get install -y fonts-cantarell fonts-croscore fonts-crosextra-caladea fonts-crosextra-carlito fonts-droid fonts-dustin gsfonts-x11 ttf-ancient-fonts ttf-ubuntu-font-family xfonts-base


# Install package management

apt-get install -y apt-xapian-index gdebi-core git synaptic update-manager update-notifier vrms


# Install file/disk tools

apt-get install -y baobab btrfs-tools easytag exfat-fuse exfat-utils gdisk gnome-disk-utility gparted gprename iotop mat ntfs-3g unetbootin


# Install printers and scanners

apt-get install -y cups cups-browsed cups-pk-helper foomatic-db-compressed-ppds foomatic-db-engine openprinting-ppds simple-scan


# Install audio

apt-get install -y gstreamer1.0-alsa gstreamer1.0-libav gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio pulseaudio pulseaudio-module-bluetooth


# Install browsers, e-mail, chat, and web tools

apt-get install -y chromium-browser curl enigmail firefox gajim iftop quvi tcpdump thunderbird thunderbird-gnome-support wireshark xul-ext-lightning youtube-dl


# Install multimedia

apt-get install -y aqualung asunder audacity brasero brasero-cdrkit dvdauthor dvdstyler dvgrab ffmpegthumbnailer flac frei0r-plugins handbrake handbrake-cli kdenlive libav-tools swh-plugins tap-plugins vlc vlc-plugin-notify vlc-plugin-pulse vorbis-tools

/usr/share/doc/libdvdread4/install-css.sh


# Install LibreOffice

add-apt-repository ppa:libreoffice/ppa
apt-get update

apt-get install -y libreoffice-avmedia-backend-gstreamer libreoffice-calc libreoffice-draw libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-sifr libreoffice-templates libreoffice-writer


# Install graphical tools

apt-get install -y blender calibre darktable dia-gnome dia-shapes gimp gimp-data-extras icc-profiles-free inkscape krita


# Install LaTeX and Scribus

apt-get install -y latexila lmodern lyx scribus scribus-template texlive texmaker


# Install Usenet

apt-get install -y par2 unrar


# Install language packs

apt-get install -y calligra-l10n-nl chromium-browser-l10n firefox-locale-nl kde-l10n-nl language-pack-gnome-nl libreoffice-l10n-nl myspell-de-de myspell-en-us myspell-fr myspell-nl thunderbird-locale-nl


# Install hardware-specific tools

apt-get install -y dvb-apps ecryptfs-utils i965-va-driver idle3-tools intel-microcode libvdpau-va-gl1 lm-sensors vlc-plugin-zvbi


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
