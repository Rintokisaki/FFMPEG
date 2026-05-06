# FFmpeg Automation Scripts

A collection of simple Bash scripts to process videos and GIFs using FFmpeg.

## Scripts Included

* `convo.sh` → Convert `.mp4` videos to GIFs
* `renamer.sh` → Randomly rename GIF files
* `resize.sh` → Resize videos to 720p

---

# 1. Video to GIF Converter (`convo.sh`)

## Description

Converts all `.mp4` files in the current directory into high-quality GIFs.

## Features

* Batch processing
* Generates optimized color palettes
* High-quality scaling (Lanczos)
* Automatic output folder

## Requirements

* bash
* ffmpeg

## Usage

```bash
chmod +x convo.sh
./convo.sh
```

## Output

```
./gif_output/
```

Example:

```
video.mp4 → gif_output/video.gif
```

## Customization

* FPS: `fps=15`
* Resolution: `scale=700:-1`

---

# 2. GIF Random Renamer (`renamer.sh`)

## Description

Renames all `.gif` files inside the `gif_output` directory to random names.

## Features

* Random 8-character filenames
* Keeps `.gif` extension
* Prevents overwriting
* Case-insensitive

## Requirements

* bash

## Usage

```bash
chmod +x renamer.sh
./renamer.sh
```

## Directory Structure

```
gif_output/
```

## Example

```
cat.gif → A8fK29xQ.gif
```

## Customization

Change name length:

```bash
length=8
```

---

# 3. Video Resizer (`resize.sh`)

## Description

Resizes videos to 720p while maintaining aspect ratio.

## Features

* Supports `.mp4`, `.mkv`, `.mov`
* Preserves aspect ratio
* Copies audio without re-encoding
* Batch processing

## Requirements

* bash
* ffmpeg

## Usage

```bash
chmod +x resize.sh
./resize.sh
```

## Output

```
./scaled_720/
```

Example:

```
movie.mp4 → scaled_720/movie_720p.mp4
```

## Customization

Change resolution:

```bash
scale=-2:720
```

Examples:

* 1080p → `scale=-2:1080`
* 480p → `scale=-2:480`

---

# Notes

* Ensure `ffmpeg` is installed:

```bash
sudo apt install ffmpeg
```

* Scripts are designed for Linux/macOS environments
* Original files are not modified

---

# License

Free to use and modify.
