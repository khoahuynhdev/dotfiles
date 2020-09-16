#!/usr/bin/env bash

set -e

source_dir="$(pwd)"

function symlink() {
  source=$1
  target=$2
  if [[ -d $2 ]]; then
    echo $target is a directory
    echo backup $target
    mv $target "$target-backup"
  fi
  echo "symlink $source to $target"
  ln -sf $source $target
}

install_spaceship_theme() {
  echo Install Spaceship theme!
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}


for file in $(ls "$(pwd)/dot"); do
  symlink "$source_dir/dot/$file" $HOME/.$file
done

# symlink config folder
config_dir=$HOME/.config
target_dirs="alacritty nvim"
for dir in $target_dirs; do
  symlink "$source_dir/$dir" $config_dir/$dir
done

source $HOME/.zshrc
# run arbitrary config here
install_spaceship_theme
vim +PlugInstall +qa
