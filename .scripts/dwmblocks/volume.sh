#! /bin/bash

vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
muted=$(pactl list sinks | grep 'Mute' | head -n 1 | grep no | python -c 'import sys; s=sys.stdin.read(); print(" Muted" if not s else "", end="")')

echo $vol$muted
