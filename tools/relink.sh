#!/bin/sh

# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

mkdir -p $HOME/.config/nvim $HOME/.config/alacritty $HOME/.config/mako >/dev/null 2>&1
ln -sf $HOME/.dotfiles/configs/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/configs/.profile $HOME/.profile
ln -sF $HOME/.dotfiles/configs/nvim $HOME/.config/
ln -sF $HOME/.dotfiles/configs/alacritty $HOME/.config/
ln -sF $HOME/.dotfiles/configs/sway $HOME/.config/
ln -sF $HOME/.dotfiles/configs/waybar $HOME/.config/
ln -sF $HOME/.dotfiles/configs/mako $HOME/.config/
ln -sF $HOME/.dotfiles/configs/qt5ct $HOME/.config/
echo "Dotfiles linked."
