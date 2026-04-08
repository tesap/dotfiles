#!/bin/bash

if [[ -z $1 ]]; then
    exit 1
fi
mimetype=$(file --mime-type "$1" | awk -F: '{ print $2 }')

desktop_entries="$(cat /usr/share/applications/mimeinfo.cache | grep $mimetype | awk -F= '{ print $2 }' | sed 's/.$//g' | sed 's/\;/\n/g')"

copy_entry="--- Copy to clipboard"

dmenu_res=$(echo -e "$copy_entry\n$desktop_entries" | $DMENUCMD -mesg "$1")
echo $dmenu_res

if [[ -z $dmenu_res ]]; then
    exit 1
fi

if [[ $dmenu_res == $copy_entry ]]; then
    echo "$@" | xclip -selection clipboard
    notify-send -t 4000 -- "Copied to clipboard: '$@'"
else
    notify-send -t 4000 -- "Opening with: $dmenu_res"
    gtk-launch "$dmenu_res" "$1"
fi;

