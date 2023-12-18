#!/bin/env sh

HEADPHONES='alsa_output.usb-Corsair_CORSAIR_HS70_Pro_Wireless_Gaming_Headset-00.analog-stereo'
SPEAKERS='alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_1__sink'

HEADPHONES_ICON='󰋋'
SPEAKERS_ICON='󰓃'

if [ "$(pactl get-default-sink)" == "${HEADPHONES}" ] ; then
  if [ "${1}" == "change" ]; then
    pactl set-default-sink "${SPEAKERS}"
    echo "${SPEAKERS_ICON}"
  else
    echo "${HEADPHONES_ICON}"
  fi
else
  if [ "${1}" == "change" ]; then
    pactl set-default-sink "${HEADPHONES}"
    echo "${HEADPHONES_ICON}"
  else
    echo "${SPEAKERS_ICON}"
  fi
fi

