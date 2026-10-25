#!/bin/bash

# icon="/usr/share/icons/Adwaita/symbolic/status/keyboard-brightness-symbolic.svg"
icon="$ICONS_PATH/actions/brightness-high.png"

if [[ -f /bin/xbacklight ]]; then
    val=$(xbacklight -get | awk -F. '{ print $1 }')
else
    echo "No xbacklight found"
    exit 1
fi

dunstify \
    -u low \
    -h string:x-dunst-stack-tag:value_change \
    -h string:image-path:"$icon" \
    -h int:value:"$val" \
    "Brightness: $val"

