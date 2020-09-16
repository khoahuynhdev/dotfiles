#!/usr/bin/env zsh

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
  export ZSH="$HOME/.oh-my-zsh"
  if [[ -z "$ZSH_CUSTOM" ]]; then
    export ZSH_CUSTOM="$ZSH/custom"
  fi
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

echo Source zsh config
$(which zsh) $HOME/.zshrc

install_spaceship_theme
$(which nvim) -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
