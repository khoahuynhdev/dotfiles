#!/bin/bash

# abort on error
set -e

dir=~/dotfiles
olddir=~/dotfiles_bak

echo -n "Creating $olddir for backup any existing tmux files"
mkdir -p $olddir

files=".tmux.conf"
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/$file $olddir/$file
  echo "Creating symlink to $file in home directory"
  ln -sf $dir/$file ~/$file
done

echo "Creating .tmux directory"

mkdir -p ~/.tmux

echo "Installing Tmux config manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Done."
