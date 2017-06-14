#!/bin/bash

import -window root /tmp/prtscrn.png
convert /tmp/prtscrn.png -blur 0x5 /tmp/prtscrn.png

i=0
tot=$((`xrandr | grep -c '*'` - 1))
xrandr | grep '*' | cut -d ' ' -f4 | cut -d 'x' -f1 | while read -r line ; do
    shift=$(($(($i * 2 - $tot)) * $line / 2))
    if [ $shift -ge 0 ]; then shift="+$shift"; fi
    convert -gravity Center -weight 700 -pointsize 60 -stroke white -strokewidth 1.5 -annotate $shift-0 "$(fortune | fold -s -50)"  /tmp/prntscrn.png /tmp/prntscrn.png
    i=$(($i + 1))
done
i3lock -i /tmp/prtscrn.png
rm /tmp/prtscrn.png
