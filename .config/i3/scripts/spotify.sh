#!/usr/bin/bash

if ! pgrep -x "spotify_player" > /dev/null
then
    exec alacritty --config-file=~/.config/alacritty/alacritty_opaque.toml --class=spotify-player ~/.cargo/bin/spotify_player &
fi

i3-msg workspace number 10
