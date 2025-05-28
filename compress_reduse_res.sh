#!/bin/bash

# Set input and output directories
INPUT_DIR="schol"
OUTPUT_DIR="res1"
QUALITY=15  # ffmpeg quality scale (lower is better quality)

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Process each .jpg or .jpeg file
for img in "$INPUT_DIR"/*.jpg "$INPUT_DIR"/*.jpeg; do
    # Check if file exists to avoid globbing issues
    [ -e "$img" ] || continue

    filename=$(basename "$img")
    output_path="$OUTPUT_DIR/$filename"

    echo "Compressing $filename..."
    ffmpeg -i "$img"  -vf scale=1200:-1 -q:v $QUALITY "$output_path"
done

echo "All images compressed to $OUTPUT_DIR"
