#!/bin/env sh

# Converts all opus files in the current directory to mp3
for vid in *.opus; do
  vid="${vid%.opus}"
  ffmpeg -i "${vid}.opus" "${vid}.mp3"
  echo
done

