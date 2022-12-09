#!/bin/env bash

option=$1

if [[ $option == "" ]]; then
    echo "Please insert a colorscheme"
    exit
fi

change_dracula () {
    # Alacritty
    sed -i "s/colors: \*.*$/colors: \*Dracula/" $HOME/.config/alacritty/alacritty.yml

    # i3
    sed -i "s/\w*.conf$/dracula.conf/" $HOME/.config/i3/config

    # Polybar
    sed -i "s/themes\/\w*.ini/themes\/dracula.ini/" $HOME/.config/polybar/config.ini

    # Rofi
    sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/config.rasi
    sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi

    # Restart i3
    if [[ $XDG_CURRENT_DESKTOP == "i3" ]]; then
        i3-msg restart >> /dev/null
    fi
}

change_nord () {
    # Alacritty
    sed -i "s/colors: \*.*$/colors: \*Nord/" $HOME/.config/alacritty/alacritty.yml

    # i3
    sed -i "s/\w*.conf$/nord.conf/" $HOME/.config/i3/config

    # Polybar
    sed -i "s/themes\/\w*.ini/themes\/nord.ini/" $HOME/.config/polybar/config.ini

    # Rofi
    sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/config.rasi
    sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi

    # Restart i3
    if [[ $XDG_CURRENT_DESKTOP == "i3" ]]; then
        i3-msg restart >> /dev/null
    fi
}

case "$option" in
    "--colorschemes")
        echo "Available colorschemes: nord, dracula"
    ;;
    "nord") 
        change_nord
    ;;
    "dracula") 
        change_dracula
    ;;
    *) echo "Usage: change-colorscheme [colorscheme]"
    ;;
esac

