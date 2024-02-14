#!/bin/env python
"""Sets a new background for the monitors immediately"""

from lib.swww import IMMEDIATE_TRANSITION_ARGS, MONITORS, run_swww, sample_wallpapers


for monitor, wallpaper in zip(MONITORS, sample_wallpapers()):
	run_swww(monitor, wallpaper, IMMEDIATE_TRANSITION_ARGS)

