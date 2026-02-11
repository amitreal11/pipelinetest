#!/bin/bash
set -e

APP_DIR="/home/ubuntu/pipelinetest"
BUCKET_PATH="gs://crikfun-stage/pipelinetest"

echo "----------------------------------------"
echo "Starting Deployment: $(date)"
echo "----------------------------------------"

echo "Creating app directory if not exists..."
sudo mkdir -p $APP_DIR

echo "Syncing latest code from GCS..."
gsutil -m rsync -r -d $BUCKET_PATH $APP_DIR

echo "Fixing ownership..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "Setting executable permissions..."
sudo chmod -R 755 $APP_DIR

echo "Deployment completed successfully at $(date)"
echo "----------------------------------------"