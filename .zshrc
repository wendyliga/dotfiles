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

# Git
alias ga="git add"
alias gaa="ga ."
alias gps="git push"
alias gpu="git pull"
alias gts="git status"
alias gco="git checkout"
alias gme="git merge"
alias grh="git reset --hard"
alias gfa="git fetch --all"
alias gpr="git prune"

alias c=clear


