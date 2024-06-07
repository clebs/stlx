#! /bin/bash

if ! command -v gum > /dev/null; then
	echo "Installing gum via homebrew..."
	brew install gum
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Creating stlx symlink in /usr/local/bin. Privileges required"

sudo ln -s $SCRIPT_DIR/stlx /usr/local/bin/stlx
