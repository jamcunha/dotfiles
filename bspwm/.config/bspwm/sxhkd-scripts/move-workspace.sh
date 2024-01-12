#!/bin/env bash

if [[ $1 =~ ^[0-9]$ ]]; then
    notify-send "move-workspace bspwm error (invalid workspace)"
    exit
fi

monitor="$(bspc query -M -m focused --names)"

if [ -v $DUAL_MODE ]; then
    bspc node -d "$1"
    exit
fi

if [ $DUAL_MODE == external ]; then
    case "$monitor" in
        eDP-1 | eDP-1-1)
            bspc node -d "^2:$1"
        ;;
        HDMI-2 | HDMI-1-2)
            bspc node -d "$1"
        ;;
        *)
        ;;
    esac
elif [ $DUAL_MODE == laptop ]; then
    case "$monitor" in
        eDP-1 | eDP-1-1)
            bspc node -d "$1"
        ;;
        HDMI-2 | HDMI-1-2)
            bspc node -d "^2:$1"
        ;;
        *)
        ;;
    esac
fi

