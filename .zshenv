export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools:$HOME/.local/bin:/home/$(whoami)/.local/share/pnpm:/usr/local/go/bin
export ZDOTDIR=$HOME/.zsh

# export PATH=$PATH:/usr/local/lib/node_modules
# export PATH=/usr/local/share/npm/bin:$PATH

source $ZDOTDIR/.zshrc
. "$HOME/.cargo/env"
source $NVM_DIR/nvm.sh

