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

export QSYS_ROOTDIR="/home/void/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"
# [ -f "/home/void/.ghcup/env" ] && source "/home/void/.ghcup/env" # ghcup-env

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/void/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/void/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

