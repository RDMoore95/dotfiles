#!/usr/bin/bash

running=$(swaymsg -t get_tree | grep obsidian)
if [ -z "$running" ]
then
    exec flatpak run md.obsidian.Obsidian &
fi

swaymsg workspace number 9
