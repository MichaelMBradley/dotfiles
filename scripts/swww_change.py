#!/bin/env python
"""Selects new backgrounds for the monitors"""

from lib.swww import ANGLE_TRANSITION_ARGS, run_swww, sample_wallpapers


for monitor, wallpaper in sample_wallpapers():
	run_swww(monitor, wallpaper, ANGLE_TRANSITION_ARGS)

