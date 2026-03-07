#!/bin/bash

source ~/.vars

# HIST_FILE=~/.dmenu-run-script_history
scripts_dir=~/.scripts
err_file=/tmp/log.err

function history_sort() {
    cat $1 | sort | uniq -c | sort -hr | colrm 1 8
}

# in1=$(history_sort $HIST_FILE)
in1=""
in2=$(find $scripts_dir -type f -mindepth 1 -printf '%P\n')

dmenu_result="$(echo "$in1"$'\n'"$in2" | awk '!seen[$0]++' | $DMENUCMD)"
if [[ -z $dmenu_result ]]; then
    exit 1
fi

full_cmd=$scripts_dir/$dmenu_result
full_path=$(echo $full_cmd | awk '{ print $1 }')
if [[ ! -f $full_path ]]; then
    notify-send -u critical -t $CRIT_NOTIFICATION_HOLD "File does not exist"
    exit 1
fi

# echo $dmenu_result >> $HIST_FILE
rm -f $err_file
cmd_result=$($full_cmd 2> $err_file)

if [[ -s $err_file ]]; then
    notify-send -u critical -t $CRIT_NOTIFICATION_HOLD "Error" "$(cat $err_file)"
    exit 1
fi

if [[ -n $cmd_result ]]; then
    notify-send -t 2000 -- "$cmd_result"
fi




