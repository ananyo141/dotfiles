#!/usr/bin/env bash

#
# Use GNU Stow to symlink dotfiles to home directory
#

cd $(dirname $0)

stow -D .
