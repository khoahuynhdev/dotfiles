#!/usr/bin/env bash

ROOT="$(pwd)"

set -e # abort on error

# sudo -v # ask password beforehand

function install() {
  if [[ $(uname -s) == "Darwin" ]]; then
    ./osx/setup-osx.sh
  elif[[ $(uname -s) == "Linux" ]]; then
    ./linux/setup-linux.sh
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
