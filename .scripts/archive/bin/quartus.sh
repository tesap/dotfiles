#!/bin/bash

killall -9 jtagd
sudo jtagconfig

sudo udevadm control --reload-rules


quartus
