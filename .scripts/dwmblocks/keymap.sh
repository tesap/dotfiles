#! /bin/bash

# keymap=$(setxkbmap -query | grep layout | awk '{ print $2 }')
keymap=$(xkblayout-state print %n | sed s/' ('//g)
caps=$(xset q | grep Caps | awk '{ print $4 }')

if [[ $caps == 'on' ]];then
	caps=' CapsLock'
else
	caps=''
fi

echo "$keymap$caps"
