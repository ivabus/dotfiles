#!/bin/sh

# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

GREEN="\033[32m"
CLEAR_COLOR="\033[0m"

mkdir -p $HOME/.config/nvim $HOME/.config/alacritty >/dev/null 2>&1
rm $HOME/.zshrc $HOME/.config/nvim/init.vim $HOME/.config/alacritty/alacritty.yml >/dev/null 2>&1
ln -s $HOME/.dotfiles/configs/zshrc $HOME/.zshrc
echo "${GREEN}.zshrc linked: $CLEAR_COLOR$HOME/.dotfiles/configs/zshrc $GREEN-> $CLEAR_COLOR$HOME/.zshrc"
ln -s $HOME/.dotfiles/configs/nvim.vim $HOME/.config/nvim/init.vim
echo "${GREEN}neovim config linked: $CLEAR_COLOR$HOME/.dotfiles/configs/nvim.vim $GREEN-> $CLEAR_COLOR$HOME/.config/nvim/init.vim"
ln -s $HOME/.dotfiles/configs/alacritty.yml $HOME/.config/alacritty/alacritty.yml
echo "${GREEN}alacritty config linked: $CLEAR_COLOR$HOME/.dotfiles/configs/alacritty.yml $GREEN-> $CLEAR_COLOR$HOME/.config/alacritty/alacritty.yml"
