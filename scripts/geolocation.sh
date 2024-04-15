#!/bin/env sh

case "$1" in
  "uri") OUTPUT='-r "lat=\(.latitude)&lon=\(.longitude)"';;
  "csv") OUTPUT='-r "\(.latitude),\(.longitude)"';;
  "json"|*) OUTPUT='-Mc pick(.latitude,.longitude)';;
esac

# Try user-set constant geolocation
FILE="$XDG_CONFIG_HOME/ip.json"
if [ ! -f "$FILE" ]; then
  # If not, try automatically generated ip file
  FILE="$XDG_CACHE_HOME/ip.json"
fi
if [ ! -f "$FILE" ]; then
  # If not, give up and say (0,0)
  FILE="/tmp/ip-null.json"
  echo '{"latitude":0,"longitude":0}' > "$FILE"
fi

cat "$FILE" | jq $OUTPUT
