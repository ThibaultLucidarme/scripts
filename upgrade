#!/bin/sh

# Fix broken packages, if any
sudo apt-get install -f
sudo dpkg --configure -a

# Install all updates
sudo apt-get update
sudo apt-get dist-upgrade

# Clean up
sudo apt-get autoremove
sudo dpkg -l | grep  ^rc | awk '{print $2}' | xargs sudo dpkg --purge remove
sudo apt-get clean
