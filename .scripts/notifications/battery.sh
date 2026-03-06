#!/bin/bash

ICON_DISCHARGING_100="/usr/share/icons/buuf-nestort/status/battery-100.png"
ICON_DISCHARGING_80="/usr/share/icons/buuf-nestort/status/battery-080.png"
ICON_DISCHARGING_60="/usr/share/icons/buuf-nestort/status/battery-060.png"
ICON_DISCHARGING_40="/usr/share/icons/buuf-nestort/status/battery-040.png"
ICON_DISCHARGING_20="/usr/share/icons/buuf-nestort/status/gpm-battery-020.png"
ICON_DISCHARGING_CRIT="/usr/share/icons/buuf-nestort/status/battery-caution.png"

ICON_CHARGING="/usr/share/icons/buuf-nestort/status/battery-charging.png"
# ICON_CHARGING_100="/usr/share/icons/buuf-nestort/status/battery-charging-100.png"
# ICON_CHARGING_80="/usr/share/icons/buuf-nestort/status/battery-charging-080.png"
# ICON_CHARGING_60="/usr/share/icons/buuf-nestort/status/battery-charging-060.png"
# ICON_CHARGING_40="/usr/share/icons/buuf-nestort/status/battery-charging.png"
# ICON_CHARGING_20="/usr/share/icons/buuf-nestort/status/battery-charging.png"
# ICON_CHARGING_CRIT="/usr/share/icons/buuf-nestort/status/battery-charging.png"
# # ICON_CHARGING_40="/usr/share/icons/buuf-nestort/status/battery-charging-040.png"
# # ICON_CHARGING_20="/usr/share/icons/buuf-nestort/status/battery-charging-020.png"
# # ICON_CHARGING_CRIT="/usr/share/icons/buuf-nestort/status/battery-charging-caution.png"

upower_stats=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice)

battery=$(echo "$upower_stats" | /bin/grep percentage | awk '{ print $2 }' | awk -F. '{ print $1 }')
state=$(echo "$upower_stats" | /bin/grep state | awk '{ print $2 }')
time=$(echo "$upower_stats" | /bin/grep "time to" | awk '{$1=$2=$3=""; gsub(/^[ \t]*/, ""); print $0 }')

if [[ $state == "charging" ]]; then
    state='+'
    icon=$ICON_CHARGING
else
    state='-'
    if [[ $battery -ge 98 ]]; then
	icon=$ICON_DISCHARGING_100
    elif [[ $battery -ge 80 ]]; then
	icon=$ICON_DISCHARGING_80
    elif [[ $battery -ge 60 ]]; then
	icon=$ICON_DISCHARGING_60
    elif [[ $battery -ge 40 ]]; then
	icon=$ICON_DISCHARGING_40
    elif [[ $battery -ge 20 ]]; then
	icon=$ICON_DISCHARGING_20
    elif [[ $battery -le 5 ]]; then
	icon=$ICON_DISCHARGING_CRIT
    fi
fi

text="$battery$state ($time)"

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:battery \
    -h string:image-path:"$icon" \
    -h int:value:"$battery%" \
    -t 8000 \
    "$text"

