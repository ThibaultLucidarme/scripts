#!/bin/sh

# This script will convert a Xubuntu install to a Unity install
# Run from a TTY!


# Fix broken packages, if any

sudo apt-get install -f
sudo dpkg --configure -a


# Update the package sources

sudo apt-get update


# Stop LightDM

sudo service lightdm stop


# Purge Xubuntu-specific packages

sudo apt-get purge plymouth-theme-xubuntu-logo xubuntu-default-settings


# Install Unity

sudo apt-get install activity-log-manager appmenu-qt appmenu-qt5 branding-ubuntu dmz-cursor-theme hud indicator-application indicator-appmenu indicator-messages indicator-printers indicator-session language-selector-gnome lightdm notify-osd notify-osd-icons overlay-scrollbar plymouth-theme-ubuntu-logo sni-qt ubuntu-artwork ubuntu-docs ubuntu-minimal ubuntu-session ubuntu-settings ubuntu-standard ubuntu-system-service ubuntu-wallpapers unity unity-control-center unity-greeter unity-gtk2-module unity-gtk3-module unity-lens-applications unity-lens-files unity-lens-music unity-lens-photos unity-lens-video unity-scope-home unity-settings-daemon zeitgeist


# Purge Xfce

sudo apt-get purge blueman catfish compton exo-utils gnome-system-tools light-locker light-locker-settings lightdm-gtk-greeter menulibre mugshot orage pavucontrol shimmer-themes system-tools-backends thunar thunar-archive-plugin thunar-data thunar-media-tags-plugin thunar-volman tumbler tumbler-common tumbler-plugins-extra xfce4-appfinder xfce4-indicator-plugin xfce4-notes xfce4-notifyd xfce4-panel xfce4-places-plugin xfce4-power-manager xfce4-power-manager-data xfce4-screenshooter xfce4-session xfce4-settings xfce4-terminal xfce4-volumed xfce4-whiskermenu-plugin xfconf xfdesktop4 xfdesktop4-data xfwm4 xubuntu-artwork xubuntu-docs xubuntu-icon-theme xubuntu-wallpapers


# Install GNOME applications

sudo apt-get install dconf-cli dconf-editor eog evince ffmpegthumbnailer file-roller gedit gnome-calculator gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gnome-user-guide gvfs gvfs-backends gvfs-fuse libgnome2-bin libgsf-bin libgtk2-perl libpam-gnome-keyring nautilus nautilus-open-terminal ssh-askpass-gnome xdg-user-dirs


# Reinstall indicators (sometimes they break)

sudo apt-get install --reinstall indicator-application indicator-appmenu indicator-bluetooth indicator-datetime indicator-keyboard indicator-messages indicator-power indicator-printers indicator-session indicator-sound libappindicator1 libappindicator3-1 libindicator3-7 libindicator7 sni-qt

sudo apt-mark auto libappindicator1 libappindicator3-1 libindicator3-7 libindicator7


# Remove Xfce configuration

rm ~/.cache/blueman-applet-1000
rm -r ~/.cache/sessions/
rm ~/.cache/xfce4-indicator-plugin.log
rm ~/.cache/xfce4-notifyd-theme.rc
rm -r ~/.config/autostart/
rm -r ~/.config/blueman/
rm -r ~/.config/catfish/
rm ~/.config/pavucontrol.ini
rm -r ~/.config/Thunar/
rm -r ~/.config/xfce4/
rm ~/.dmrc
rm -r ~/.local/share/xfce4/


# Do a full upgrade

sudo apt-get dist-upgrade


# Automatically remove all unneeded packages

sudo apt-get autoremove
sudo apt-get clean


# Purge all remaining configuration files

sudo dpkg -l | grep  ^rc | awk '{print $2}' | xargs sudo dpkg --purge remove


# Reboot

sudo reboot
