#!/bin/bash

ICON_DISCHARGING_100="$ICONS_PATH/status/battery-100.png"
ICON_DISCHARGING_80="$ICONS_PATH/status/battery-080.png"
ICON_DISCHARGING_60="$ICONS_PATH/status/battery-060.png"
ICON_DISCHARGING_40="$ICONS_PATH/status/battery-040.png"
ICON_DISCHARGING_20="$ICONS_PATH/status/gpm-battery-020.png"
ICON_DISCHARGING_CRIT="$ICONS_PATH/status/battery-caution.png"

ICON_CHARGING="$ICONS_PATH/status/battery-charging.png"
# ICON_CHARGING_100="$ICONS_PATH/status/battery-charging-100.png"
# ICON_CHARGING_80="$ICONS_PATH/status/battery-charging-080.png"
# ICON_CHARGING_60="$ICONS_PATH/status/battery-charging-060.png"
# ICON_CHARGING_40="$ICONS_PATH/status/battery-charging.png"
# ICON_CHARGING_20="$ICONS_PATH/status/battery-charging.png"
# ICON_CHARGING_CRIT="$ICONS_PATH/status/battery-charging.png"
# # ICON_CHARGING_40="$ICONS_PATH/status/battery-charging-040.png"
# # ICON_CHARGING_20="$ICONS_PATH/status/battery-charging-020.png"
# # ICON_CHARGING_CRIT="$ICONS_PATH/status/battery-charging-caution.png"

if [[ -f /bin/acpi ]]; then
    acpi_stats=$(acpi -b 2>/dev/null)
    battery=$(echo $acpi_stats | awk -F", " '{ print $2 }' | tr -d %)
    state=$(echo $acpi_stats | awk -F, '{ print $1 }' | awk -F': ' '{ print $2 }')
    time=$(echo $acpi_stats | awk -F", " '{ print $3 }' | sed 's/ until charged//; s/ remaining//; s/charging at zero rate - will never fully charge.//; s/discharging at zero rate - will never fully discharge.//')
    if [[ $state == "Charging" ]]; then
        state='charging'
    fi
elif [[ -f /bin/upower ]]; then
    upower_stats=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice)

    battery=$(echo "$upower_stats" | /bin/grep percentage | awk '{ print $2 }' | awk -F. '{ print $1 }' | awk -F% '{ print $1 }')
    state=$(echo "$upower_stats" | /bin/grep state | awk '{ print $2 }')
    time=$(echo "$upower_stats" | /bin/grep "time to" | awk '{$1=$2=$3=""; gsub(/^[ \t]*/, ""); print $0 }')
else
    echo "Acpi or Upower not found"
    exit 1
fi

if [[ $state == "charging" ]]; then
    state='+'
    icon=$ICON_CHARGING
else
    state='-'
    if [[ $battery -ge 90 ]]; then
	icon=$ICON_DISCHARGING_100
    elif [[ $battery -ge 70 ]]; then
	icon=$ICON_DISCHARGING_80
    elif [[ $battery -ge 50 ]]; then
	icon=$ICON_DISCHARGING_60
    elif [[ $battery -ge 30 ]]; then
	icon=$ICON_DISCHARGING_40
    elif [[ $battery -ge 10 ]]; then
	icon=$ICON_DISCHARGING_20
    elif [[ $battery -le 5 ]]; then
	icon=$ICON_DISCHARGING_CRIT
    fi
fi

if [[ -n $time ]]; then
    text="$battery$state ($time)"
else
    text="$battery$state"
fi

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:battery \
    -h string:image-path:"$icon" \
    -h int:value:"$battery%" \
    -t 8000 \
    "$text"

