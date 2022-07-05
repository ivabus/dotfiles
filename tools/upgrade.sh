#!/bin/sh

# Dotfiles upgrade script that just pulls new dotfiles from repo
# oh-my-zsh update included!

CURRENTDIR="$(pwd)"
GREEN="\033[32m"
CLEAR_COLOR="\033[0m"

cd $HOME/.dotfiles
echo "1) ${GREEN}Upgrading dotfiles$CLEAR_COLOR"
if git pull > /dev/null 2>&1
then
	echo "$HOME/.dotfiles synced"
else
	echo "$HOME/.dotfiles couldn't be 'git pull'ed, check your connection to internet or run tools/reinstall.sh"
	exit 1
sh tools/relink.sh
echo "2) ${GREEN}Upgrading oh-my-zsh$CLEAR_COLOR"
zsh -c "source $ZSH/oh-my-zsh.sh && omz update" > /dev/null
cd $CURRENTDIR