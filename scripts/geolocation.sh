#!/bin/env sh

case "$1" in
  "uri") OUTPUT='-r "lat=\(.latitude)&lon=\(.longitude)"';;
  "csv") OUTPUT='-r "\(.latitude),\(.longitude)"';;
  "json"|*) OUTPUT='-Mc pick(.latitude,.longitude)';;
esac

FILE="$XDG_STATE_HOME/ip.json"
if [ ! -f "$FILE" ]; then
  FILE="/tmp/ip-null.json"
  echo '{"latitude":0,"longitude":0}' > "$FILE"
fi

cat "$FILE" | jq $OUTPUT
