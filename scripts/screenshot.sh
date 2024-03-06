#!/bin/env sh

if [ "$(pidof slurp)" == "" ]; then
  hyprshade off
  grimblast copy area
  hyprshade auto
fi

