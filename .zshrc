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
  brew install node
  brew install speedtest-cli
  brew install swiftformat
  brew install swiftlint
  brew install xctool
}

convert_mov_to_gif() {
  if ! homebrew_loc="$(type -p "brew")" || [[ -z $homebrew_loc ]]; then
    echo "💥 Missing homebrew, installing..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if ! ffmpeg_loc="$(type -p "ffmpeg")" || [[ -z $ffmpeg_loc ]]; then
    echo "💥 Missing ffmpeg, installing..."
    brew install ffmpeg
  fi

  if ! gifsicle_loc="$(type -p "gifsicle")" || [[ -z $gifsicle_loc ]]; then
    echo "💥 Missing gifsicle, installing..."
    brew install gifsicle
  fi

  mov_source="$1"
  gif_path="$2"
  
  if [ -z "$mov_source" ]; then
    echo "💥 Please enter .mov file Source"
  elif [ -z "$gif_path" ]; then
    echo "💥 Please enter gif file Source"
  else
    # convert .mov into gif
    #   - color configuration -> rgb8
    #   - framerate -> 10
    #   - gif optimization -> 3(Requests that gifsicle use the slowest/most file-size optimization)
    #   - delay -> Tell gifsicle to delay 30ms between each gif (in ms)
    ffmpeg -i $mov_source -pix_fmt rgb8 -r 10 -f gif - | gifsicle --optimize=3 --delay=10 > $gif_path
  fi
}

simulator-record() {
  xcrun simctl io booted recordVideo -f ~/video.mov && convert_mov_to_gif ~/video.mov ~/video.gif
}

simulator-deeplink() {
  xcrun simctl openurl booted $1
}

find_on_current_directory() {
  find . -maxdepth 1 -iname "*$1*" -print
}

find_on_current_directory_recursively() {
  find . -iname "*$1*" -print
}

find_content() {
  find $1 -type f | xargs egrep -i '$2'
  echo "find $1 -type f | xargs egrep -i '$2'"
}

alias c=clear
alias trigger-ci-test="git commit -m \"[ci enable][run test] trigger CI\" --allow-empty && git push"

# Interval to auto fetch git for `git-auto-fetch`
GIT_AUTO_FETCH_INTERVAL=3600 # will fetch hourly