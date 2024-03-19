#!/bin/env sh

if [ "$(uname -n)" == "chonk" ]; then
  hyprctl dispatch workspace 3
  ydotool mousemove -x 90 -y 0
  hyprctl dispatch -- exec kitty -o allow_remote_control="yes" --listen-on "unix:/tmp/kitty-command-1"
  sleep 0.5
  hyprctl dispatch -- exec kitty -o allow_remote_control="yes" --listen-on "unix:/tmp/kitty-command-2"
  ydotool mousemove -x 0 -y 90
  sleep 0.5
  hyprctl dispatch -- exec kitty -o allow_remote_control="yes" --listen-on "unix:/tmp/kitty-command-3"
  sleep 0.5
  kitty @ --to 'unix:/tmp/kitty-command-1' send-text "c\n"
  kitty @ --to 'unix:/tmp/kitty-command-3' send-text "btop\n"
  sleep 0.5
  hyprctl dispatch resizeactive 0 -270
  hyprctl dispatch workspace 1
fi

