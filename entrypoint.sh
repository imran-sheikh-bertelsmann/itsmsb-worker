#!/bin/bash
set -e

BASE_DIR="/itsmsb-code-repo"

BRANCH="${BRANCH:?BRANCH not set}"
echo "Selected branch: $BRANCH"

PATH_TO_MAIN="${PATH_TO_MAIN:?PATH_TO_MAIN not set}"
echo "Path to main file: $PATH_TO_MAIN"

MAIN_FILE="$BASE_DIR/$BRANCH/$PATH_TO_MAIN"

echo "Running: $MAIN_FILE"

if [ ! -f "$MAIN_FILE" ]; then
  echo "ERROR: File not found!"
  exit 1
fi

cd "$(dirname "$MAIN_FILE")"

python "$(basename "$MAIN_FILE")"