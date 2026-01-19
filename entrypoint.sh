#!/bin/bash
set -e

base_dir="/itsmsb-code-repo"

branch="${branch:?branch not set}"
echo "Selected branch: $branch"

path_to_main="${path_to_main:?path_to_main not set}"
echo "Selected path to main file: $path_to_main"

main_file="$base_dir/$branch/$path_to_main"
echo "Main file location: $main_file"

if [ ! -f "$main_file" ]; then
  echo "ERROR: File not found!"
  exit 1
fi

cd "$(dirname "$main_file")"

python "$(basename "$main_file")"