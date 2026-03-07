#!/usr/bin/sh

# source ~/.alias_bash
# source ~/.vars
source ~/.alias_zsh
source ~/.bashrc

export HISTSIZE=1000000
export ZSH="$HOME/.zsh"

DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

# ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# /// Setup title
DISABLE_AUTO_TITLE="true"
autoload -Uz add-zsh-hook
lastcmd=""

function set_title() {
    source ~/.scripts/bin/set-title-zsh.sh "($(pwd)) $lastcmd"
}
function preexec() {
    lastcmd=$1
    set_title
}
function precmd() {
    set_title
}
add-zsh-hook -Uz preexec preexec
add-zsh-hook -Uz precmd precmd
# ///

