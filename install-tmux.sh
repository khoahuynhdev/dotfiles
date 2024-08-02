#!/usr/bin/bash

set -e
set -x
sudo apt-get install -y tmux

# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d

# https://github.com/tmux-plugins/tpm/issues/6
#  add sleep 1 before calling install_plugins.sh to wait for tmux server launch
sleep 1
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required, I guess
tmux kill-server
