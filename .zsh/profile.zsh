# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/Users/chne/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Source Cargo Paths
source $HOME/.cargo/env

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# FZF
# Setting fd as the default source for fzf
#export FZF_DEFAULT_COMMAND='fd --type f' # Use fd instead of ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# TeXlive
export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"

# Set custom paths
export REPOS="$HOME/Repos"
export SD="$HOME" # Initialize as dummy value, see sd in functions.zsh
export SCHOOL="$HOME/Documents/School"
export PATH="$HOME/.zsh/scripts:$PATH"

# Asciiinema
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

# Git editor change
export GIT_EDITOR="vim"
