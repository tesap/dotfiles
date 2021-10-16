#!/bin/sh

set -e

state="%{F#B48EAD}off%{F-}"
cmd="$(systemctl status $1 $2 | grep -i run 2>/dev/null || echo '')"

[[ "$cmd" ]] && state="%{F#86cb9b}on%{F-}"

if [[ -n $2 ]]; then
    echo "$2 ${state}"
else
    echo "$1 ${state}"
fi

exit 0
