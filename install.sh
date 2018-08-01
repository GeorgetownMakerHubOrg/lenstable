#!/bin/bash

# commands to setup kiosk mode hopefully you can just run this file, but you might need to do some other stuff too.

# get the clock set right
# git clone this project
# git clone https://github.com/GeorgetownMakerHubOrg/lenstable.git
# cd lenstable
# run this file

# these two lines take the longest to run
sudo apt-get -y update
sudo apt-get -y upgrade

# install ntpdate
sudo apt-get -y install ntpdate
# update the time
sudo ntpdate -u time.nist.gov

# crontab as root to update time
(sudo crontab -l 2>/dev/null; echo "0 * * * * /usr/sbin/ntpdate -u time.nist.gov ") | sudo crontab -
chmod a+x /home/pi/lenstable/gitupdate.sh
(crontab -l 2>/dev/null; echo "0 * * * *  /home/pi/lenstable/gitupdate.sh") | crontab -

########
# Network stuff
# copy wpa_supplicant and interfaces files into place
#you might not want to do this is you are setting up networking a different way
#sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak
#sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

# then edit this file for your specific network needs
sudo cp  /etc/network/interfaces /etc/network/interfaces.bak
sudo cp etc/network/interfaces /etc/network/interfaces
#install network_up, which specifies things that happen once the network is up.
cp home/pi/network_up.sh /home/pi/network_up.sh
chmod a+x /home/pi/network_up.sh
########

# browser install and auto-start
# install chromium
sudo apt-get -y install chromium-browser x11-xserver-utils unclutter
# copy lxsession config file, which turns off screensavers, and other stuff for better kiosk mode. 
# and also boots chrome with the right options.
# then edit autostart for the html file you want to display
sudo cp /home/pi/.config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart.bak
sudo cp home/pi/dot_config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart
#set some Chromium preferences
# add this to .bashrc, it prevents an error window in chrome when you do a hard restart.
#sed -i 's/"exited_cleanly":[ ]*false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
#sed -i 's/"exit_type":[ ]*"Crashed"/"exit_type":"None"/' ~/.config/chromium/Default/Preferences
#cat add_to_bashrc.sh >> ~/.bashrc

#install mlocate, which helps us find files  using locate
sudo apt-get -y install mlocate

#now edit raspi-config to:
# allow ssh
# wait for network on boot
# desktop autologin
# edit /boot/config.txt if you want screen rotation. add line
# display_rotate=X
# where X is 0,1,2,3 for rotating 0, 90, 180, or 270 degrees
# set the timezone
# set the keyboard locale to US (Usually)







