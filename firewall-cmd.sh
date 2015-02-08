#!/bin/sh

sudo firewall-cmd --remove-service ssh --zone dmz --permanent
sudo firewall-cmd --remove-service ssh --zone external --permanent
sudo firewall-cmd --remove-service ssh --zone public --permanent
sudo firewall-cmd --remove-service samba-client --zone home --permanent
sudo firewall-cmd --remove-service samba-client --zone internal --permanent
sudo firewall-cmd --reload
