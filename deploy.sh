#!/bin/bash

# Usage: ./deploy.sh "your commit message"
# Example: ./deploy.sh "update footer text"

MESSAGE=${1:-"update website"}

echo "→ Committing changes..."
git add .
git commit -m "$MESSAGE"

echo "→ Pushing to GitHub..."
git push

echo "→ Deploying to server..."
scp "$(dirname "$0")/index.html" root@165.232.122.176:/var/www/saqer.io/index.html
scp "$(dirname "$0")/assets/style.css" root@165.232.122.176:/var/www/saqer.io/assets/style.css

echo "✓ Done — saqer.io is live."
