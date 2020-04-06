export ZSH=$HOME/.oh-my-zsh
export HOMEBREW_EDITOR=code

ZSH_THEME="avit"

plugins=(
  git
  ssh-agent
  # zsh-autosuggestions
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
  brew install task

  brew tap peripheryapp/periphery
  brew cask install periphery
}

migrate_gem() {
  gem install xcpretty
}

# boot simulator
simulator-boot() {
  xcrun simctl boot $1 && open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
}

# open link on simulator
simulator-open-link() {
  xcrun simctl openurl booted $1
}

# shutdown simulator
simulator-shutdown() {
  xcrun simctl shutdown $1
}

# erase simulator data
simulator-erase() {
  xcrun simctl erase $1
}

# add media to your simulator, like png, giv or mov file.
# example: simulator-addmedia ~/Downloads/test.png
simulator-addmedia() {
  xcrun simctl addmedia booted $1
}

# install compiled app to default booted simualtor
# example: simulator-install-default ~/Library/Developer/.../Test.App
simulator-install-default() {
  xcrun simctl install booted $1
}

# install compiled app to simulator with spesific id
# make sure target simualtor already booted.
# example: simulator-install 0852E7E7-78F2-4D4A-B9DA-13E7EB545C44 ~/Library/Developer/.../Test.App
simulator-install() {
  xcrun simctl install $1 $2
}

test() {
  path=$1
  scheme=$2

  xcodebuild test -workspace $1 -scheme $2 -destination 'platform=iOS Simulator,name=iPhone SE,OS=11.4' -sdk iphonesimulator | xcpretty
}

test-with-xctool() {
  path=$1
  scheme=$2

  xctool $1 $2 run-tests -parallelize -logicTestBucketSize 20
}

alias c=clear
alias trigger-ci="git commit -m \"[ci enable][run test] trigger CI\" --allow-empty && git push"
alias trigger-ci-upload="git commit -m \"[ci enable][run test][appcenter] trigger CI and Upload\" --allow-empty && git push"
alias simulator-list="xcrun simctl list"

export PATH="/usr/local/sbin:$PATH"