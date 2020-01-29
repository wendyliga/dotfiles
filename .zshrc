export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-auto-fetch
  git-prompt
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
  xcode
)

# apply
source $ZSH/oh-my-zsh.sh

# User configuration

alias c=clear
alias trigger-ci-test="git commit -m \"[ci enable][run test] trigger CI\" --allow-empty && git push"

# Interval to auto fetch git for `git-auto-fetch`
GIT_AUTO_FETCH_INTERVAL=3600 # will fetch hourly

# Default values for the appearance of the `git-prompt`.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"