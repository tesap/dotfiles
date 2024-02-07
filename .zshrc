#!/usr/bin/sh
#
PATH=$PATH:$HOME/.bin/bin:$HOME/.applications:$HOME/.cargo/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export EDITOR="$(if ! command -v nvim &> /dev/null; then echo 'vim'; else echo 'nvim'; fi)"

export ZSH="$HOME/.zsh"
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

ZSH_THEME="af-magic"
# ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide)

source $ZSH/oh-my-zsh.sh

# source ~/.alias_bash
source ~/.alias_zsh

source ~/.bashrc

source ~/.vars

# [[ -z $DISPLAY ]] && startx

export QSYS_ROOTDIR="/home/void/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

[ -f "/home/void/.ghcup/env" ] && source "/home/void/.ghcup/env" # ghcup-env

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/void/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/void/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

