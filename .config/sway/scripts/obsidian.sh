#!/usr/bin/bash

running=$(swaymsg -t get_tree | grep obsidian)
if [ -z "$running" ]
then
    exec obsidian &
fi

swaymsg workspace number 9
