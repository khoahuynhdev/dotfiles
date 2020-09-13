#!/usr/bin/env bash

echo Install core dependencies

set -e

dir="$(pwd)"

if [[ $(xcode-select --version) ]]; then
  echo Xcode command tools already installed
else
  echo "Installing Xcode commandline tools"
  $(xcode-select --install) || { echo "Failed to install xcode cmd"; exit 1; }
fi

if [[ $(brew --version) ]] ; then
  echo "Attempting to update Homebrew"
  brew update
else
  echo "Attempting to install Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
fi

brew update && brew cleanup && brew cask cleanup
