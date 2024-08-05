#! /usr/bin/bash

set -euo pipefail

set -x

sudo apt-get update && sudo apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

