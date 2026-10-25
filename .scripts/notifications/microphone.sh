#!/bin/bash

# === buuf_nestort ===
ICON_MIC_OK="$ICONS_PATH/status/microphone-sensitivity-high.png"
ICON_MIC_MUTED="$ICONS_PATH/status/microphone-hardware-disabled.png"

if [[ -f /bin/pactl ]]; then
    # Read pulseaudio state
    muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{ print $2 }')
    val=$(pactl get-source-volume @DEFAULT_SOURCE@ | head -n 1 | awk '{ print $5 }')
elif [[ -f /bin/amixer ]]; then
    muted=$(amixer get Capture | grep "\[off\]")
    if [[ -n $muted ]]; then
        muted="yes"
    fi
    val=$(amixer get Capture | grep -o "\[[0-9]*%\]" | head -n 1 | tr -d '[]%')
else
    echo "No pactl or amixer found"
    exit 1
fi

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

