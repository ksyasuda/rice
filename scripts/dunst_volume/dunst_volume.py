#!/usr/bin/env python
"""
Script to send notification whenever the volume is changed through the
multi-media keys on my laptop.
"""

import os
import sys
import subprocess
from pathlib import Path
import config


def execute_with_capture(command: list) -> subprocess.CompletedProcess:
    """
    Returns the result of a subprocess.run command with capture output and
    utf-8 encoding.
    """
    return subprocess.run(command, capture_output=True,
                          shell=True, check=True, encoding='UTF-8')


def get_volume() -> int:
    """Returns the volume of the system."""
    args = ['pulsemixer --get-volume']
    proc = execute_with_capture(args)
    output = proc.stdout
    volume = int(output.split(' ')[0])
    return volume


def check_mute() -> int:
    """Returns 1 when system muted. 0 otherwise."""
    args = ['pulsemixer --get-mute']
    proc = execute_with_capture(args)
    return int(proc.stdout)


def get_icon_path(volume: int) -> str:
    """Gets the icons path based on the current volume."""
    # base_dir = pathlib.Path('/usr/share/icons/gnome/16x16/status/')
    base_dir = Path(config.BASE_DIR)
    if volume == 0:
        path = base_dir.joinpath(config.MUTED)
    elif 0 < volume < 40:
        path = base_dir.joinpath(config.LOW)
    elif 40 <= volume < 70:
        path = base_dir.joinpath(config.MEDIUM)
    elif volume >= 70:
        path = base_dir.joinpath(config.HIGH)
    return str(path)


def main(event: str) -> None:
    """Main driver function."""
    if event in ('increase', 'decrease'):
        volume = get_volume()
        icon_path = get_icon_path(volume)
        output_command = f'dunstify -i {icon_path} -h \
            string:x-dunst-stack-tag:audio "Volume: {volume}%" -h \
            int:value:{volume}'
    elif event == 'mute':
        muted = check_mute()
        if muted:
            icon_path = get_icon_path(0)
            output_command = f'dunstify -i {icon_path} -h \
                string:x-dunst-stack-tag:audio "Volume: Muted" -h \
                int:value:0'
        else:
            volume = get_volume()
            icon_path = get_icon_path(volume)
            output_command = f'dunstify -i {icon_path} -h \
                string:x-dunst-stack-tag:audio "Volume: {volume}%" -h \
                int:value:{volume}'
    os.system(output_command)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('not nice')
        sys.exit(1)
    e = sys.argv[1]
    main(e)
