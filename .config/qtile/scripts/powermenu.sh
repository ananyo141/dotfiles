#!/usr/bin/env bash
# Rofi power menu used by the qtile bar's power button
theme="$HOME/.config/rofi/catppuccin-mocha.rasi"
choice=$(printf '%s\n' "  Lock" "  Suspend" "  Logout" "  Reboot" "  Shutdown" |
    rofi -dmenu -i -p "Power" -theme "$theme" -theme-str 'window {width: 300px;} listview {lines: 5;}')

case "$choice" in
    *Lock) loginctl lock-session ;;
    *Suspend) systemctl suspend ;;
    *Logout) qtile cmd-obj -o cmd -f shutdown ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
