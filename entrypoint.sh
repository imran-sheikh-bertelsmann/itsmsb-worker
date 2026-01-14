#!/bin/bash
set -e

echo "Pulling code from GitLab branch: $BRANCH"
echo "Repo URL: $REPO_URL"

# Check if username and token are provided
if [ -z "$GITLAB_USERNAME" ] || [ -z "$GITLAB_TOKEN" ]; then
    echo "Error: Please provide GITLAB_USERNAME and GITLAB_TOKEN"
    exit 1
fi

# Clean old code
rm -rf /app/code
mkdir -p /app/code

# Convert repo URL to include credentials for HTTPS
# e.g., https://username:token@gitlab.com/username/repo.git
AUTHED_REPO_URL=$(echo "$REPO_URL" | sed "s#https://#https://$GITLAB_USERNAME:$GITLAB_TOKEN@#")

# Clone the specific branch
git clone --branch "$BRANCH" "$AUTHED_REPO_URL" /app/code

cd /app/code

# Optional: install branch-specific requirements if exists
if [ -f "requirements.txt" ]; then
    echo "Installing branch-specific dependencies..."
    pip install --no-cache-dir -r requirements.txt
fi

# Run the main Python file
echo "Running $PATH_TO_MAIN"
python "$PATH_TO_MAIN"
