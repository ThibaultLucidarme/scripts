#!/bin/sh

# WARNING: THIS ENABLES PROPRIETARY SOFTWARE, IMPOSSIBLE TO AUDIT
# USE AT YOUR OWN - OR YOUR CUSTOMER'S - RISK

# Do a root check
if [ $(id -u) -ne 0 ]; then echo "This script must be run as root."; exit 99; fi

# Set up Spotify repository
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
apt-get update

clear

echo "Run sudo apt-get install spotify-client if you actually want to install the non-free client."
