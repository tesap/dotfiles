#!/bin/bash

# icon="/usr/share/icons/Adwaita/symbolic/status/keyboard-brightness-symbolic.svg"
icon="/usr/share/icons/buuf-nestort/actions/brightness-high.png"

val=$(xbacklight -get | awk -F. '{ print $1 }')

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:value_change \
    -h string:image-path:"$icon" \
    -h int:value:"$val" \
    "Brightness: $val"

