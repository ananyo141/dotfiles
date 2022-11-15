#!/usr/bin/env bash

#
# Use GNU Stow to symlink dotfiles to home directory
#

cd $(dirname $0)

# remove stow links from user directory
stow -D . -t $HOME -v 2
