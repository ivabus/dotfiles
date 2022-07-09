#!/bin/sh

GREEN="\033[32m"
RED="\033[31m"
CLEAR_COLOR="\033[0m"

echo "${RED}Reinstalling dotfiles${CLEAR_COLOR}"
echo "To proceed press enter"
read A

cd $HOME

rm -rf $HOME/.dotfiles
sh -c "$(curl -fsSL https://ivabus.dev/dotfiles)"