#! /bin/bash

DF="df -k /"

all=$($DF | tail -n 1 | awk '{ print $2 }')
used=$($DF | tail -n 1 | awk '{ print $3 }')
perc=$($DF | tail -n 1 | awk '{ print $5 }')

out=$(echo "$used $all $perc" | python -c "import sys; a, b, c = sys.stdin.read().split(); i = lambda x: round(int(x) / 1024 ** 2, 1); print(i(a), '/ ', i(b), c)")

echo $out
