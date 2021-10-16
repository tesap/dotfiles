#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar -c ~/.config/polybar/config.ini main &
# polybar -c ~/.config/polybar/config.ini bottom &

echo "Polybar launched..."
