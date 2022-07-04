#!/bin/sh

# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

GREEN="\033[32m"
DEFAULTC="\033[0m"

mkdir -p $HOME/.config/nvim >/dev/null 2>&1
rm $HOME/.zshrc $HOME/.config/nvim/init.vim >/dev/null 2>&1
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
echo "${GREEN}.zshrc linked: $DEFAULTC$HOME/.dotfiles/zshrc $GREEN-> $DEFAULTC$HOME/.zshrc"
ln -s $HOME/.dotfiles/nvim.vim $HOME/.config/nvim/init.vim
echo "${GREEN}neovim config linked: $DEFAULTC$HOME/.dotfiles/nvim.vim $GREEN-> $DEFAULTC$HOME/.config/nvim/init.vim"
