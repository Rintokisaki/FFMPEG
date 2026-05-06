#!/bin/bash

# Ask user for directory
dir="./gif_output"

# Check if directory exists
if [ ! -d "$dir" ]; then
  echo "Directory does not exist."
  exit 1
fi

# Length of random name
length=8

# Loop through only .gif files (case-insensitive)
shopt -s nullglob nocaseglob
for file in "$dir"/*.gif; do
  # Skip directories just in case
  [ -d "$file" ] && continue

  # Generate random string
  newname=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c $length)

  # New file path (always keep .gif)
  newpath="$dir/${newname}.gif"

  # Rename safely (no overwrite)
  mv -n "$file" "$newpath"

  echo "Renamed: $(basename "$file") -> $(basename "$newpath")"
done
shopt -u nullglob nocaseglob

echo "GIF renaming complete."