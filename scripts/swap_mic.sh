#!/bin/env sh

HEADPHONES='alsa_input.usb-Audeze_LLC_Audeze_Maxwell_Dongle_0000000000000000-01.mono-fallback'
MIC='alsa_input.usb-Generic_Blue_Microphones_LT_2007151539505F39045F_111000-00.analog-stereo'

HEADPHONES_ICON='󰋎'
MIC_ICON=''

if [ "$(pactl get-default-source)" == "${HEADPHONES}" ] ; then
  if [ "${1}" == "change" ]; then
    pactl set-default-source "${MIC}"
  else
    echo "${HEADPHONES_ICON}"
  fi
else
  if [ "${1}" == "change" ]; then
    pactl set-default-source "${HEADPHONES}"
  else
    echo "${MIC_ICON}"
  fi
fi

