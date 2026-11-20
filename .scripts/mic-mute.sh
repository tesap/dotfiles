#!/bin/bash

# Perform mute toggle
if [[ -f /bin/pactl ]]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
elif [[ -f /bin/amixer ]]; then
    amixer set Capture toggle >/dev/null
else
    echo "Not found pactl or amixer"
    exit 1
fi
