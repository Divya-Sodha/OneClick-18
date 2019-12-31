#! /bin/sh

#Used for syncing Database.


echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
  notify-send "You are connected to Internet, Syncing begins.Stay connected."
  output="sudo kolibri manage syncdata -- nalanda"
  sleep 10
  
  if echo "$output" | grep "200 OK"; then
      zenity --info --text="Sync Complete! Thank you."
  elif echo "$output" | grep "500"; then
      zenity --error --text="Internal server error"
  elif echo "$output" | grep "502"; then
      zenity --error --text="Bad Gateway. Try to connect to the another internet connection and sync"
  else 
      zenity --error --text="Not syncing. Contact your administrator"
  fi
else
  zenity --error --text="Please connect to internet and try again!"
fi
