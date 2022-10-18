# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting
    # initialize zoxide
    zoxide init fish | source
    # attach or create new tmux session
    tmux attach 2>/dev/null || tmux new-session 2>/dev/null
end

if test -e ~/.aliases
    source ~/.aliases
end

