#!/bin/bash
sudo su ubuntu
cd /home/ubuntu
pm2 restart 0
echo "PM2 service restarted successfully as ubuntu user!"
