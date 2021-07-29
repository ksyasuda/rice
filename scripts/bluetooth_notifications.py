#!/usr/bin/env python
"""Sends notifications through dunst when connected or disonnected to bluetooth."""

import sys
import os


def parse_device_name(dname: str) -> str:
    """Inline method to parse out the mac id from the device_name str."""
    parts = dname.split(' ')
    # parts[2:] since incoming str = "Device [mac_id] [name]"
    dname = ' '.join(parts[2:])
    return dname


def get_icon_path(arg: str) -> str:
    """Gets the icon path based on the passed in arg [connected | disconnected]"""
    base_dir = '/usr/share/icons/hicolor/48x48/status/bluetooth-'
    if arg == 'connected':
        base_dir += 'active'
    elif arg == 'disconnected':
        base_dir += 'disabled'
    base_dir += '.png'
    return base_dir


def output_notification(arg: str, path: str, device_name: str = 'Bluetooth\
                        Device') -> None:
    """Sends a notification with icon: path."""
    new_name = parse_device_name(device_name)
    command = f'dunstify -i {path} '
    if arg == 'connected':
        command += f'"Connected to {new_name}."'
    else:
        command += f'"Disconnected from {new_name}."'
    os.system(command)


def main(arg: str, device_name):
    """The driver function."""
    if arg == 'connected':
        path = get_icon_path('connected')
    elif arg == 'disconnected':
        path = get_icon_path('disconnected')
    output_notification(arg, path, device_name)



if __name__ == '__main__':
    if len(sys.argv) != 3:
        sys.exit(1)
    # [connected|disconnected], [device_name]
    main(sys.argv[1], sys.argv[2])
