#!/bin/bash

OUT=/tmp/screenshot.png
rm -f $OUT

scrot -F $OUT
URL=$(zbarimg $OUT 2>/dev/null | cut -c 9-)

if [[ ! -z $URL ]]; then
    notify-send $URL
    echo $URL | xsel -ib
else 
    notify-send -u low "QR not found"
fi

