#
# ~/.bashrc
#

export EDITOR="nvim"
export BROWSER="brave"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start ssh agent at shell start
if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval "$(ssh-agent -s)" > /dev/null 2>&1
        ssh-add ~/.ssh/github_rsa > /dev/null 2>&1
fi

alias ls="exa -lah --color=always --group-directories-first"
alias dotties="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias vim="nvim"

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
