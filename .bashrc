#
# ~/.bashrc
#

export PATH=$HOME/.scripts:$HOME/.scripts/notifications:$PATH

export TERMCMD=st
export EDITOR="$(if ! command -v nvim &> /dev/null; then echo 'vim'; else echo 'nvim'; fi)"

export XDG_CONFIG_HOME="$HOME/.config"
export LC_ALL="en_US.UTF-8"
export GPG_TTY=$(tty)

# --- Scripts specific ---
export FINDCMD="fd --hidden --absolute-path ."
export GREPCMD="rg --with-filename --no-heading --max-filesize=500M --maxdepth=5 ."
export DMENUCMD="rofi -dmenu -i"
export FZFCMD="fzf"
export CRIT_NOTIFICATION_HOLD=8000
export ICONS_PATH="$HOME/.local/share/icons/buuf-nestort"

[[ $- != *i* ]] && return

ufetch

source ~/.alias_bash

for i in ~/.specific/enabled-shell/*; do
    echo "Sourcing $i"
    source $i
done

