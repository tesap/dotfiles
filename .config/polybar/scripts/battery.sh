#!/bin/sh

# battery=$(sudo tlp-stat -b | tac | grep -m 1 "Charge" |  tr -d -c "[:digit:],.")
battery=$(cat /sys/class/power_supply/BAT0/capacity)

echo "$battery %"
