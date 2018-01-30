#!/bin/bash

# commands to setup kiosk mode hopefully you can just run this file, but you might need to do some other stuff too.

# get the clock set right
# git clone this project
# git clone https://github.com/GeorgetownMakerHubOrg/lenstable.git
# cd lenstable
# run this file

sudo apt-get update
sudo apt-get upgrade

# install ntpdate
sudo apt-get install ntpdate
# update the time
sudo ntpdate -u time.nist.gov

# add a cron line to automatically update the github every hour:
(crontab -l 2>/dev/null; echo "0 * * * * /home/pi/lenstable/gitupdate.sh ") | crontab -
chmod a+x /home/pi/lenstable/gitupdate.sh

# crontab as root to update time
(sudo crontab -l 2>/dev/null; echo "0 * * * * /usr/sbin/ntpdate -u time.nist.gov ") | sudo crontab -


# copy wpa_supplicant and interfaces files into place
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
# then edit this file for your specific network needs
sudo cp  /etc/network/interfaces /etc/network/interfaces.bak
sudo cp etc/network/interfaces /etc/network/interfaces

#install network_up
cp home/pi/network_up.sh /home/pi/network_up.sh
chmod a+x /home/pi/network_up.sh



# install chromium
sudo apt-get install chromium-browser x11-xserver-utils unclutter

# copy lxsession config file
# then edit autostart for the html file you want to display
sudo cp /home/pi/.config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart.bak
sudo cp home/pi/dot_config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart


#install mlocate
sudo apt-get install mlocate

#set some Chromium preferences
# add this to .bashrc
#sed -i 's/"exited_cleanly":[ ]*false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
#sed -i 's/"exit_type":[ ]*"Crashed"/"exit_type":"None"/' ~/.config/chromium/Default/Preferences
cat add_to_bashrc.sh >> ~/.bashrc


#now edit raspi-config to:
# allow ssh
# wait for network on boot
# desktop autologin








