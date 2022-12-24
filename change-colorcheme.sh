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

    #bspwm
    sed -i "s/colorschemes\/.*.sh/colorschemes\/dracula.sh/" $HOME/.config/bspwm/bspwmrc

    # Polybar
    sed -i "s/themes\/\w*.ini/themes\/dracula.ini/" $HOME/.config/polybar/config.ini

    # Rofi
    sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/config.rasi
    sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi

    # Dunst
    cp $HOME/.config/dunst/colorschemes/dracula $HOME/.config/dunst/dunstrc
    pkill dunst

    # Restart Window Manager
    case $XDG_SESSION_DESKTOP in
        "i3")
            i3-msg restart >> /dev/null
            ;;
        "bspwm")
            bspc wm -r >> /dev/null
            ;;
    esac
}

change_nord () {
    # Alacritty
    sed -i "s/colors: \*.*$/colors: \*Nord/" $HOME/.config/alacritty/alacritty.yml

    # i3
    sed -i "s/\w*.conf$/nord.conf/" $HOME/.config/i3/config

    #bspwm
    sed -i "s/colorschemes\/.*.sh/colorschemes\/nord.sh/" $HOME/.config/bspwm/bspwmrc

    # Polybar
    sed -i "s/themes\/\w*.ini/themes\/nord.ini/" $HOME/.config/polybar/config.ini

    # Rofi
    sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/config.rasi
    sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi

    # Dunst
    cp $HOME/.config/dunst/colorschemes/nord $HOME/.config/dunst/dunstrc
    pkill dunst

    # Restart Window Manager
    case $XDG_SESSION_DESKTOP in
        "i3")
            i3-msg restart >> /dev/null
            ;;
        "bspwm")
            bspc wm -r >> /dev/null
            ;;
    esac
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
    *)
        echo "Usage: change-colorscheme [colorscheme]"
        ;;
esac

