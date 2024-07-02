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

function nvims
  set items "default" "kickstart.nvim" "LazyVim" "NvChad" "AstroNvim"
  set config (printf "%s\n" $items | fzf --prompt=" Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
  
  if test -z "$config"
    echo "Nothing selected"
    return 0
  end
  
  if test "$config" = "default"
    set config ""
  end
  
  env NVIM_APPNAME=$config nvim $argv
end

if test -e ~/.aliases
    source ~/.aliases
end

if test -e ~/.envvars
    source ~/.envvars
end

