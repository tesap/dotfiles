#!/bin/bash

# This script is supposed to show simple preview of a selected line in fzf:
# fzf ... --preview='fzf-aux-preview.sh {}'

file=$(echo $1 | cut -d: -f 1) 
line=$(echo $1 | cut -d: -f 2) 

wsize=2
l1=$((line - $wsize))
l2=$((line + $wsize))

awk -v l1=$l1 \
    -v l2=$l2 \
    -v wsize=$wsize \
    'FNR>=l1 && FNR<=l2 {
        if (NR==l1+wsize)
            print "\033[31m" $0 "\033[0m";
        else
            print $0 
    }' \
    $file

