#!/usr/bin/env bash

set -x

echo "cloning spaceship promp..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt" --depth=1

echo "symlink..."
ln -sf "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme"

echo "success!"
