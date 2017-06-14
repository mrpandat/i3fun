#!/bin/bash

import -window root /tmp/prtscrn.png
convert /tmp/prtscrn.png -blur 0x5 /tmp/prtscrn.png

i=0
tot=$((`xrandr | grep -c '*'` - 1))
xrandr | grep '*' | cut -d ' ' -f4 | cut -d 'x' -f1 | while read -r line ; do
    hw=$(($(($i * 2 - $tot)) * $line / 2))
    if [ $hw -ge 0 ]; then hw="+$hw"; fi
    convert -gravity Center -weight 700 -pointsize 60 -stroke white -strokewidth 1.5 -annotate $hw-0 "$(fortune | fold -s -50)"  /tmp/prtscrn.png /tmp/prtscrn.png
    i=$(($i + 1))
done
i3lock -i /tmp/prtscrn.png
rm /tmp/prtscrn.png
