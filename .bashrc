#
# ~/.bashrc
#

export PATH="$PATH":"$HOME/.pub-cache/bin":"$HOME/.local/bin":"$HOME/.bin"
export PLATFORM_SDK_ROOT=/home/void/Aurora/psdk
export PLATFORM_SDK_OPENFORTIVPN_CONF=/home/$USER/.config/PlatformSDK/openfortivpn_config

export TERM=alacritty
export EDITOR="$(if ! command -v nvim &> /dev/null; then echo 'vim'; else echo 'nvim'; fi)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

source ~/.alias_bash

if [[ $AURORA_SDK ]]; then
    PS1="PlatformSDK $PS1"

    [ -d /etc/bash_completion.d ] && for i in /etc/bash_completion.d/*;do . $i;done
fi
