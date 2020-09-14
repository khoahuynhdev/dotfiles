#!/usr/bin/env bash

ROOT="$(pwd)"

set -e # abort on error

# sudo -v # ask password beforehand

function install() {
  if [[ $reply =~ ^[Yy]$ ]]; then
    if [[ $(uname -s) == "Darwin" ]]; then
      bash "$ROOT/osx/setup-osx.sh"
    elif[[ $(uname -s) == "Linux" ]]
      "$ROOT/setup-linux.sh"
    fi
  fi
}

function greet() {
  echo 'Bootstrap terminal'
  echo '------------------'
  echo 'This will reset your terminal'
  # read -p 'Answer: '  reply
  echo '------------------'
}

function main() {
  greet
  install
}

main
