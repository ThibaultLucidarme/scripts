#!/bin/sh

# Install and configure half-installed packages
sudo apt-get install -f
sudo dpkg --configure -a

# Update the package lists and install all updates
sudo apt-get update
sudo apt-get dist-upgrade

# Remove unnecessary old packages
sudo apt-get autoremove
sudo dpkg -l | grep  ^rc | awk '{print $2}' | xargs sudo dpkg --purge remove

# Clean up the cache
sudo apt-get clean
