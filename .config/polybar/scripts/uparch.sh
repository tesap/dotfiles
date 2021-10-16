#!/bin/sh


if ! arch=$(yay -Qun 2> /dev/null | wc -l); then
    arch=0
fi

if ! aur=$(yay -Qum 2> /dev/null | wc -l); then
    aur=0
fi

updates=$(("$arch" + "$aur"))

if [ $updates -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi
