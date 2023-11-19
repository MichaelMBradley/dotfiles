#!/bin/env sh

# Sets the sensitivity for my mouse
# ./mouse_sens.sh [sens]
# Sensitivity defaults to 1

sens=$1
if [[ "$sens" == "" ]] ; then
  sens="1"
fi

xinput set-prop "Glorious Model O Wireless" "Coordinate Transformation Matrix" $sens 0 0 0 $sens 0 0 0 1
xinput set-prop "Glorious Model O Wireless" "libinput Accel Profile Enabled" 0, 1

