#!/bin/env bash

if [[ $(xrandr -q | grep "HDMI-2") == *disconnected* ]]; then
    exit
fi

if [ -f $HOME/.config/alacritty/alacritty.yml ]; then
    sed -i "s/size: .*$/size: 10.0/" $HOME/.config/alacritty/alacritty.yml
fi

xrandr --output HDMI-2 --primary --mode 1920x1080 --rotate normal --output eDP-1 --mode 1920x1080 --rotate normal --left-of HDMI-2

bspc monitor HDMI-2 -d 1 2 3 4 5 6 7 8 9 10
bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10

