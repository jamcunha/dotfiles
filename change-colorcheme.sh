#!/bin/env bash

option=$1

if [[ $option == "" ]]; then
    echo "Please insert a colorscheme"
    exit
fi

if [[ $option = "--colorschemes" ]]; then
    echo "Available colorschemes: nord, dracula"
    exit
fi

change_dracula () {
    # Alacritty
    if [[ -e "$HOME/.config/alacritty/alacritty.yml" ]]; then
        sed -i "s/colors: \*.*$/colors: \*Dracula/" $HOME/.config/alacritty/alacritty.yml
    fi

    # i3
    if [[ -e "$HOME/.config/i3/config" ]]; then
        sed -i "s/\w*.conf$/dracula.conf/" $HOME/.config/i3/config
    fi

    #bspwm
    if [[ -e "$HOME/.config/bspwm/bspwmrc" ]]; then
        sed -i "s/colorschemes\/.*.sh/colorschemes\/dracula.sh/" $HOME/.config/bspwm/bspwmrc
    fi

    # Polybar
    if [[ -e "$HOME/.config/polybar/config.ini" ]]; then
        sed -i "s/themes\/\w*.ini/themes\/dracula.ini/" $HOME/.config/polybar/config.ini
    fi

    # Rofi
    if [[ -e "$HOME/.config/rofi/config.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/config.rasi
    fi

    if [[ -e "$HOME/.config/rofi/powermenu/powermenu.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/dracula.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi
    fi

    # Dunst
    if [[ -e "$HOME/.config/dunst/dunstrc" && -e "$HOME/.config/dunst/colorschemes/dracula" ]]; then
        cp $HOME/.config/dunst/colorschemes/dracula $HOME/.config/dunst/dunstrc
    fi

    # Flatpak
    if command -v flatpak &> /dev/null && [ -d "$HOME/.themes/dracula-gtk/" ]; then
        sudo flatpak override --env=GTK_THEME=dracula-gtk
    fi
}

change_nord () {
    # Alacritty
    if [[ -e "$HOME/.config/alacritty/alacritty.yml" ]]; then
        sed -i "s/colors: \*.*$/colors: \*Nord/" $HOME/.config/alacritty/alacritty.yml
    fi

    # i3
    if [[ -e "$HOME/.config/i3/config" ]]; then
        sed -i "s/\w*.conf$/nord.conf/" $HOME/.config/i3/config
    fi

    #bspwm
    if [[ -e "$HOME/.config/bspwm/bspwmrc" ]]; then
        sed -i "s/colorschemes\/.*.sh/colorschemes\/nord.sh/" $HOME/.config/bspwm/bspwmrc
    fi

    # Polybar
    if [[ -e "$HOME/.config/polybar/config.ini" ]]; then
        sed -i "s/themes\/\w*.ini/themes\/nord.ini/" $HOME/.config/polybar/config.ini
    fi

    # Rofi
    if [[ -e "$HOME/.config/rofi/config.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/config.rasi
    fi

    if [[ -e "$HOME/.config/rofi/powermenu/powermenu.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/nord.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi
    fi

    # Dunst
    if [[ -e "$HOME/.config/dunst/dunstrc" && -e "$HOME/.config/dunst/colorschemes/dracula" ]]; then
        cp $HOME/.config/dunst/colorschemes/nord $HOME/.config/dunst/dunstrc
    fi

    # Flatpak
    if command -v flatpak &> /dev/null && [ -d "$HOME/.themes/Nordic-GTK-Theme/" ]; then
        sudo flatpak override --env=GTK_THEME=Nordic-GTK-Theme
    fi
}

restart_wm () {
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
    "nord") 
        sudo clear
        change_nord
        ;;
    "dracula") 
        sudo clear
        change_dracula
        ;;
    *)
        echo "Usage: change-colorscheme [colorscheme]"
        ;;
esac

restart_wm

