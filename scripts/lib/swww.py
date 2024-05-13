"""Basic functions for interacting with swww"""
from json import loads
from pathlib import Path
from random import sample
from shlex import split
from socket import gethostname
from subprocess import run


MONITORS = ("DP-1", "DP-2", "HDMI-A-1") if gethostname() == "chonk" else ("eDP-1",)

ANGLE_TRANSITION_ARGS = [
	"--transition-type", "wipe",
	"--transition-angle", "30",
	"--transition-step", "45",
	"--transition-fps", "60",
]
IMMEDIATE_TRANSITION_ARGS = [
	"--transition-step", "255",
]


def _run_cmd(arg0: str, *args: str) -> str:
	return run([arg0, *args] if args else split(arg0), capture_output=True).stdout.decode("utf-8")


def monitors() -> list[str]:
	return [monitor["name"] for monitor in loads(_run_cmd("hyprctl monitors -j"))]


def run_swww(monitor: str, image: Path, extra_args: list[str] | None = None) -> None:
	run(["swww", "img", "-o", monitor, image, *(extra_args or [])])


def get_wallpapers() -> list[Path]:
	return list(Path("/usr/share/backgrounds/Wallpapers/").glob("*"))


def sample_wallpapers(displays: list[str] | None = None) -> "zip[tuple[str, Path]]":
	if displays is None:
		displays = monitors()
	return zip(displays, sample(get_wallpapers(), len(displays)))

