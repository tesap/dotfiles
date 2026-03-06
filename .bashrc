#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.alias_bash
source ~/.vars

if [[ $AURORA_SDK ]]; then
    PS1="PlatformSDK $PS1"

    [ -d /etc/bash_completion.d ] && for i in /etc/bash_completion.d/*;do . $i;done
fi
