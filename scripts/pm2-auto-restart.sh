#!/bin/bash

# PM2 service name
SERVICE_NAME="test"

# Check if the PM2 service is running
SERVICE_STATUS=$(pm2 jlist | jq '.[] | select(.name=="'$SERVICE_NAME'") | .pm2_env.status')

if [ "$SERVICE_STATUS" != "\"online\"" ]; then
  echo "$(date): Service '$SERVICE_NAME' is not running. Restarting..."

  # Restart the service
  pm2 restart "$SERVICE_NAME"

  # Log the action
  echo "$(date): Service '$SERVICE_NAME' restarted successfully." >> /var/log/pm2-auto-restart.log
else
  echo "$(date): Service '$SERVICE_NAME' is running fine."
fi
