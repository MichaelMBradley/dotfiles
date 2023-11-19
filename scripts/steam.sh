#!/bin/env sh

# Alternative Steam start script

# Call this file from /usr/share/applications/steam.desktop

# Picom makes things look nicer normally, but messes with game windows and reduces performance
killall picom
# Run Steam with Gamemode
gamemoderun steam-runtime $@
# Restore picom
picom -b

