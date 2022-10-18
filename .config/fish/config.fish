# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting
    # initialize zoxide
    zoxide init fish | source
    # attach or create new tmux session
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
alias trees='tree -ahF -t --du --filesfirst -C | less -R'

# tmux Aliases
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
alias gitch='git checkout'
alias gitsw='git switch'

