# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias f='~/.fehbg'
alias py='python3'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
