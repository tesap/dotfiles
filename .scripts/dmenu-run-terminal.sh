#!/bin/bash

source ~/.vars

sel_dir=$(source ~/.scripts/dmenu-recursive-dir-select.sh)

if [[ -z $sel_dir ]]; then
    exit 1
fi

$TERM -e $SHELL -c "cd $sel_dir; exec $SHELL"
