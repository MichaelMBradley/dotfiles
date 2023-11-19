#!/bin/env sh

# Converts all mp4 files in the current directory to mov
for file in *.mp4
do
  ffmpeg -i "$file" -map 0 -f mov "mov/${file::-4}.mov"
done

