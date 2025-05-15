#!/usr/bin/env bash

echo "Creating hidden mac-setup directory (if it doesn't already exist)"
mkdir -p /Users/$USER/.mac-setup

echo "Cloning mac setup repo to ~/.mac-setup/ (as HTTPS)"
git clone git@github.com:FelixMarcus/mac-setup.git /Users/$USER/.mac-setup
cd /Users/$USER/.mac-setup

echo "Set remote to SSH"
git remote set-url origin git@github.com:FelixMarcus/mac-setup.git

echo "Beginning mac setup"
./run_this.sh

