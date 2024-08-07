#!/usr/bin/env bash

option=$1

if [[ $option == "" ]]; then
    echo "Please insert a colorscheme"
    exit
fi

if [[ $option = "--colorschemes" ]]; then
    echo "Available colorschemes: nord, dracula, tokyonight, catppuccin"
    exit
fi

change_catppuccin () {
    # Alacritty
    if [[ -e "$HOME/.config/alacritty/alacritty.toml" ]]; then
        sed -i "s/themes\/.*\./themes\/catppuccin./" $HOME/.config/alacritty/alacritty.toml
    fi

    # i3
    if [[ -e "$HOME/.config/i3/config" ]]; then
        sed -i "s/\w*.conf$/catppuccin.conf/" $HOME/.config/i3/config
    fi

    #bspwm
    if [[ -e "$HOME/.config/bspwm/bspwmrc" ]]; then
        sed -i "s/colorschemes\/.*.sh/colorschemes\/catppuccin.sh/" $HOME/.config/bspwm/bspwmrc
    fi

    # Polybar
    if [[ -e "$HOME/.config/polybar/config.ini" ]]; then
        sed -i "s/themes\/\w*.ini/themes\/catppuccin.ini/" $HOME/.config/polybar/config.ini
    fi

    # Rofi
    if [[ -e "$HOME/.config/rofi/config.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/catppuccin.rasi\"/" $HOME/.config/rofi/config.rasi
    fi

    if [[ -e "$HOME/.config/rofi/powermenu/powermenu.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/catppuccin.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi
    fi

    # Dunst
    if [[ -e "$HOME/.config/dunst/dunstrc" && -e "$HOME/.config/dunst/colorschemes/tokyonight" ]]; then
        cp $HOME/.config/dunst/colorschemes/catppuccin $HOME/.config/dunst/dunstrc
    fi

    # Flatpak
    if command -v flatpak &> /dev/null && [ -d "$HOME/.themes/tokyonight-gtk/" ]; then
        sudo flatpak override --env=GTK_THEME=tokyonight-gtk // TODO
    fi
}

change_tokyonight () {
    # Alacritty
    if [[ -e "$HOME/.config/alacritty/alacritty.toml" ]]; then
        sed -i "s/themes\/.*\./themes\/tokyo-night./" $HOME/.config/alacritty/alacritty.toml
    fi

    # i3
    if [[ -e "$HOME/.config/i3/config" ]]; then
        sed -i "s/\w*.conf$/tokyonight.conf/" $HOME/.config/i3/config
    fi

    #bspwm
    if [[ -e "$HOME/.config/bspwm/bspwmrc" ]]; then
        sed -i "s/colorschemes\/.*.sh/colorschemes\/tokyonight.sh/" $HOME/.config/bspwm/bspwmrc
    fi

    # Polybar
    if [[ -e "$HOME/.config/polybar/config.ini" ]]; then
        sed -i "s/themes\/\w*.ini/themes\/tokyonight.ini/" $HOME/.config/polybar/config.ini
    fi

    # Rofi
    if [[ -e "$HOME/.config/rofi/config.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/tokyonight.rasi\"/" $HOME/.config/rofi/config.rasi
    fi

    if [[ -e "$HOME/.config/rofi/powermenu/powermenu.rasi" ]]; then
        sed -i "s/colorschemes\/.*/colorschemes\/tokyonight.rasi\"/" $HOME/.config/rofi/powermenu/powermenu.rasi
    fi

    # Dunst
    if [[ -e "$HOME/.config/dunst/dunstrc" && -e "$HOME/.config/dunst/colorschemes/tokyonight" ]]; then
        cp $HOME/.config/dunst/colorschemes/tokyonight $HOME/.config/dunst/dunstrc
    fi

    # Flatpak
    if command -v flatpak &> /dev/null && [ -d "$HOME/.themes/tokyonight-gtk/" ]; then
        sudo flatpak override --env=GTK_THEME=tokyonight-gtk
    fi
}

change_dracula () {
    # Alacritty
    if [[ -e "$HOME/.config/alacritty/alacritty.toml" ]]; then
        sed -i "s/themes\/.*\./themes\/dracula./" $HOME/.config/alacritty/alacritty.toml
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
    if [[ -e "$HOME/.config/alacritty/alacritty.toml" ]]; then
        sed -i "s/themes\/.*\./themes\/nord./" $HOME/.config/alacritty/alacritty.toml
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
    "tokyonight")
        sudo clear
        change_tokyonight
        ;;
    "catppuccin")
        sudo clear
        change_catppuccin
        ;;
    *)
        echo "Usage: change-colorscheme [colorscheme]"
        ;;
esac

restart_wm

