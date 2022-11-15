#!/usr/bin/env bash

#
# Use GNU Stow to symlink dotfiles to home directory
#

cd $(dirname $0)

# symlink everything in repo directory to user home directory
stow . -t $HOME -v 2
