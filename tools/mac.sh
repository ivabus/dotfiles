#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
CLEAR_COLOR="\033[0m"

# configuring mac-only things

# installing homebrew

echo "${GREEN}Installing Homebrew${CLEAR_COLOR}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ "$(arch)" == "arm64" ]
then
	HOMEBREW_PREFIX="/opt/homebrew"
else
	HOMEBREW_PREFIX="/usr/local/homebrew"
fi
echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> $HOME/.zprofile
brew install pinentry-mac gpg2
echo "pinentry-program $HOMEBREW_PREFIX/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf

# install jb mono

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono alacritty