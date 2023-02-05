#!/bin/sh
set -e
# Dotfiles upgrade script that just pulls new dotfiles from repo
# oh-my-zsh update included!

CURRENTDIR="$(pwd)"

cd $HOME/.dotfiles
echo "Upgrading dotfiles"

# ignore local changes

git reset --hard HEAD > /dev/null 2>&1

if git pull > /dev/null 2>&1
then
	echo "$HOME/.dotfiles synced"
else
	echo "$HOME/.dotfiles couldn't be 'git pull'ed, check your connection to internet or run tools/reinstall.sh"
	exit 1
fi
sh tools/relink.sh
cd $CURRENTDIR
