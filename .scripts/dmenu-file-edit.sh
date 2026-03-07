#!/bin/bash

file_sel=$(~/.scripts/dmenu-recursive-file-select.sh)
if [[ ! -f $file_sel ]]; then
    exit 1
fi

$TERM -e $EDITOR $file_sel


