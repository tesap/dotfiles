#!/bin/bash

DMENUCMD="rofi -dmenu -i"
ERR_FILE=/tmp/log.err
TIMEOUT=6
NOTIFICATION_HOLD=4000
CRITICAL_NOTIFICATION_HOLD=8000

rm -f $ERR_FILE

# input_known=$(nmcli connection show | grep wifi | awk '{ print $1 }')
nmcli device wifi rescan
input_scanned=$(nmcli device wifi list | colrm 1 8 | tail -n +2 | grep -v '\-\-' | awk '{ printf "%s %s\n", $1, $2 }')
nmcli_input="$(echo "$input_scanned" | $DMENUCMD | awk '{ print $1 }')"
if [[ -z $nmcli_input ]]; then
    exit 1
fi

# nmcli_result=$(timeout $TIMEOUT nmcli connection up $nmcli_input 2> $ERR_FILE)
nmcli_result=$(timeout $TIMEOUT nmcli device wifi connect $nmcli_input 2> $ERR_FILE)

if [[ -s $ERR_FILE ]]; then
    notify-send -u critical -t $CRITICAL_NOTIFICATION_HOLD "Error" "$(cat $ERR_FILE)"
    exit 1
fi

if [[ -n $nmcli_result ]]; then
    notify-send -t $NOTIFICATION_HOLD -- "$nmcli_result"
else
    notify-send -u critical -t $NOTIFICATION_HOLD -- "Operation timed out"
fi

rm -f $ERR_FILE
active_ssid=$(~/.scripts/text/wifi-current-ssid.sh 2> $ERR_FILE)
# TODO make a common code?

if [[ -s $ERR_FILE ]]; then
    notify-send -u critical -t $CRITICAL_NOTIFICATION_HOLD "Error" "$(cat $ERR_FILE)"
    exit 1
fi

if [[ -n $active_ssid ]]; then
    notify-send -t $NOTIFICATION_HOLD -- "$active_ssid"
fi

