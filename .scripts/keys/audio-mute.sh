#!/bin/bash

# Perform mute toggle
pactl set-sink-mute @DEFAULT_SINK@ toggle

source ~/.scripts/notifications/volume.sh
