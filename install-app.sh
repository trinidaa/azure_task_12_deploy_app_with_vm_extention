#!/bin/bash
apt-get update -yq
export DEBIAN_FRONTEND=noninteractive
apt-get install python3-pip -yq
mkdir -p /app

git clone https://github.com/trinidaa/azure_task_12_deploy_app_with_vm_extention.git /tmp/repo
cp -r /tmp/repo/app/* /app/
rm -rf /tmp/repo
cp /app/todoapp.service /etc/systemd/system/
chmod +x /app/start.sh
chmod 644 /etc/systemd/system/todoapp.service
chown root:root /etc/systemd/system/todoapp.service
systemctl daemon-reload
systemctl enable todoapp.service
systemctl start todoapp.service
