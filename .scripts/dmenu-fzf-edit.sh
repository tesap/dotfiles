#!/bin/bash

# First select dir where to do fuzzy search
sel_dir=$(~/.scripts/dmenu-recursive-dir-select.sh /)
if [[ ! -d $sel_dir ]]; then
    exit 1
fi

# Search all files contents with fzf. Then open selected file match in editor at specified line
$TERM -e bash -c "result=\$(grep -nrI --color=yes . $sel_dir 2>/dev/null | fzf --ansi -d: --nth 3);
		  fpath=\$(echo \$result | awk -F: '{ print \$1 }');
		  line=\$(echo \$result | awk -F: '{ print \$2 }');
		  if [[ -n \$fpath ]]; then
		      \$EDITOR \$fpath +\$line
		  fi"



