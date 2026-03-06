#!/bin/bash

# === buuf_nestort ===
ICON_MIC_OK="/usr/share/icons/buuf-nestort/status/microphone-sensitivity-high.png"
ICON_MIC_MUTED="/usr/share/icons/buuf-nestort/status/microphone-hardware-disabled.png"

# Read pulseaudio state
muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{ print $2 }')
val=$(pactl get-source-volume @DEFAULT_SOURCE@ | head -n 1 | awk '{ print $5 }')

if [[ $muted == "yes" ]]; then
    icon=$ICON_MIC_MUTED
else
    icon=$ICON_MIC_OK
fi

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:value_change \
    -h string:image-path:"$icon" \
    -h int:value:"$val" \
    "Micro: $val"

