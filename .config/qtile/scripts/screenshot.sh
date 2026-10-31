#!/usr/bin/env bash
# Usage: screenshot.sh [full|select|window]
# Saves to ~/Pictures/Screenshots, copies image to clipboard, notifies.
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

case "${1:-full}" in
    select) scrot --select --freeze --line mode=edge,width=2,color="#cba6f7" "$file" ;;
    window) scrot --focused --border "$file" ;;
    *)      scrot "$file" ;;
esac || exit 1

xclip -selection clipboard -t image/png -i "$file"
notify-send -i "$file" "Screenshot saved" "$(basename "$file") · copied to clipboard"
