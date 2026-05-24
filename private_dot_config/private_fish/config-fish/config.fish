set EDITOR nvim

set GOPATH ~/go
# set -x PATH $GOPATH/bin $PATH
# set -x PATH ~/.local/bin $PATH

# pyenv
# set PYENV_ROOT "$HOME/.pyenv"
# set -x PATH $PYENV_ROOT/bin $PATH
# set -x PATH $PYENV_ROOT/shims $PATH

# fish_add_path --move $HOME/.rye/shims
# pyenv init --path

alias vim=nvim
alias se='export EDITOR=$EDITOR; sudoedit '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/magician1/google-cloud-sdk/path.fish.inc' ]; . '/home/magician1/google-cloud-sdk/path.fish.inc'; end

# exa alias
if set c (command -v exa)
  alias e='exa --icons'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
