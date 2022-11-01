#!/usr/bin/env bash
#
# Use GNU Stow to symlink dotfiles to home directory
#

cd $(dirname $0)
# symlink everything in root directory, skip .config/
stow . --ignore=.config -v 2
# symlink everything in .config/ separately to ~/.config
stow .config -t $HOME/.config -v 2

