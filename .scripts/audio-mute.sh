#!/bin/bash

if [[ -f /bin/pactl ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [[ -f /bin/amixer ]]; then
    amixer set Master toggle >/dev/null
else
    echo "Not found pactl or amixer"
    exit 1
fi
