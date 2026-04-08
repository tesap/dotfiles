#!/bin/bash

# This script is supposed to show simple preview of a selected line in fzf:
# fzf ... --preview='fzf-aux-preview.sh {}'

file=$(echo $1 | cut -d: -f 1) 
line=$(echo $1 | cut -d: -f 2) 

lines_up=2
lines_down=5
l1=$((line - $lines_up))
l2=$((line + $lines_down))

awk -v l1=$l1 \
    -v l2=$l2 \
    -v lines_up=$lines_up \
    'FNR>=l1 && FNR<=l2 {
        if (NR==l1+lines_up)
            print "\033[31m" $0 "\033[0m";
        else
            print $0 
    }' \
    $file

