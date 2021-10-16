#! /bin/bash

$HOME/.autostart &

setxkbmap -layout us,ru -option 'grp:shifts_toggle'
$HOME/.fehbg

# dwmblocks &
# blueman-applet

# exec dwm
exec qtile start
# exec dbus-launch --exit-with-session dwm
