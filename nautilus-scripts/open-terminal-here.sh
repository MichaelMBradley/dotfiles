#!/bin/env sh

KITTY_SOCK=(/tmp/kittycommand-*-clear)

if [ "${#KITTY_SOCK[@]}" == "1" ]; then
  kitty @ --to "$KITTY_SOCK[0]" send-text "mv $NAUTILUS_SCRIPT_CURRENT_URI\n"
else
  kitty
fi

