#!/bin/bash
set -e

BASE_DIR="/itsmsb-code-repo"

BRANCH="${branch:?branch not set}"
echo "Selected branch: $branch"

PATH_TO_MAIN="${path_to_main:?path_to_main not set}"
echo "Selected path to main file: $path_to_main"

MAIN_FILE="$BASE_DIR/$branch/$path_to_main"
echo "Main file location: $MAIN_FILE"

if [ ! -f "$MAIN_FILE" ]; then
  echo "ERROR: File not found!"
  exit 1
fi

cd "$(dirname "$MAIN_FILE")"

python "$(basename "$MAIN_FILE")"