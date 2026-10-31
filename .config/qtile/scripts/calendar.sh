#!/bin/bash
# Toggle a small floating calendar below the bar's centre island.
if pkill -f "yad --class=qtile-calendar"; then exit 0; fi
W=260; H=230
X=$(( ( $(xdpyinfo | awk '/dimensions:/{split($2,a,"x");print a[1]}') - W ) / 2 ))
exec yad --class=qtile-calendar --calendar --undecorated --skip-taskbar --on-top \
    --no-buttons --close-on-unfocus --width=$W --height=$H --posx=$X --posy=46 \
    --title="Calendar" >/dev/null
