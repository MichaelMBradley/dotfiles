#!/bin/env sh

source ~/scripts/env_vars.sh

API_KEY_FILE="$XDG_CONFIG_HOME/openweathermap/api-key.txt"

if [ ! -f "$API_KEY_FILE" ]; then
  exit 1
fi

CACHE_DIR="$XDG_CACHE_HOME/openweathermap"
RAIN_FILE="$CACHE_DIR/rain"

if [ ! -f "$RAIN_FILE" ] || [ "$(find "$RAIN_FILE" -mmin +10)" ]; then
  curl 'https://api.openweathermap.org/data/2.0/weather/PR0/'"$(~/scripts/geolocation.sh tile)"'?appid='"$(cat "$API_KEY_FILE")" -s -o "$RAIN_FILE"
fi

ONE_CALL_FILE="$CACHE_DIR/onecall.json"

# If file is recent then there's no need to get new data
# OpenWeatherMap updates every 10 minutes
if [ ! -f "$ONE_CALL_FILE" ] || [ "$(find "$ONE_CALL_FILE" -mmin +10)" ]; then
  curl 'https://api.openweathermap.org/data/3.0/onecall?'"$(~/scripts/geolocation.sh uri)"'&units=metric&appid='"$(cat "$API_KEY_FILE")" -s -o "$ONE_CALL_FILE"
fi

cat "$ONE_CALL_FILE"
