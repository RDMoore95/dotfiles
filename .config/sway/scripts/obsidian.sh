#!/usr/bin/bash

if ! pgrep -x "obsidian" > /dev/null
then
    exec flatpak run md.obsidian.Obsidian &
fi

swaymsg workspace number 9
