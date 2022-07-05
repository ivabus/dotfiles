#!/bin/sh

# Dotfiles upgrade script that just pulls new dotfiles from repo
# oh-my-zsh update included!

CURRENTDIR="$(pwd)"
GREEN="\033[32m"
CLEAR_COLOR="\033[0m"

cd $HOME/.dotfiles
echo "1) ${GREEN}Upgrading dotfiles$CLEAR_COLOR"
git pull
sh tools/relink.sh
echo "2) ${GREEN}Upgrading oh-my-zsh$CLEAR_COLOR"
zsh -c "source $ZSH/oh-my-zsh.sh && omz update" > /dev/null
cd $CURRENTDIR