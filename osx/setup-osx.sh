#!/bin/bash

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


# install from brew

install_editor() {
  echo Install vim and neovim!
  brew install vim
  brew install neovim
}


install_zsh() {
  echo Install zsh!
  if [[ -f /bin/zsh  ]] || [[ -f /usr/bin/zsh ]]; then
    return
  fi
  brew install zsh
}

install_oh_my_zsh() {
  echo Install 0h-my-zsh!
  if [[ ! -d $dir/.oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    sudo -s chsh -s $(which zsh)
  fi
}

install_spaceship_theme() {
  echo Install Spaceship theme!
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

install_zsh
install_oh_my_zsh
install_spaceship_theme
install_editor
