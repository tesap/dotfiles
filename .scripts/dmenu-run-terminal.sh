#!/bin/bash

source ~/.vars

sel_dir=$(source ~/.scripts/dmenu-recursive-dir-select.sh)

$TERM -e $SHELL -c "cd $sel_dir; exec $SHELL"
