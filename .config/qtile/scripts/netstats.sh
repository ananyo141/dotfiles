#!/bin/bash
# Show vnstat usage (summed over all interfaces) as a notification.
command -v vnstat >/dev/null || exit 1
body=$(
    for i in $(vnstat --dbiflist 1 2>/dev/null); do vnstat --oneline b -i "$i"; done |
    awk -F';' '
        { drx+=$4; dtx+=$5; day+=$6; mrx+=$9; mtx+=$10; mon+=$11; trx+=$13; ttx+=$14; tot+=$15; ym=$8 }
        END {
            if (ym == "") { print "no vnstat data"; exit }
            split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", mn, " ")
            m = mn[int(substr(ym, 6, 2))]
            printf "<b>today</b> %s \xc2\xb7 <b>%s</b> %s\n\n", h(day), m, h(mon)
            printf "today   \xe2\x86\x93 %s   \xe2\x86\x91 %s\n", h(drx), h(dtx)
            printf "%-7s \xe2\x86\x93 %s   \xe2\x86\x91 %s\n", m, h(mrx), h(mtx)
            printf "total   \xe2\x86\x93 %s   \xe2\x86\x91 %s  (%s)", h(trx), h(ttx), h(tot)
        }
        function h(b,  u, i) {
            split("B KiB MiB GiB TiB", u, " ")
            for (i = 1; b >= 1024 && i < 5; i++) b /= 1024
            return sprintf((i == 1 ? "%.0f %s" : "%.2f %s"), b, u[i])
        }'
)
dunstify -r 91842 -t 8000 -i network-transmit-receive "Network usage" "$body"
