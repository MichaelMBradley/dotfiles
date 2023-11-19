#!/bin/sh

# Based on stuff I saw on Stack Overflow
# Script is meant to launch VLC playing all audio tracks
# Never got it to work on Linux though
vlc --sout-all --sout '#display $1%'

