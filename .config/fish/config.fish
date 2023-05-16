# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting
    # initialize zoxide
    zoxide init fish | source
    # attach or create new tmux session
    if [ -z "$TMUX" ]
        tmux attach 2>/dev/null || tmux new-session 2>/dev/null
    end
    pfetch
end

if test -e ~/.aliases
    source ~/.aliases
end

if test -e ~/.envvars
    source ~/.envvars
end

