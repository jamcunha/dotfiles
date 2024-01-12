#!/bin/env bash

if [[ $(xrandr -q | grep "HDMI-1-2") == *disconnected* ]]; then
    exit
fi


if [[ $DUAL_MODE == "external" ]]; then
    xrandr --output HDMI-1-2 --primary --mode 1920x1080 --rotate normal --output eDP-1-1 --mode 1920x1080 --rotate normal --right-of HDMI-1-2

    if [ -f $HOME/.config/alacritty/alacritty.yml ]; then
      sed -i "s/size: .*$/size: 10.0/" $HOME/.config/alacritty/alacritty.yml
    fi
elif [[ $DUAL_MODE == "laptop" ]]
    xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1-2 --mode 1920x1080 --rotate normal --right-of eDP-1-1

    if [ -f $HOME/.config/alacritty/alacritty.yml ]; then
      sed -i "s/size: .*$/size: 9.0/" $HOME/.config/alacritty/alacritty.yml
    fi
fi

bspc monitor HDMI-1-2 -d 1 2 3 4 5 6 7 8 9 10
bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7 8 9 10

