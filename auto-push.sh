#!/bin/bash

# Auto-push script for Finops-Dashboard
# This script will automatically commit and push changes to GitHub

cd /var/www/Finops-Dashboard

# Check if there are any changes
if [ -n "$(git status --porcelain)" ]; then
    echo "Changes detected. Committing and pushing..."
    
    # Add all changes
    git add .
    
    # Commit with timestamp
    git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Push to GitHub
    git push origin main
    
    echo "Changes pushed successfully!"
else
    echo "No changes detected."
fi