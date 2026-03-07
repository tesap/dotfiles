#!/bin/bash

ssid=$(nmcli device show wlp3s0 | /bin/grep GENERAL.CONNECTION  | awk '{ print $2 }')

if [[ $ssid != "--" ]]; then
    echo $ssid
fi
