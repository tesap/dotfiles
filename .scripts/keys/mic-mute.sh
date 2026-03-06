#!/bin/bash

# Perform mute toggle
pactl set-source-mute @DEFAULT_SOURCE@ toggle

source ~/.scripts/notifications/microphone.sh
