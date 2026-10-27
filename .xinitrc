#! /bin/bash

$HOME/.autostart &
$HOME/.screenlayout/1050.sh

# systemctl --user import-environment DISPLAY XAUTHORITY XDG_RUNTIME_DIR
# exec --no-startup-id systemctl --user start graphical-session.target

make -B -C gh/dwm
exec gh/dwm/dwm
# exec awesome

# exec qtile start
# exec dbus-launch --exit-with-session dwm
# exec i3
# exec gnome-session
# exec /home/void/gh/cpp/wmcpp/build/wmcpp
