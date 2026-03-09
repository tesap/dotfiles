#!/bin/bash

source ~/.vars

scripts_dir=~/.scripts
err_file=/tmp/log.err

dmenu_result="$(find $scripts_dir -type f -mindepth 1 -printf '%P\n' | awk '!seen[$0]++' | $DMENUCMD)"
if [[ -z $dmenu_result ]]; then
    exit 1
fi

full_cmd=$scripts_dir/$dmenu_result
full_path=$(echo $full_cmd | cut -d' ' -f 1)
if [[ ! -f $full_path ]]; then
    notify-send -u critical -t $CRIT_NOTIFICATION_HOLD "File does not exist"
    exit 1
fi

rm -f $err_file
cmd_result=$($full_cmd 2> $err_file)

if [[ -s $err_file ]]; then
    notify-send -u critical -t $CRIT_NOTIFICATION_HOLD "Error" "$(cat $err_file)"
    exit 1
fi

if [[ -n $cmd_result ]]; then
    notify-send -t 2000 -- "$cmd_result"
fi

