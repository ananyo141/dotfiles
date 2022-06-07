#!/bin/sh

# daemon script to check for battery
bat_percent=$(cat /sys/class/power_supply/BAT0/capacity)

while true; do
	if [ "$bat_percent" -lt 15 ]; then
		DISPLAY=:0 notify-send "Low Battery Warning (${bat_percent}% left)"
	fi

	sleep 10
done

