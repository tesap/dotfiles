#!/bin/bash

search_path="$HOME"
crit_notification_hold=8000

# Account for custom path as input argument
if [[ ! -z $1 ]]; then
    search_path=$1
fi

sel_file="$($FINDCMD --type file $search_path 2>/dev/null | awk '{ print length, $0 }' | sort -h | cut -d" " -f 2- | $DMENUCMD)"
if [[ -z $sel_file ]]; then
    exit 1
fi
if [[ ! -e $sel_file ]]; then
    notify-send -u critical -t $crit_notification_hold "File does not exist"
    exit 1
fi

echo $sel_file

