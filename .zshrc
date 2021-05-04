#!/usr/bin/sh

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi

xrdb -merge $HOME/.Xresources
export PATH=$HOME/.bin:$HOME/.emacs.d/bin:$PATH

export EDITOR="$(if ! command -v nvim &> /dev/null; then echo 'vim'; else echo 'nvim'; fi)"

export TERMCMD=alacritty
export BROWSER=firefox
export SVDIR=$HOME/.service

export SSH_KEY_PATH="~/.ssh/dsa_id"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
export LC_ALL="en_US.UTF-8"

source ~/.alias_bash
source ~/.alias_zsh

# =============================
export ZSH="/home/$USER/.zsh"
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR


# ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# =============================

if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0101010
  \e]P1f07178
  \e]P2c3e88d
  \e]P3ffcb6b
  \e]P482aaff
  \e]P5c792ea
  \e]P689ddff
  \e]P7d0d0d0
  \e]P8434758
  \e]P9ff8b92
  \e]PAddffa7
  \e]PBffe585
  \e]PC9cc4ff
  \e]PDe1acff
  \e]PEa3f7ff
  \e]PFffffff
  "
  clear
fi

export GPG_TTY=$(tty)
