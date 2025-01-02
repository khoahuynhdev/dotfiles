#!/usr/bin/env bash

set -x
set -e

if [[ "$(uname)" == "Darwin" ]]; then
	brew install ripgrep
else
	sudo apt-get install -y ripgrep
fi
