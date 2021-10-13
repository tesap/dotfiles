#!/usr/bin/sh

[[ -z $DISPLAY ]] && exec startx

xrdb -merge $HOME/.Xresources
export PATH=$HOME/Applications:$HOME/.bin:$HOME/.emacs.d/bin:/usr/local/bin:$PATH

export EDITOR="$(if ! command -v nvim &> /dev/null; then echo 'vim'; else echo 'nvim'; fi)"

export TERMCMD=alacritty
export BROWSER=firefox
export SVDIR=$HOME/.service

export SSH_KEY_PATH="~/.ssh/dsa_id"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
export LC_ALL="en_US.UTF-8"
export GPG_TTY=$(tty)

# =============================
export ZSH="$HOME/.zsh"
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR


# ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source ~/.alias_bash
source ~/.alias_zsh

# eval "$(zoxide init zsh)"

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash true  
zmodload zsh/complist
compinit
