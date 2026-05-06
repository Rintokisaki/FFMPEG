#!/bin/bash

INPUT_DIR="./"
OUTPUT_DIR="./gif_output"

mkdir -p "$OUTPUT_DIR"
shopt -s nocaseglob

for video in "$INPUT_DIR"/*.mp4; do
    filename=$(basename "$video" .mp4)

    echo "Generating palette for $video ..."
    ffmpeg -y -i "$video" \
      -vf "fps=15,scale=700:-1:flags=lanczos,palettegen=stats_mode=full" \
      "$OUTPUT_DIR/$filename-palette.png"

    echo "Converting $video to GIF ..."
    ffmpeg -y -i "$video" -i "$OUTPUT_DIR/$filename-palette.png" \
      -filter_complex "fps=15,scale=700:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=sierra2_4a" \
      "$OUTPUT_DIR/$filename.gif"

    echo "Done: $OUTPUT_DIR/$filename.gif"
done

shopt -u nocaseglob
echo "All conversions completed."
