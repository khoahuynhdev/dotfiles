#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -x

# Define variables
GO_URL="https://go.dev/dl/"
ARCH="linux-amd64"
INSTALL_DIR="/usr/local"
TEMP_DIR="/tmp/go-install"
PROFILE_FILE="$HOME/.bashrc"  # Change to ~/.zshrc if using zsh

# Fetch latest Go version
LATEST_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
GO_TARBALL="${LATEST_VERSION}.${ARCH}.tar.gz"
GO_TARBALL_URL="${GO_URL}${GO_TARBALL}"
CHECKSUM_URL="$GO_URL?mode=json"
JSON_FILE="go_versions.json"

echo "Latest Go version: $LATEST_VERSION"
echo "Downloading $GO_TARBALL from $GO_TARBALL_URL..."

# Create temp directory and download files
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"
curl -O "$GO_TARBALL_URL" -v -L
#curl -o $JSON_FILE "$CHECKSUM_URL"

# Verify checksum
#echo "Verifying checksum..."
#sha256sum -c "$(basename "$CHECKSUM_URL")"

# Define the JSON file (or fetch it dynamically)

# Extract the latest stable Go version
#LATEST_VERSION=$(grep -oP '"version":\s*"\Kgo[0-9]+\.[0-9]+\.[0-9]+' "$JSON_FILE" | head -n 1)

# Extract SHA256 checksum for Linux AMD64 tarball

#CHECKSUM=$(awk -v version="$LATEST_VERSION" '
#    $0 ~ "\"version\": \"" version "\"" { in_version = 1 }
#    in_version && $0 ~ "\"filename\": \"" version ".linux-amd64.tar.gz\"" { in_file = 1 }
#    in_file && $0 ~ "\"sha256\": \"" { 
#        match($0, /"sha256":\s*"([^"]+)"/, arr)
#        print arr[1]
#        exit
#    }
#' "$JSON_FILE")

# Print results
#echo "Latest Go Version: $LATEST_VERSION"
#echo "SHA256: $CHECKSUM"

# Remove existing Go installation if present
if [ -d "${INSTALL_DIR}/go" ]; then
    echo "Removing existing Go installation..."
    sudo rm -rf "${INSTALL_DIR}/go"
fi

# Extract and install Go
echo "Installing Go..."
sudo tar -C "$INSTALL_DIR" -xzf "$GO_TARBALL"

# Add Go to PATH
if ! grep -q 'export PATH=$PATH:/usr/local/go/bin' "$PROFILE_FILE"; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >> "$PROFILE_FILE"
    echo 'export PATH=$PATH:$HOME/go/bin' >> "$PROFILE_FILE"
    echo "Go has been added to your PATH. Run 'source $PROFILE_FILE' to apply changes."
fi

# Cleanup
echo "Cleaning up..."
rm -rf "$TEMP_DIR"

echo "Go installation completed successfully!"

