#!/bin/env sh

START_HOUR='22'
END_HOUR='6'
CURRENT_HOUR="$(date '+%H')"

if [ "$START_HOUR" -le "$CURRENT_HOUR" ]; then
  END_EPOCH="$(date --date="tomorrow $END_HOUR" '+%s')"
elif [ "$CURRENT_HOUR" -lt "$END_HOUR" ]; then
  END_EPOCH="$(date --date="$END_HOUR" '+%s')"
else
  exit 0
fi

CURRENT_EPOCH="$(date '+%s')"
SECONDS_REMAINING="$((END_EPOCH - CURRENT_EPOCH))"

timeout "$SECONDS_REMAINING" hyprsunset -t 3600
