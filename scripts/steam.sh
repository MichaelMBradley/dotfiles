#!/bin/env sh

# Alternative Steam start script
# Call this file from /usr/share/applications/steam.desktop

~/scripts/gametime.sh on

# Run Steam with Gamemode
gamemoderun steam-native "$@"

~/scripts/gametime.sh off
