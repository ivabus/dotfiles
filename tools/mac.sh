#!/bin/bash

# configuring mac-only things

# installing homebrew

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ "$(arch)" == "arm64" ]
then
	HOMEBREW_PREFIX="/opt/homebrew"
else
	HOMEBREW_PREFIX="/usr/local"
fi
echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> $HOME/.zprofile
brew install pinentry-mac gpg2
echo "pinentry-program $HOMEBREW_PREFIX/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf

# install jb mono

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono alacritty
