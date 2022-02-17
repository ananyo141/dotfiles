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

# My customizations #
# Shell Functions
debugpg() {
	local usageMessage="
$0 SOURCE_FILE[S...]
A basic shell function that automates the 
debugging task with gcc/g++ and gdb according
to appropritate file extensions
	"
	# perform input validation
	# Select compiler from extension of first arg
	local compiler
	local stem=${1%%.*}
    stem=${stem##*/}
	local extension=${1##*.}
	case "$extension" in
		'cpp') compiler=g++ ;;
		'c'  ) compiler=gcc ;;
		 *   ) echo -e 'Invalid Usage\n' "$usageMessage" >&2
		       return 1     ;;
	esac

	# make sure required programs are installed
	# else return with appropriate error message
 	which $compiler >/dev/null || {echo "$compiler not installed"       >&2; return 1}
 	which gdb       >/dev/null || {echo "gdb debugger is not installed" >&2; return 1}

	# Compile given program by supplying all the args
	# to compiler with the -g flag
	local dirname=/tmp/${0}
	local binaryname=${dirname}/${stem}_debug.out
	mkdir -p "$dirname" || {echo "Unable to create "$dirname" directory" >&2; return 1}
    echo -e "Compiling... Saving build file as '$binaryname'"
	$compiler -g -o "$binaryname" "$@" || return 1

	# startup gdb with the executable
	gdb --silent "$binaryname"
}

# Path Settings
PATH=$PATH:$HOME/bin
PYTHONPATH=$HOME

# Make Vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Make zsh like vi
set -o vi

export HISTCONTROL=ignoredups
export HISTSIZE=1000
# Aliases
alias ls='ls -F --color=auto'
alias la='ls -AFh --color=auto'
alias ll='ls -AFhl --color=auto'
alias clear='echo Use "^L" man!'
alias f='~/.fehbg'
alias py='python3'
alias gits='git status'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

