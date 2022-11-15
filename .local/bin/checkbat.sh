#!/bin/sh

# daemon script to check for battery

while true; do
	bat_percent=$(cat /sys/class/power_supply/BAT0/capacity)

	if [ "$bat_percent" -lt 15 ]; then
		DISPLAY=:0 notify-send "Low Battery Warning (${bat_percent}% left)"
	fi

	sleep 600
done

