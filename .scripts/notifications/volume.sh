#!/bin/bash


# === AdwaitaLegacy ===
# ICON_VOL_OK="/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-high.png"
# ICON_VOL_MUTED="/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-muted.png"

# === buuf_nestort ===
ICON_VOL_OK="$ICONS_PATH/status/audio-volume-medium.png"
ICON_VOL_MUTED="$ICONS_PATH/status/audio-volume-muted.png"


if [[ -f /bin/pactl ]]; then
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{ print $5 }')
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
elif [[ -f /bin/amixer ]]; then
    muted=$(amixer get Master | grep "\[off\]")
    if [[ -n $muted ]]; then
        muted="yes"
    fi
    vol=$(amixer get Master | grep -o "\[[0-9]*%\]" | head -n 1 | tr -d '[]%')
else
    echo "No pactl or amixer found"
    exit 1
fi

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
