#!/usr/bin/sh

# Disable DPMS to prevent NVIDIA wake bug
xset -dpms s off &

nitrogen --restore &
polybar &
greenclip daemon &
emacs --daemon
