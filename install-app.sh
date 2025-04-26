#!/bin/bash

set -ex
apt-get update -yq
export DEBIAN_FRONTEND=noninteractive
apt-get install -yqq --no-install-recommends python3-pip || {
    echo "Failed to install python3-pip"
    exit 1
}
rm -rf /var/lib/apt/lists/*
mkdir -p /app

git clone https://github.com/azat-co/azure_task_12_deploy_app_with_vm_extention-main.git /tmp/azure_task_12
cp -r /tmp/azure_task_12/app/* /app
rm -rf  /tmp/azure_task_12
cp /app/todoapp.service /etc/systemd/system/
chmod +x /app/start.sh
chmod 644 /etc/systemd/system/todoapp.service
chown root:root /etc/systemd/system/todoapp.service
systemctl daemon-reload
systemctl enable todoapp.service
systemctl start todoapp.service
echo "Installation completed successfully"