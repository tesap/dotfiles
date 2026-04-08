#!/bin/bash

PROFILES_PATH=~/.config/mozilla/firefox

sel=$(/bin/ls -l $PROFILES_PATH | awk '{ print $9 }' | grep -vE "Pending|Profile|Crash|installs.ini|profiles.ini" | tail -n +2 | $DMENUCMD)
if [[ -z $sel ]]; then
    exit 1
fi

sel_vpn=$(echo -e "No\nYes" | $DMENUCMD)
if [[ -z $sel_vpn ]]; then
    exit 1
fi

if [[ $sel_vpn == "Yes" ]]; then
    proxychains4 firefox --profile $PROFILES_PATH/$sel
else
    firefox --profile $PROFILES_PATH/$sel
fi

