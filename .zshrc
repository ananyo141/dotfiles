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
# Use exa as ls
alias ls='exa --icons'
# alias ls='ls -F --color=auto'

alias la='ls -AFh --color=auto'
alias ll='ls -AFhl --color=auto'
alias py='python3'
alias v='vim'
alias vs='vim -S'
alias vrc='vim ~/.vimrc'

# Git Aliases
alias gits='git status'
alias gitf='git fetch'
alias gitp='git pull'
alias gitd='git diff'
alias gitds='git diff --staged'
alias gita='git add .'
alias gitA='git add -A'
alias gitc='git commit'
alias gitcp='git commit && git push'
alias gitP='git push'
alias gitl='git log'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    \command zoxide add -- "$(__zoxide_pwd || \builtin true)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && [[ "$1" = '-' ]]; then
        if [[ -n "${OLDPWD}" ]]; then
            __zoxide_cd "${OLDPWD}"
        else
            # shellcheck disable=SC2016
            \builtin printf 'zoxide: $OLDPWD is not set'
            return 1
        fi
    elif [[ "$#" -eq 1 ]] && [[ -d "$1" ]]; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset() {
    \builtin unalias "$@" &>/dev/null || \builtin true
    \builtin unfunction "$@" &>/dev/null || \builtin true
    \builtin unset "$@" &>/dev/null
}

__zoxide_unset z
function z() {
    __zoxide_z "$@"
}

__zoxide_unset zi
function zi() {
    __zoxide_zi "$@"
}

if [[ -o zle ]]; then
    __zoxide_unset _z
    function _z() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            \builtin local result
            # shellcheck disable=SC2086
            if result="$(\command zoxide query -i -- ${words[2,-1]})"; then
                __zoxide_result="${result}"
            else
                __zoxide_result=''
            fi
            \builtin printf '\e[5n'
        fi
    }

    __zoxide_unset _z_helper
    function _z_helper() {
        \builtin local result="${__zoxide_z_prefix}${__zoxide_result}"
        # shellcheck disable=SC2296
        [[ -n "${__zoxide_result}" ]] && LBUFFER="${LBUFFER}${(q-)result}"
        \builtin zle reset-prompt
    }

    \builtin zle -N _z_helper
    \builtin bindkey "\e[0n" _z_helper
    if [[ "${+functions[compdef]}" -ne 0 ]]; then
        \compdef -d z
        \compdef _z z
    fi
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"
