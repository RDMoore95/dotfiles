#!/usr/bin/bash

running=$(i3-msg -t get_tree | grep obsidian)
if [ -z "$running" ]
then
    exec flatpak run md.obsidian.Obsidian &
fi

i3-msg workspace number 9
