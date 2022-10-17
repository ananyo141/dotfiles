if status is-interactive
    set fish_greeting
    # Commands to run in interactive sessions can go here
    tmux attach 2>/dev/null || tmux new-session 2>/dev/null
end

# Aliases
alias ls='ls -F --color=auto'
alias la='ls -AFh --color=auto'
alias ll='ls -AFhl --color=auto'
alias py='python3'
alias v='vim'
alias vs='vim -S'
alias vrc='vim ~/.vimrc'
alias x='exa --icons'
alias gs++='g++ -Wall -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer'
alias tf='terraform'

#tmux Aliases
alias tmas='tmux attach-session -t'
alias tmks='tmux kill-session -t'
alias tmns='tmux new-session -t'
alias tmls='tmux ls'

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
alias gitu='git add . && git commit && git push'

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions -q __zoxide_cd_internal
    if builtin functions -q cd
        builtin functions -c cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z
    set argc (count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions for `z`.
function __zoxide_z_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        __fish_complete_directories "$tokens[2]" ''
    else if test (count $tokens) -eq (count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query -i -- $query)
        commandline --current-process "$tokens[1] "(string escape $result)
        commandline --function repaint
    end
end

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function z
    __zoxide_z $argv
end
abbr --erase z
complete -c z -e
complete -c z -f -a '(__zoxide_z_complete)'

function zi
    __zoxide_zi $argv
end
abbr --erase zi
complete -c zi -e

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually
# ~/.config/fish/config.fish):
#
# zoxide init fish | source
