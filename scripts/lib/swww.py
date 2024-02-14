"""Basic functions for interacting with swww"""

from pathlib import Path
from random import sample
from subprocess import run


MONITORS = ("DP-1", "DP-2", "HDMI-A-1")

ANGLE_TRANSITION_ARGS = [
	"--transition-type", "wipe",
	"--transition-angle", "30",
	"--transition-step", "45",
	"--transition-fps", "60",
]
IMMEDIATE_TRANSITION_ARGS = [
	"--transition-step", "255",
]


def run_swww(monitor: str, image: Path, extra_args: list[str] | None = None) -> None:
	run(["swww", "img", "-o", monitor, image, *(extra_args or [])])


def get_wallpapers() -> list[Path]:
	return list(Path("/usr/share/backgrounds/Wallpapers/").glob("*"))


def sample_wallpapers(num: int = len(MONITORS)) -> list[Path]:
	return sample(get_wallpapers(), num)

