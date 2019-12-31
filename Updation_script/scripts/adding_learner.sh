#!/bin/bash

#This script is used to insert learners automatically to the kolibri from the Excel sheet. Google Chrome stable version 
#is also installed if not present.


echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
   echo 's' | sudo -S apt-get update
  if [ ! -d /home/kolibri/Desktop/Adding_Learners ]; then
    echo "You dont have Adding learner folder on Desktop"
  else
    sudo chattr -i /home/kolibri/Desktop/Adding_Learners/
    sudo chmod 777 -R /home/kolibri/Desktop/Adding_Learners/
    cp /home/kolibri/Desktop/Adding_Learners/studentData.xlsx /home/kolibri/Videos/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
    rm -rf /home/kolibri/Desktop/Adding_Learners/ 2>> /home/kolibri/Desktop/Updation_script/updation.log
  fi
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 's' | sudo -S apt-get update 2>> /home/kolibri/Desktop/Updation_script/updation.log
  echo 'Y' | sudo -S apt-get install google-chrome-stable 2>> /home/kolibri/Desktop/Updation_script/updation.log

  if [ -f /usr/bin/chromedriver ]; then
    echo "Chromedriver is not present in /usr/bin/"
   echo 's' | sudo -S rm -rf /usr/bin/chromedriver
  fi
  sudo cp /home/kolibri/Desktop/Updation_script/packages/chromedriver /usr/bin/
  sudo chmod a+x /usr/bin/chromedriver
  cp -R /home/kolibri/Desktop/Updation_script/Adding_Learners /home/kolibri/Desktop/
  chmod a+x /home/kolibri/Desktop/Adding_Learners/upload_learners.sh



  if [ -f /home/kolibri/Videos/studentData.xlsx ]; then
    mv /home/kolibri/Videos/studentData.xlsx /home/kolibri/Desktop/Adding_Learners/
  fi
  notify-send "Setup is completed. Check whether Adding Learner script is working or not."

else
  notify-send "Trying to setup Adding Learner without internet if this will not work then try this when you will connect to the internet."
  if [ ! -d /home/kolibri/Desktop/Adding_Learners ]; then
    echo "You dont have Adding learner folder on Desktop"
  else
    echo 's' | sudo -S chattr -i /home/kolibri/Desktop/Adding_Learners/
    sudo chmod 777 -R /home/kolibri/Desktop/Adding_Learners/
    cp /home/kolibri/Desktop/Adding_Learners/studentData.xlsx /home/kolibri/Videos/
    rm -rf /home/kolibri/Desktop/Adding_Learners/
  fi
  sudo dpkg -i /home/kolibri/Desktop/Updation_script/packages/google-chrome-stable_current_amd64.deb 2>> /home/kolibri/Desktop/Updation_script/updation.log
  sudo apt -f install 2>> /home/kolibri/Desktop/Updation_script/updation.log

  if [ -f /usr/bin/chromedriver ]; then
    echo "Chromedriver is not present in /usr/bin/"
    echo 's' | sudo -S rm -rf /usr/bin/chromedriver
  fi
  sudo cp /home/kolibri/Desktop/Updation_script/packages/chromedriver /usr/bin/
  sudo chmod a+x /usr/bin/chromedriver
  cp -R /home/kolibri/Desktop/Updation_script/Adding_Learners /home/kolibri/Desktop/
  chmod a+x /home/kolibri/Desktop/Adding_Learners/upload_learners.sh


  if [ -f /home/kolibri/Videos/studentData.xlsx ]; then
    mv /home/kolibri/Videos/studentData.xlsx /home/kolibri/Desktop/Adding_Learners/
  fi
  notify-send "Setup is completed. Check whether Adding Learner script is working or not."
  echo "Adding learner setup is done " 2>> /home/kolibri/Desktop/Updation_script/updation.log
fi
zenity --info --text="Adding Learner Done"
