#!/bin/bash

# First select dir where to do fuzzy search
sel_dir=$(~/.scripts/dmenu-recursive-dir-select.sh /)
if [[ ! -d $sel_dir ]]; then
    exit 1
fi

exec_str="grep -nrI --color=yes . $sel_dir 2>/dev/null | $FZFCMD --ansi -d: --nth 3"

# Search all files contents with fzf. Then open selected file match in editor at specified line
$TERM -e bash -c "\\
    result=\$($exec_str \\
        --preview='~/.scripts/fzf-aux-preview.sh {}' \\
        --bind='Ctrl-P:toggle-preview' \\
        --preview-window=down:40%,wrap \\
        --preview-wrap-sign='>' \\
        --border=rounded --border-label='$exec_str');
    fpath=\$(echo \$result | awk -F: '{ print \$1 }');
    line=\$(echo \$result | awk -F: '{ print \$2 }');
    if [[ -n \$fpath ]]; then
        \$EDITOR \$fpath +\$line
    fi \\
"



