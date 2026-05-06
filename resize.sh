#!/bin/bash

INPUT_DIR="./"
OUTPUT_DIR="./scaled_720"

mkdir -p "$OUTPUT_DIR"
shopt -s nullglob nocaseglob

for video in "$INPUT_DIR"/*.{mp4,mkv,mov}; do
    # Get original filename (without extension)
    filename=$(basename "$video")
    extension="${filename##*.}"
    name_without_ext="${filename%.*}"

    echo "Scaling $filename to 720p..."

    ffmpeg -y -i "$video" -vf "scale=-2:720" -c:a copy "$OUTPUT_DIR/${name_without_ext}_720p.$extension"

    echo "Done: $OUTPUT_DIR/${name_without_ext}_720p.$extension"
done

shopt -u nullglob nocaseglob

echo "All videos scaled to 720p and saved in '$OUTPUT_DIR'."
