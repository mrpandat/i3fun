#!/bin/bash

import -window root /tmp/prtscrn.png
convert /tmp/prtscrn.png -blur 0x5 /tmp/prtscrn.png
hw=`xrandr | grep '*' | head -n 1 | cut -d ' ' -f4 | cut -d 'x' -f1 | awk '{print $1/2}'`
convert -gravity Center -weight 700 -pointsize 60 -stroke white -strokewidth 1.5 -annotate -$hw-0 "$(fortune | fold -s -50)"  /tmp/prtscrn.png /tmp/prtscrn.png 
convert -gravity Center -weight 700 -pointsize 60 -stroke white -strokewidth 1.5 -annotate +$hw-0 "$(fortune | fold -s -50)"  /tmp/prtscrn.png /tmp/prtscrn.png 
i3lock -i /tmp/prtscrn.png
rm /tmp/prtscrn.png
