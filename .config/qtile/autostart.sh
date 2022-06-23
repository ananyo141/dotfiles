#!/usr/bin/sh

picom -f &
nitrogen --restore &
polybar &
emacs --daemon

