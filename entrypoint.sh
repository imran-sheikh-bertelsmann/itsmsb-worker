#!/bin/sh

# Won't continue if something is wrong
set -euo pipefail

echo "======================================"
echo " Generic ITSMSB Worker - Entrypoint"
echo "======================================"

base_dir="/itsmsb-code-repo"
if [ ! -d "$base_dir" ]; then
  echo "ERROR: Code root '$base_dir' does not exist"
  echo "PVC is probably not mounted"
  exit 1
fi

if [ -z "${branch:-}" ]; then
  echo "ERROR: BRANCH is not set"
  exit 1
fi

if [ -z "${path_to_main:-}" ]; then
  echo "ERROR: path_to_main is not set"
  exit 1
fi

echo "Selected branch: $branch"
echo "Selected path to main file: $path_to_main"

app_dir="$base_dir/$branch"
if [ ! -d "$app_dir" ]; then
  echo "ERROR: Branch not found: $app_dir"
  echo "Available branches:"
  ls -1 "$base_dir" || true
  exit 1
fi

main_file="$app_dir/$path_to_main"
if [ ! -f "$main_file" ]; then
  echo "ERROR: Main file not found: $main_file"
  echo "Contents of $app_dir:"
  find "$app_dir" -maxdepth 3 -type f || true
  exit 1
fi

echo "App Dir: $app_dir"
echo "Main file location: $main_file"

# optional install of dependencies
REQ_FILE="$app_dir/requirements.txt"

if [ -f "$REQ_FILE" ]; then
  echo "Installing Python dependencies from $REQ_FILE"
  pip install --no-cache-dir -r "$REQ_FILE"
else
  echo "No requirements.txt found, skipping app dependency install"
fi

echo "======================================"
echo "Starting application..."
echo "======================================"

cd "$(dirname "$main_file")"

exec python "$(basename "$main_file")"