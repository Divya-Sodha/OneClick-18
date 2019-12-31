#!/bin/bash

#This script is used to generate the log file which can be used to trace any errors if occured.


if [ ! -d /home/kolibri/Documents/log ]; then
  mkdir -p /home/kolibri/Documents/log;
fi

dt=$(date '+%d-%B,%Y-%H:%M:%S');
mkdir /home/kolibri/Documents/log/$dt


if [ ! -f /var/log/nginx/timing.log ]; then
    zenity --info --text="timing.log is not found in the server"
    echo "Timing.log files not found in the server" >> /home/kolibri/Desktop/Updation_script/updation.log
else
    cp /var/log/nginx/timing.log* /home/kolibri/Documents/log/$dt/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
    notify-send "Please check log folder in the Documents for timing.log file "
fi


if [ ! -f /home/kolibri/.kolibri/kolibri.log ]; then
    zenity --info --text="kolibri.log is not found in the server"
    echo "Kolibri.log file not found in the server " >> /home/kolibri/Desktop/Updation_script/updation.log
else
    cp /home/kolibri/.kolibri/kolibri.log /home/kolibri/Documents/log/$dt/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
    notify-send "Please check log folder in the Documents for kolibri.log file"

fi

zenity --info --text="Log Backup Done"
