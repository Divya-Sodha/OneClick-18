
#This script is useful to install Google Chrome, nginx, temviewer and kolibri platform on the machine. Also, used to set platform.sh 
#and script_sync.sh bash files.


echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo 's' | sudo -S apt-get update


    # To install Google Chrome
    notify-send "Installing chrome browser on system"
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    echo 'Y' | sudo -S apt-get install google-chrome-stable 2>> /home/kolibri/Desktop/Updation_script/updation.log

    # To install teamviewer
    notify-send "Installing teamviewer on system"
    (echo 'Y' | sudo -S  dpkg -i /home/kolibri/Desktop/Updation_script/packages/teamviewer_12.0.137452_i386.deb;
    echo 's' | sudo -S apt update;
    echo 'Y' | sudo -S apt -f install ) 2>> /home/kolibri/Desktop/Updation_script/updation.log

    # To install nginx
    notify-send "Installing nginx on system"
    (echo -ne '\n' | sudo add-apt-repository ppa:nginx/stable;
    echo 's'| sudo -S apt-get update;
    echo 'Y'| sudo -S apt-get install nginx;
    sudo chown kolibri:kolibri -R /etc/nginx/;
    sudo cp /home/kolibri/Desktop/Updation_script/static_files/default  /etc/nginx/sites-enabled/;
    sudo cp /home/kolibri/Desktop/Updation_script/static_files/default  /etc/nginx/sites-available/ ) 2>> /home/kolibri/Desktop/Updation_script/updation.log


    sudo pip3 install -r /home/kolibri/Desktop/Updation_script/Adding_Learners/.add_learners/requirements.txt 2>> /home/kolibri/Desktop/Updation_script/updation.log

    notify-send "Online setup is done, Now setting up your platform"

    # To install kolibri platform
    #(echo 's' | sudo apt-get -y install software-properties-common;
    #echo 's' | sudo add-apt-repository ppa:learningequality/kolibri;
    #echo 's' | sudo apt-get update;
    #echo 's' | sudo apt-get -y install kolibri;
    #)2>> /home/kolibri/Desktop/Updation_script/updation.log
    To install kolibri platform
    (sudo apt-get remove kolibri;
    sudo dpkg -i /home/kolibri/Desktop/Updation_script/packages/kolibri_0.13.0-0ubuntu1_all.deb;
    )2>> /home/kolibri/Desktop/Updation_script/updation.log


    # To copy platform and script_sync bash files to the required positions and change their permissions.
    (sudo cp /home/kolibri/Desktop/Updation_script/static_files/platform.sh  /home/kolibri/Desktop;
    sudo chmod 777 /home/kolibri/Desktop/platform.sh;
    echo 's' | sudo -S chattr +i /home/kolibri/Desktop/platform.sh)  2>> /home/kolibri/Desktop/Updation_script/updation.log

    (sudo cp /home/kolibri/Desktop/Updation_script/static_files/script_sync.sh  /home/kolibri/Desktop/;
    sudo chmod a+x /home/kolibri/Desktop/script_sync.sh;
    echo 's' | sudo -S chattr +i /home/kolibri/Desktop/script_sync.sh) 2>> /home/kolibri/Desktop/Updation_script/updation.log

    echo "Online setup Done" >> /home/kolibri/Desktop/Updation_script/updation.log
    sudo service nginx restart
    zenity --info --text="Online setup Done."
else
  zenity --info --text="Please check your internet connection"

fi
