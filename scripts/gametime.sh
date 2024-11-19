#!/bin/env sh

if [ "$#" -gt "1" ]; then
  exit 1
fi

MONITOR='DP-3'
MOVE_MONITOR="keyword monitor ${MONITOR},1920x1080@165,-1000x1000,1"
ROUNDING='keyword decoration:rounding 0'

on() {
  hyprctl --batch "\
    ${MOVE_MONITOR};\
    ${ROUNDING};"
}

off() {
  hyprctl reload
}

full() {
  hyprctl --batch "\
    ${MOVE_MONITOR};\
    keyword windowrulev2 opacity 1.0 override 1.0 override,class:.*
    keyword general:gaps_out 0;\
    keyword animations:enabled 0;\
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword general:border_size 0;\
    ${ROUNDING};\
    keyword decoration:dim_inactive 0;"
    #  keyword general:gaps_in 0;\
}

status() {
  hyprctl monitors -j | jq -Mcr 'any([.x, .y] == [0, 0]) | not'
}

toggle() {
  if [ "$(status)" = "true" ]; then
    off
  else
    on
  fi
}

case "$1" in
  "on") on;;
  "off") off;;
  "full") full;;
  "status") status;;
  "toggle" | "") toggle;;
  *) echo "Unknown argument"; exit 1;;
esac
