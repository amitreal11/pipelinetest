#!/bin/bash

echo "Starting PM2 service restart" >> /tmp/codedeploy_debug.log
cd /home/ubuntu/pipelinetest >> /tmp/codedeploy_debug.log 2>&1
/home/ubuntu/.nvm/versions/node/v14.21.1/bin/pm2 restart node >> /tmp/codedeploy_debug.log 2>&1
echo "PM2 service restarted successfully!" >> /tmp/codedeploy_debug.log



