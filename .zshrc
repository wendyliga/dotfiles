export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

plugins=(
  git
  git-auto-fetch
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
  xcode
)

# apply
source $ZSH/oh-my-zsh.sh

# User configuration

migrate_homebrew() {
  brew install carthage
  brew install ffmpeg
  brew install gifsicle
  brew install htop
  brew install speedtest-cli
  brew install swiftformat
  brew install swiftlint
  brew install xctool
}

simulator-deeplink() {
  xcrun simctl openurl booted $1
}

alias c=clear
alias trigger-ci-test="git commit -m \"[ci enable][run test] trigger CI\" --allow-empty && git push"

# Interval to auto fetch git for `git-auto-fetch`
GIT_AUTO_FETCH_INTERVAL=3600 # will fetch hourlyexport PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
