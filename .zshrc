export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# apply
source $ZSH/oh-my-zsh.sh

# User configuration

alias assign-ssh="cd ~/.ssh && ssh-add"
alias gps="git push"
alias gpu="git pull"
alias gts="git status"
alias gco="git checkout"
alias grh="git reset --hard"
alias gfa="git fetch --all"
alias c=clear


