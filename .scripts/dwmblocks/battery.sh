#!/bin/bash

bat='BAT0'

# battery=$(sudo tlp-stat -b | tac | grep -m 1 "Charge" |  tr -d -c "[:digit:],.")
battery=$(cat /sys/class/power_supply/$bat/capacity)
state=$(cat /sys/class/power_supply/$bat/status)
time=$(acpi | awk -F, '{ print $3 }' | awk '{ print $1 }' | python -c 'import sys; h, m = sys.stdin.read().strip().split(":")[:-1]; print(h + "h " if int(h) else "", m, "m", sep="")')

if [[ $state == "Charging" ]]; then
	state='+'
else
	state='-'
fi

echo "$battery$state ($time)"

