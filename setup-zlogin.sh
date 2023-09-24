#!/bin/bash

cat <<EOF >>"$HOME/.zlogin"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
EOF
