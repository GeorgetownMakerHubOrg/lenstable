#!/bin/bash

# commands to setup kiosk mode hopefully you can just run this file, but you might need to do some other stuff too.
# get the clock set right
# git clone this project
# git clone https://github.com/GeorgetownMakerHubOrg/lenstable.git

sudo apt-get update
sudo apt-get upgrade

# copy wpa_supplicant and interfaces files into place
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
sudo cp etc/network/interfaces /etc/network/interfaces

#install network_up
cp home/pi/network_up.sh /home/pi/network_up.sh
chmod a+x /home/pi/network_up.sh

# install ntpdate
sudo apt-get install ntpdate






