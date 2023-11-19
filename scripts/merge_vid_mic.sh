#!/bin/env sh

# Merges audio files into identically named video files
for vid in *.mp4; do
  vid="${vid%.mp4}"
  if [ -e "${vid}.m4a" ]; then
    echo "Merging files ${vid}.{mp4,m4a}"
    ffmpeg -i "${vid}.mp4" -i "${vid}.m4a" -map 0 -map 1:a -c:v copy -shortest "MERGE-${vid}.mp4"
    if [ "$?" == "0" ] ; then
      echo "Merge succeeded - Deleting old files"
      rm "${vid}.mp4" "${vid}.m4a"
      # Move to backup folder instead of deleting
      #mkdir -p backup
      #mv "${vid}.mp4" "${vid}.m4a" backup
      mv "MERGE-${vid}.mp4" "${vid}.mp4"
    else
      echo "Merge failed! - Not deleting!"
      exit 1
    fi
  else
    echo "No corresponding audio file found for ${vid}.mp4, skipping..."
  fi
  echo
done

