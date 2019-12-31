#!/bin/bash

#This script is useful for taking backup of kolibri database. The backup folder will be created in Documents.


if [ ! -d /home/kolibri/Documents/backup ]; then
  mkdir -p /home/kolibri/Documents/backup;
fi

dt=$(date '+%d-%B,%Y-%H:%M:%S');
mkdir /home/kolibri/Documents/backup/$dt

if [ ! -f /home/kolibri/.kolibri/db.sqlite3 ]; then
    zenity --info --text="Database file is not found in the server"
    echo "Database is not found in the server" >> /home/kolibri/Desktop/Updation_script/updation.log

else
    cp /home/kolibri/.kolibri/db.sqlite3 /home/kolibri/Documents/backup/$dt/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
    notify-send "Please check backup folder in Documents for database file"
fi

zenity --info --text="Database Backup Done"
