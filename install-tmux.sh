#!/usr/bin/env bash

set -e
set -x
if [[ "$(uname)" == "Darwin" ]]; then
	brew install tmux
else
	sudo apt-get install -y tmux
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# start a server but don't attach to it
tmux start-server &&
	# create a new session but don't attach to it either
	tmux new-session -d &&

	# https://github.com/tmux-plugins/tpm/issues/6
	#  add sleep 1 before calling install_plugins.sh to wait for tmux server launch
	sleep 1 &&

	# install the plugins
	~/.tmux/plugins/tpm/scripts/install_plugins.sh &&
	# killing the server is not required, I guess
	tmux kill-server
