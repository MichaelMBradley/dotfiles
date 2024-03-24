#!/bin/env sh

source ~/scripts/env_vars.sh

API_KEY_FILE="$XDG_STATE_HOME/openweathermap/api-key.txt"
DATA_FILE="$XDG_STATE_HOME/openweathermap/data.json"

if [ ! -f "$API_KEY_FILE" ]; then
  exit 1
fi

# If file is recent then there's no need to get new data
# OpenWeatherMap updates every 10 minutes
if [ ! -f "$DATA_FILE" ] || [ "$(find "$DATA_FILE" -mmin +10)" ]; then
  curl 'https://api.openweathermap.org/data/3.0/onecall?'"$(~/scripts/geolocation.sh uri)"'&units=metric&appid='"$(cat "$API_KEY_FILE")" -s -o "$DATA_FILE"
fi

cat "$DATA_FILE"
