#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$PATH"

# Flutter Stuff
export PATH="$HOME/.local/flutter/bin/:$PATH"
export PATH="$HOME/.local/android-sdk/cmdline-tools/latest/bin/:$PATH"
export PATH="$HOME/.local/android-sdk/emulator/:$HOME/.local/android-sdk/build-tools/:$HOME/.local/android-sdk/platform-tools/:$HOME/.local/android-sdk/platforms/:$HOME/.local/android-sdk/cmdline-tools/:$PATH"

# Minix Stuff
alias minix="cd $HOME/.local/oracle-vb/MINIX-LCOM/shared/"

export EDITOR="nvim"
export BROWSER="brave"
export TERMINAL="alacritty"
export TERM="xterm-256color"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start ssh agent at shell start
if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval "$(ssh-agent -s)" > /dev/null 2>&1
        ssh-add ~/.ssh/github_rsa > /dev/null 2>&1
        ssh-add ~/.ssh/feup-gitlab > /dev/null 2>&1
fi

alias ls="exa -lah --color=always --group-directories-first"
alias vim="nvim"
alias repos="cd $HOME/Documents/repos"
alias code="bash code $1 &> /dev/null"

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
. "$HOME/.cargo/env"
