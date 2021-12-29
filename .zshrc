# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# My customizations
PATH=$PATH:$HOME/bin
PYTHONPATH=$HOME

# Make Vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Make zsh like vi
set -o vi

export HISTCONTROL=ignoredups
export HISTSIZE=1000
alias ls='ls -F --color=auto'
alias la='ls -AFh --color=auto'
alias ll='ls -AFhl --color=auto'
alias clear='echo Use "^L" man!'

