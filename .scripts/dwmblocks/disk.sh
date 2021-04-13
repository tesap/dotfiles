#! /bin/bash

used=$(df -h / | tail -n 1 | awk '{ print $3 }')
perc=$(df -h / | tail -n 1 | awk '{ print $5 }')

echo "$used $perc"


