#!/bin/bash

# For X230 with nitrocaster FHD mod
xrandr \
    --output DP-3 --primary --mode 1920x1080 \
    --output LVDS-1 --mode 1920x1080 --same-as DP-3
# xrandr --output LVDS-1 --off --output DP-3 --primary --mode 1920x1080 --auto


