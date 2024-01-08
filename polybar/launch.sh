#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

if [ "$(uname -n)" == "chonk" ]; then
  # Launch Polybar, using default config location ~/.config/polybar/config.ini
  polybar -r main_desktop 2>&1 | tee -a /tmp/polybar-m.log & disown
  polybar -r side_desktop 2>&1 | tee -a /tmp/polybar-s.log & disown
  polybar -r top_desktop 2>&1 | tee -a /tmp/polybar-t.log & disown
else
  polybar -r main_laptop 2>&1 | tee -a /tmp/polybar.log & disown
fi

