#!/bin/bash

# Load NVM (if using Node Version Manager)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Navigate to the application directory
cd /home/ubuntu/pipelinetest

# Restart PM2 process as ubuntu
pm2 restart app

echo "PM2 service restarted successfully as ubuntu user!"
