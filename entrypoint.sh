#!/bin/bash
set -e

echo "Pulling code from GitHub branch: $BRANCH"
echo "Github Repo URL: $GITHUB_REPO_URL"

rm -rf /app/code
mkdir -p /app/code

AUTHED_REPO_URL=$(echo "$GITHUB_REPO_URL" | sed "s#https://#https://$GITHUB_USERNAME:$GITHUB_TOKEN@#")

git clone --branch "$BRANCH" "$AUTHED_REPO_URL" /app/code

cd /app/code

# pip install branch-specific requirements if any
if [ -f "requirements.txt" ]; then
    echo "Installing branch-specific dependencies..."
    pip install --no-cache-dir -r requirements.txt
fi

# Run itsmsb application
python "$PATH_TO_MAIN"
