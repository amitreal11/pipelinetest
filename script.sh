#!/bin/bash
set -e

echo "Deploying code from GCS to server..."

gsutil -m rsync -r gs://crikfun-stage/pipelinetest/ /home/ubuntu/pipelinetest/

echo "Fixing permissions..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/pipelinetest/

echo "Code deployed successfully (no restart)"
