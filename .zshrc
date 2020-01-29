export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

plugins=(
  git
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
  xcode
)

# apply
source $ZSH/oh-my-zsh.sh

# User configuration

alias c=clear