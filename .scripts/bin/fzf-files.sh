#!/bin/bash

    # -d: --nth 3 \
result=$(cat - | $FZFCMD --ansi \
    --preview='~/.scripts/fzf-aux-preview.sh {}' \
    --bind='Ctrl-P:toggle-preview' \
    --preview-window=hidden,down:40%,wrap \
    --preview-wrap-sign='>' \
    --border=rounded \
);

fpath=$(echo $result | awk -F: '{ print $1 }');
line=$(echo $result | awk -F: '{ print $2 }');
if [[ -n $fpath ]]; then
    if [[ -n $line ]]; then
        $TERM -e $EDITOR $fpath +$line &
    else
        $TERM -e $EDITOR $fpath &
    fi
fi

