# This script is used to install pre-requisite packages

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
  date >> /home/kolibri/Desktop/Updation_script/updation.log
  echo "Installation of packages is started." >> /home/kolibri/Desktop/Updation_script/updation.log

  notify-send "Installation of packages is started."
  echo 's'| sudo -S apt-get update 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 's'| sudo -S apt-get install libnl-route-3-200=3.2.29-0ubuntu3 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 'Y'| sudo -S apt-get install python-tk 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 'Y'| sudo -S apt-get install python3-pip 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 'Y'| sudo -S apt-get install sqlite3 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 's'| sudo -H pip3 install openpyxl 2>> /home/kolibri/Desktop/Updation_script/updation.log
  zenity --info --text="Setup is done."
  echo "Installation of packages is Done." >> /home/kolibri/Desktop/Updation_script/updation.log
else
  zenity --info --text="Please check your internet connection."

fi
