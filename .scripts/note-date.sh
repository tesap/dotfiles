#!/bin/bash

NAME=$@


ok=$(echo $NAME | grep -oE '^[0-9]{4}_[0-9]{2}_[0-9]{2}-')
if [[ -n $ok ]]; then
    echo "Already patched, skip"
    exit 0
fi


if [[ ! -f $NAME ]]; then
    echo "No such file"
    exit 1
fi

PREFIX=$(date -d "@$(stat -c '%W' "$NAME")" "+%Y_%m_%d")

mv -i "$NAME" "$PREFIX-$NAME"
echo "$NAME -> $PREFIX-$NAME"
