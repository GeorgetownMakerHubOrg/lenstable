#!/bin/bash

# commands to setup kiosk mode hopefully you can just run this file, but you might need to do some other stuff too.
# get the clock set right
# git clone this project
# git clone https://github.com/GeorgetownMakerHubOrg/lenstable.git
# cd lenstable
# run this file

sudo apt-get update
sudo apt-get upgrade

# copy wpa_supplicant and interfaces files into place
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
# then edit this file for your specific network needs
sudo cp etc/network/interfaces /etc/network/interfaces

#install network_up
cp home/pi/network_up.sh /home/pi/network_up.sh
chmod a+x /home/pi/network_up.sh

# install ntpdate
sudo apt-get install ntpdate
# update the time
sudo ntpdate -u time.nist.gov

# install chromium
sudo apt-get install chromium-browser x11-xserver-utils unclutter

# copy lxsession config file
sudo cp home/pi/dot_config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart
# then edit autostart for the html file you want to display


#install mlocate
sudo apt-get install mlocate

#set some Chromium preferences
sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences

#now edit raspi-config to:
# allow ssh
# wait for network on boot
# desktop autologin








