#!/bin/sh
set -e

NC='\033[0m'
Green='\033[1;32m'
ARROW="${Green}=>${NC}"

echo "$ARROW Linking zshrc"
if [ -f ~/.zshrc ]; then
	echo "=> Moving old zshrc to ~/.zshrc.old"
	mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/.env/dotfiles/env/.zshrc ~/.zshrc
echo "$ARROW Linking neovim files"
rm -rf ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
ln -s ~/.env/dotfiles/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
