#!/bin/sh
if [ "$(uname -n)" == "chonk" ]; then
  xrandr --output DisplayPort-0 --mode 1920x1080 --pos 1920x1404 --rotate normal --rate 165 --output DisplayPort-1 --mode 1920x1080 --pos 0x1404 --rotate normal --rate 165 --primary --output HDMI-A-0 --pos 0x0 --rotate normal --rate 60 --scale 1.3x1.3 --panning 2496x1404
else
  # hpomen
  xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal --rate 144 --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 165 --output DP-4 --off
fi
