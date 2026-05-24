if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim nvim
alias ls eza
alias ll "eza -l"
alias la "eza -al"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# Added by Antigravity CLI installer
set -gx PATH "/home/magician1/.local/bin" $PATH
