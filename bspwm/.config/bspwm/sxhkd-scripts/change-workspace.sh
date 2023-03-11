#!/bin/env bash

if [[ $1 =~ ^[0-9]$ ]]; then
    notify-send "change-workspace bspwm error (invalid workspace)"
    exit
fi

monitor="$(bspc query -M -m focused --names)"

if [ -v $DUAL_MODE ]; then
    bspc desktop -f "$1"
    exit
fi

if [ $DUAL_MODE == external ]; then
    if [ $monitor == eDP-1 ]; then
        bspc desktop -f "$1"
    elif [ $monitor == HDMI-2 ]; then
        bspc desktop -f "^2:$1"
    fi
fi

