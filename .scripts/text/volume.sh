#! /bin/bash

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{ print $5 }')
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
input_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{ print $2 }')

if [[ $muted == "yes" ]]; then
    muted=" 🔇"
else 
    muted=""
fi

if [[ $input_muted == "yes" ]]; then
    input_muted="🔕"
else 
    input_muted=""
fi

echo $vol$muted$input_muted
