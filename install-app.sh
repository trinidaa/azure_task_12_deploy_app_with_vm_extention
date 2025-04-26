#!/bin/bash

set -ex
apt update -yq
export DEBIAN_FRONTEND=noninteractive
apt install -yqq --no-install-recommends python3-pip
mkdir -p /app

git clone https://github.com/trinidaa/azure_task_12_deploy_app_with_vm_extention.git /tmp/azure_task_12
cp -r /tmp/azure_task_12/app/* /app/
rm -rf /tmp/azure_task_12
cp /app/todoapp.service /etc/systemd/system/
chmod +x /app/start.sh
chmod 644 /etc/systemd/system/todoapp.service
chown root:root /etc/systemd/system/todoapp.service
systemctl daemon-reload
systemctl enable todoapp.service
systemctl start todoapp.service
echo "Installation completed successfully"