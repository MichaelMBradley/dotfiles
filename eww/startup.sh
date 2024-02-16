#!/bin/env sh

eww daemon

if [ "$(uname -n)" == "chonk" ]; then
  eww open-many left right above
else
  eww open laptop
fi

