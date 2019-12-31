#!/bin/bash

#This script is used to take the data of learners from kolibri and stores it in a file in local machine. All the 
#errors are logged in file.


if [ ! -d /home/kolibri/Desktop/Updation_script/ExportUsers ]; then
    zenity --error --text="ExportUsers folder is not found in your Updation_script folder. Contact your script creator"
else
  if [ ! -d /home/kolibri/Desktop/ExportUsers ]; then
    rm -rf /home/kolibri/Desktop/ExportUsers 2>> /home/kolibri/Desktop/Updation_script/updation.log
  fi
cp -a /home/kolibri/Desktop/Updation_script/ExportUsers /home/kolibri/Desktop/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
sudo chmod a+x /home/kolibri/Desktop/ExportUsers/export_users.sh
notify-send "You can use ExportUsers script which is on Desktop"
echo "ExportUsers script is ready" 2>> /home/kolibri/Desktop/Updation_script/updation.log
zenity --info --text="Export learner Done"

fi
