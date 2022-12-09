#!/bin/sh

# script that (re)links all dotfiles during the installation or upgrade.
# do not run manually

mkdir -p $HOME/.config/ >/dev/null 2>&1
rm -rf $HOME/`cd $HOME/.dotfiles/dotfiles && find .config -depth -type d | head -n -1` >/dev/null 2>&1
ln -sv $HOME/.dotfiles/dotfiles/.config/* $HOME/.config/
for dotfile in `ls -Ap $HOME/.dotfiles/dotfiles/ | grep -E -v /$`
do
	ln -sv $HOME/.dotfiles/dotfiles/$dotfile $HOME/$dotfile
done
