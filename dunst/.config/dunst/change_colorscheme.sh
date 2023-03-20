#!/bin/env bash

colorscheme=$1

if [[ $colorscheme == "" ]]; then
    echo "No colorscheme selected"
    exit
fi

cp colorschemes/$colorscheme dunstrc

