#!/bin/env sh

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

CSV='-r "\(.latitude),\(.longitude)"'
JSON='-Mc pick(.latitude,.longitude)'
TILE_ZOOM="7"
TILE_SIZE="256"
TILE_CALC='map_values(.* '"$((1 << TILE_ZOOM))"' / '"$TILE_SIZE"') | map_values(floor)'
TILE_FMT='-r "'"$TILE_ZOOM"'/\(.latitude)/\(.longitude)"'
URI='-r "lat=\(.latitude)&lon=\(.longitude)"'

LATLNG=$(cat "$FILE" | jq $JSON)

case "$1" in
  "csv") echo $LATLNG | jq $CSV;;
  "json") echo $LATLNG;;
  "tile") echo $LATLNG | jq "$TILE_CALC" | jq $TILE_FMT;;
  "uri") echo $LATLNG | jq $URI;;
  *) echo $LATLNG;;
esac
