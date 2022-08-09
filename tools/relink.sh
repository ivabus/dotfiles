#!/bin/sh

# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

mkdir -p $HOME/.config/nvim $HOME/.config/alacritty >/dev/null 2>&1
rm -rf $HOME/.zshrc $HOME/.config/nvim/init.vim $HOME/.config/alacritty/alacritty.yml $HOME/.config/sway $HOME/.config/waybar >/dev/null 2>&1
ln -s $HOME/.dotfiles/configs/zshrc $HOME/.zshrc
echo ".zshrc linked: $HOME/.dotfiles/configs/zshrc -> $HOME/.zshrc"
ln -s $HOME/.dotfiles/configs/.profile $HOME/.profile
echo ".profile linked $HOME/.dotfiles/configs/.profile -> $HOME/.profile"
ln -s $HOME/.dotfiles/configs/nvim.vim $HOME/.config/nvim/init.vim
echo "neovim config linked: $HOME/.dotfiles/configs/nvim.vim -> $HOME/.config/nvim/init.vim"
ln -s $HOME/.dotfiles/configs/alacritty.yml $HOME/.config/alacritty/alacritty.yml
echo "alacritty config linked: $HOME/.dotfiles/configs/alacritty.yml -> $HOME/.config/alacritty/alacritty.yml"

ln -s $HOME/.dotfiles/configs/sway $HOME/.config/
ln -s $HOME/.dotfiles/configs/waybar $HOME/.config/
echo "sway and waybar dotfiles installed"
