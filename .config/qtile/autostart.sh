#! /bin/bash 
picom --config ~/.config/picom/config &
# nitrogen --restore &
$HOME/.fehbg
# variety &
# pcmanfm -d &

# optimus-manager-qt &
parcellite &
pasystray &
nm-applet &
blueman-applet &
cbatticon &
# redshift-gtk &

setxkbmap -layout us,ru -option 'grp:shifts_toggle' &

$HOME/.config/polybar/launch.sh &

$HOME/.bin/lock.sh &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
