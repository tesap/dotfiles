#! /bin/bash

load=$(uptime | awk -Fage: '{ print $2 }' | sed s/,//g)

echo "$load"
