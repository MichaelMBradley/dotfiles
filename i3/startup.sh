#!/bin/env sh

function cmd() {
  control_file="unix:/tmp/kittycommand-$(date +%s%N)-$*"
  kitty -o allow_remote_control="yes" --listen-on "$control_file" &
  sleep 1
  kitty @ --to "$control_file" send-text "$*\n"
}

#~/scripts/mouse_sens.sh
#./feh.sh
~/.config/polybar/launch.sh

if [ "$(uname -n)" == "chonk" ]; then
  i3-msg 'workspace 3; append_layout /home/mbradley/.config/i3/startup.json'
  sleep 0.1

  cmd clear
  cmd c
  sleep 0.5
  cmd btop

  i3-msg 'workspace 1'
fi

