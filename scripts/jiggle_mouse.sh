#!/bin/env sh

# Jiggles mouse to prevent sleep
while true; do
  xdotool mousemove_relative -- -10 0
  xdotool mousemove_relative -- 10 0
done

