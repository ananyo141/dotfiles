#!/usr/bin/env bash

#
# Use GNU Stow to symlink dotfiles to home directory
#

cd $(dirname $0)

# symlink everything in root directory, skip .config/
stow . -t $HOME -v 2 --ignore=.config --ignore=.local

# symlink everything in .config/ separately to ~/.config
stow -v 2 .config -t $HOME/.config 

# symlink everything in .config/ separately to ~/.config
stow -v 2 .local -t $HOME/.local 
