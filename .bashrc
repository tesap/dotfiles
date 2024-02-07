#
# ~/.bashrc
#

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PLATFORM_SDK_ROOT=$HOME/PlatformSDK

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# TERM=alacritty
# PS1='[\u@\h \W]\$ '

source ~/.alias_bash

if [[ $AURORA_SDK ]]; then
    PS1="PlatformSDK $PS1"

    [ -d /etc/bash_completion.d ] && for i in /etc/bash_completion.d/*;do . $i;done
fi
