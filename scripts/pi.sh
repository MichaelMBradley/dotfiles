#!/bin/env sh

# Runs y-cruncher over and over to heat up CPU

which y-cruncher
if [ "$?" = "1" ]; then
  exit 1
fi

while true; do
  echo -e '0\n1\n7\n' | y-cruncher
done

