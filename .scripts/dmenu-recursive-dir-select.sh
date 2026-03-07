#!/bin/bash

search_path="$HOME"
crit_notification_hold=8000

# Account for custom path as input argument
if [[ ! -z $1 ]]; then
    search_path=$1
fi

# TODO include initial dir in fd output
sel_dir="$($FINDCMD --type directory $search_path 2>/dev/null | awk '{ print length, $0 }' | sort -h | cut -d" " -f 2- | $DMENUCMD)"
if [[ -z $sel_dir ]]; then
    exit 1
fi
if [[ ! -d $sel_dir ]]; then
    notify-send -u critical -t $crit_notification_hold "Directory does not exist"
    exit 1
fi

echo $sel_dir

