#!/bin/env sh

# Alternative Steam start script
# Call this file from /usr/share/applications/steam.desktop

# Effects makes things look nicer normally, but messes with game windows and reduces performance
hyprctl --batch "\
  keyword monitor DP-2,1920x1080@165,-1000x1000,1;\
  keyword windowrulev2 opacity 1.0 override 1.0 override,class:.*
  keyword general:gaps_out 0;\
  keyword animations:enabled 0;\
  keyword decoration:drop_shadow 0;\
  keyword decoration:blur:enabled 0;\
  keyword general:border_size 0;\
  keyword decoration:rounding 0;\
  keyword decoration:dim_inactive 0;"

#  keyword general:gaps_in 0;\

# Run Steam with Gamemode
gamemoderun steam-native $@

# Restore effects
hyprctl reload

