#!/bin/bash

# PM2 process name
SERVICE_NAME="test"

# Check if the service is running
SERVICE_STATUS=$(pm2 list | grep "$SERVICE_NAME" | grep "online")

if [ -z "$SERVICE_STATUS" ]; then
  echo "$(date): Service '$SERVICE_NAME' is not running. Restarting..."
  
  # Restart the service
  pm2 restart "$SERVICE_NAME"
  
  # Log the action
  echo "$(date): Service '$SERVICE_NAME' restarted successfully." >> /var/log/pm2-auto-restart.log
else
  echo "$(date): Service '$SERVICE_NAME' is running fine."
fi
