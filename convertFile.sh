#!/bin/bash

# Set the input and output folder paths
input_folder="input"
output_folder="output"

# Create the output folder if it doesn't exist
mkdir -p "$output_folder"

# Loop through all MP4 files in the input folder
for file in "$input_folder"/*.mp4; do
  # Extract the filename without the extension
  filename=$(basename "$file" .mp4)

  # Convert the MP4 file to MP3
  ffmpeg -i "$file" -vn "$output_folder"/"$filename".mp3

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
    echo "Converted $file to MP3 successfully."
  else
    echo "Error converting $file to MP3."
  fi
done