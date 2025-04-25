#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine. 
# Note that all commands bellow are without sudo - that's because extention mechanism 
# runs scripts under root user. 

# install system updates and isntall python3-pip package using apt. '-yq' flags are 
# used to suppress any interactive prompts - we won't be able to confirm operation 
# when running the script as VM extention.  
apt-get update -yq
export DEBIAN_FRONTEND=noninteractive
apt-get install -yqq --no-install-recommends python3-pip
rm -rf /var/lib/apt/lists/*

# Create a directory for the app and download the files. 
mkdir /app 
# make sure to uncomment the line bellow and update the link with your GitHub username
# git clone https://github.com/<your-gh-username>/azure_task_12_deploy_app_with_vm_extention.git
cp -r azure_task_12_deploy_app_with_vm_extention/app/* /app

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
chmod +x /app/start.sh
chmod 644 /etc/systemd/system/todoapp.service
chown root:root /etc/systemd/system/todoapp.service
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
