#!/usr/bin/sh

# Disable DPMS to prevent NVIDIA wake bug
xset -dpms s off &

greenclip daemon &
