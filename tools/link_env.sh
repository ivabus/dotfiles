#!/bin/sh
set -e

TEA_GUM=$HOME/.env/tea/charm.sh/gum/v\*/bin/gum

$TEA_GUM format "Linking \`.zshrc\`"
if [ -f $HOME/.zshrc ]; then
	$TEA_GUM format "Moved old \`.zshrc\` to \`$HOME/.zshrc.old\`"
	mv $HOME/.zshrc $HOME/.zshrc.old
fi
ln -s $HOME/.env/dotfiles/env/.zshrc $HOME/.zshrc
$TEA_GUM format "Linking neovim files"
rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -s $HOME/.env/dotfiles/nvim $HOME/.config/nvim
