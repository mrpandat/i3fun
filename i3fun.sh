convert -size 1920x1080 xc:White -gravity Center -weight 700 -pointsize 60  -annotate 0 "$(fortune -s | fold -s -65)" /tmp/i3fun.png && i3lock -i /tmp/i3fun.png

