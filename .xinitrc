#! /bin/bash

$HOME/.autostart &

setxkbmap -layout us,ru -option 'grp:shifts_toggle'
$HOME/.fehbg

dwmblocks &

exec dwm
# exec dbus-launch --exit-with-session dwm
