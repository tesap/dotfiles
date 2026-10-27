#!/bin/bash

# Lower scroll speed
# xinput set-prop 10 357 50
# Lower movement acceleration
xinput set-prop 10 340 -0.4

# That was for original T480 screen
# TOUCH_SCREEN_ID=9
# TOUCHPAD_ID=10

TOUCHPAD_ID=9

# Disable touch screen
# xinput --disable $TOUCH_SCREEN_ID

# Disable touchpad
xinput --disable $TOUCHPAD_ID
