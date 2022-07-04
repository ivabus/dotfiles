#!/bin/sh

# Dotfiles upgrade script that just pulls new dotfiles from repo
# oh-my-zsh update included!

CURRENTDIR="$(pwd)"
GREEN="\033[32m"
DEFAULTC="\033[0m"

cd $HOME/.dotfiles
echo "${GREEN}Upgrading dotfiles$DEFAULTC"
git pull
sh tools/relink.sh
echo "${GREEN}Upgrading oh-my-zsh$DEFAULTC"
zsh -c "source $ZSH/oh-my-zsh.sh && omz update" > /dev/null
cd $CURRENTDIR