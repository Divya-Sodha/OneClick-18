#!/bin/bash

#This script is used to download database of users from kolibri server by executing respective python script.


cp /home/kolibri/.kolibri/db.sqlite3 .

python export_users.py

sudo rm db.*
