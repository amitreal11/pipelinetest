#!/bin/bash

# Your GitHub username
username="aws amit"

# Your personal access token
token="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"

# Change to the directory where the repository is cloned
#cd /path/to/your/repo || exit
branch=$(git rev-parse --abbrev-ref HEAD)
# Perform Git pull with authentication using the token
git pull "https://$username:$token@github.com/amitreal11/predictionAdminNode
" "$branch"
