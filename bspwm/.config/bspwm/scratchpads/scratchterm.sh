#!/usr/bin/env bash

# Needs xdotool

terminal="alacritty"

winclass="$(xdotool search --class scratchterm)"

if [ -z "$winclass" ]; then
    $terminal --class scratchterm
else
    if [ ! -f /tmp/scratchterm ]; then
        touch /tmp/scratchterm && xdo hide "$winclass"
    elif [ -f /tmp/scratchterm ]; then
        rm /tmp/scratchterm && xdo show "$winclass"
    fi
fi
