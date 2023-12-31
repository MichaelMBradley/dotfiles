#!/bin/env sh

HEADPHONES='alsa_output.usb-Audeze_LLC_Audeze_Maxwell_Dongle_0000000000000000-01.analog-stereo'
SPEAKERS='alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_1__sink'

HEADPHONES_ICON='󰋋'
SPEAKERS_ICON='󰓃'

if [ "$(pactl get-default-sink)" == "${HEADPHONES}" ] ; then
  if [ "${1}" == "change" ]; then
    pactl set-default-sink "${SPEAKERS}"
  else
    echo "${HEADPHONES_ICON}"
  fi
else
  if [ "${1}" == "change" ]; then
    pactl set-default-sink "${HEADPHONES}"
  else
    echo "${SPEAKERS_ICON}"
  fi
fi

