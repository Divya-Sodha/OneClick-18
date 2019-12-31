#!/bin/bash

#This script is used to install kolibri platform on the machine. All the required packages are installed and some files are copied to 
#the required locations. Also permissions are changed as needed.



echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    (echo 's' | sudo -S chattr -i /home/kolibri/*.pex;
     chmod 777 /home/kolibri/*.pex;
    echo 's' | sudo -S rm -rf /home/kolibri/*.pex;
    notify-send "Backing up your current database in Videos folder";
    sudo cp /home/kolibri/.kolibri/db.sqlite3 /home/kolibri/Videos/;
    echo 's' | sudo apt-get install software-properties-common;
    echo 's' | sudo add-apt-repository ppa:learningequality/kolibri;
    echo 's' | sudo apt-get update;
    echo 's' | sudo apt-get install kolibri;
    ) 2>> /home/kolibri/Desktop/Updation_script/updation.log

    (echo 's' | sudo -S chattr -i /home/kolibri/platform.sh;
    echo 's' | sudo -S chmod 777 /home/kolibri/platform.sh;
    echo 's' | sudo -S truncate -s 0 /home/kolibri/platform.sh;
    sudo cat /home/kolibri/Desktop/Updation_script/static_files/platform.sh >> /home/kolibri/platform.sh;
    echo 's' | sudo -S chmod 777 /home/kolibri/platform.sh;
    echo 's' | sudo -S chattr +i /home/kolibri/platform.sh ) 2>> /home/kolibri/Desktop/Updation_script/updation.log

    (echo 's' | sudo -S chattr -i /home/kolibri/Desktop/script_sync.sh;
    sudo chmod 777 /home/kolibri/Desktop/script_sync.sh;
    echo 's' | sudo -S truncate -s 0 /home/kolibri/Desktop/script_sync.sh;
    sudo cat /home/kolibri/Desktop/Updation_script/static_files/script_sync.sh >> /home/kolibri/Desktop/script_sync.sh;
    sudo chmod 777 /home/kolibri/Desktop/script_sync.sh;
    echo 's' | sudo -S chattr +i /home/kolibri/Desktop/script_sync.sh )2>> /home/kolibri/Desktop/Updation_script/updation.log

    echo "Platform setup is done " >> /home/kolibri/Desktop/Updation_script/updation.log
    zenity --info --text="Platform setup Done."
fi
