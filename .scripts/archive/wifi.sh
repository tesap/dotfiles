#! /bin/bash

perc=$(iwconfig wlp2s0 | grep Link | awk -F= '{ print  $2 }' | awk '{ print $1 }' | awk -F/ '{ print $1/$2 * 100}' | awk -F. '{ print $1 }')
ssid=$(iwconfig wlp2s0 | grep ESSID | awk -F\" '{ print $2 }')

echo "$ssid $perc"
