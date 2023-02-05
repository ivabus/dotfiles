#!/bin/sh
set -e
echo "=> Linking zshrc"
if [ -f ~/.zshrc ]; then
	echo "=> Moving old zshrc to ~/.zshrc.old"
	mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/.env/dotfiles/env/.zshrc ~/.zshrc
echo "=> Linking neovim files"
rm -rf ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
ln -s ~/.env/dotfiles/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
