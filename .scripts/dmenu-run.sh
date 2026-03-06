#!/bin/bash

# DMENUCMD="dmenu -fn 40"
# DMENUCMD="rofi -dmenu"
DMENUCMD="rofi -dmenu -font 'Noto Sans 20'"
HIST_FILE=~/.dmenu_notify_history
SCRIPTS_DIR=~/.scripts
ERR_FILE=/tmp/log.err

function history_sort() {
    cat $1 | sort | uniq -c | sort -hr | colrm 1 8
}

in1=$(history_sort $HIST_FILE)
in2=$(find $SCRIPTS_DIR -type f -mindepth 1 -printf '%P\n')

dmenu_result="$(echo "$in1"$'\n'"$in2" | awk '!seen[$0]++' | eval $DMENUCMD)"
if [[ -z $dmenu_result ]]; then
    exit 1
fi

full_path=$SCRIPTS_DIR/$dmenu_result
if [[ ! -f $full_path ]]; then
    notify-send -u critical -t 2000 "File does not exist"
    exit 1
fi

echo $dmenu_result >> $HIST_FILE
rm $ERR_FILE
script_result=$($full_path 2> $ERR_FILE)

if [[ -s $ERR_FILE ]]; then
    notify-send -u critical -t 8000 "Error" "$(cat $ERR_FILE)"
    exit 1
fi

if [[ -n $script_result ]]; then
    notify-send -t 2000 "$script_result"
fi




