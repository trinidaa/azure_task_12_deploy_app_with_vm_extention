#!/bin/bash

apt-get update -yq
apt-get install python3-pip -yq

# Create a directory for the app and download the files.
mkdir /app
# make sure to uncomment the line bellow and update the link with your GitHub username
git clone https://github.com/efirshey/azure_task_12_deploy_app_with_vm_extention.git
cp -r azure_task_12_deploy_app_with_vm_extention/app/* /app

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
