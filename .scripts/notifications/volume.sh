#!/bin/bash

# === AdwaitaLegacy ===
# ICON_VOL_OK="/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-high.png"
# ICON_VOL_MUTED="/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-muted.png"

# === buuf_nestort ===
ICON_VOL_OK="/usr/share/icons/buuf-nestort/status/audio-volume-medium.png"
ICON_VOL_MUTED="/usr/share/icons/buuf-nestort/status/audio-volume-muted.png"

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{ print $5 }')
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')

if [[ $muted == "yes" ]]; then
    icon=$ICON_VOL_MUTED
else
    icon=$ICON_VOL_OK
fi

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:value_change \
    -h string:image-path:"$icon" \
    -h int:value:"$vol" \
    "Volume: $vol"
