#!/bin/env sh

hyprctl keyword unbind CONTROL,TAB
rofi -show drun file-browser-extended calc emoji
hyprctl keyword bind 'CONTROL,TAB,exec,/home/mbradley/.config/rofi/launch.sh'

