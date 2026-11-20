#!/bin/bash

if [[ -f /bin/pactl ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [[ -f /bin/amixer ]]; then
    amixer set Master 5%-
else
    echo "Not found pactl or amixer"
    exit 1
fi
