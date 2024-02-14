#!/bin/env sh

hyprctl dispatch workspace 3
hyprctl dispatch exec kitty
hyprctl dispatch -- exec kitty -o allow_remote_control="yes" --listen-on "unix:/tmp/kitty-command-2"
hyprctl dispatch -- exec kitty -o allow_remote_control="yes" --listen-on "unix:/tmp/kitty-command-3"
sleep 1
kitty @ --to 'unix:/tmp/kitty-command-2' send-text "c\n"
kitty @ --to 'unix:/tmp/kitty-command-3' send-text "btop\n"

