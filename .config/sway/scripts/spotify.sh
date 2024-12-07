#!/usr/bin/bash

if ! pgrep -x "spotify_player" > /dev/null
then
    exec footclient --override=colors.alpha=1.0 --app-id=spotify-player ~/.cargo/bin/spotify_player &
fi

swaymsg workspace number 10
