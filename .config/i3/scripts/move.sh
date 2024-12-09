#!/bin/sh

CUR_WORKSPACE=$(i3-msg -t get_outputs | jq -r '.[] | select(.active)' | jq -r '.current_workspace')

if [ $1 == "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ $1 == "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
elif [ $1 == "sov" ]; then
    echo 1 > /tmp/sovpipe
    sleep 1
    echo 0 > /tmp/sovpipe
    exit # vital
fi

if [ $TO_WORKSPACE -eq 11 ]; then
    TO_WORKSPACE=10
elif [ $TO_WORKSPACE -eq 0 ]; then
    TO_WORKSPACE=1
fi

i3-msg move container workspace $TO_WORKSPACE
