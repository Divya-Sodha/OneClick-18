#!/bin/bash

#This script is used to install kolibri hotspot on the machine. All the required packages are installed first 
#and then hostapd and kolibri-hotspot deb files are installed. The installation process is logged in a file.  

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
notify-send "Setting up hotspot on system"
(
sudo systemctl disable systemd-resolved.service;
sudo systemctl mask systemd-resolved.service;
sudo kill -9 $(sudo lsof -i:53 | awk '{if($3=="systemd-resolve") print $2}');
echo 'y'| sudo -S sudo apt-get update;
echo 'y'| sudo -S apt-get install dpkg-dev cdbs debhelper dh-autoreconf libev-dev libpcre3-dev pkg-config;
echo 'y'| sudo -S apt-get -y purge dnsmasq hostapd kolibri-hotspot;
echo 'y'| sudo -S apt-get install dnsmasq git;
echo 'y'| sudo -S apt-get install -y dnsmasq git;
echo 'y'| sudo -S dpkg -i /home/kolibri/Desktop/Updation_script/kolibri-hotspot/hostapd/hostapd*.deb;
#echo 'y'| sudo apt-get install hostapd;
echo 'y'| sudo -S dpkg -i /home/kolibri/Desktop/Updation_script/kolibri-hotspot/kolibri-hotspot*.deb;
#sudo systemctl unmask systemd-resolved.service;
#sudo systemctl enable systemd-resolved.service; 
#sudo  service systemd-resolved start;
) 2>> /home/kolibri/Desktop/Updation_script/updation.log
echo "Hotspot setup done " >> /home/kolibri/Desktop/Updation_script/updation.log
zenity --info --text="Hotspot setup Done."
fi
