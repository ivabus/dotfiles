#!/bin/sh
set -e
# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

ln -sf $HOME/.dotfiles/configs/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/configs/.profile $HOME/.profile
ln -sf $HOME/.dotfiles/configs/nvim $HOME/.config/
ln -sf $HOME/.dotfiles/configs/alacritty $HOME/.config/
ln -sf $HOME/.dotfiles/configs/sway $HOME/.config/
ln -sf $HOME/.dotfiles/configs/waybar $HOME/.config/
ln -sf $HOME/.dotfiles/configs/mako $HOME/.config/
ln -sf $HOME/.dotfiles/configs/qt5ct $HOME/.config/
echo "Dotfiles linked."
