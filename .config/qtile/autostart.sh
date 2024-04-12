#!/usr/bin/sh

picom -f &
nitrogen --restore &
polybar &
greenclip daemon &
emacs --daemon

