#!/bin/sh

echo "Reinstalling dotfiles"
echo "To proceed press enter"
read A

cd $HOME

rm -rf $HOME/.dotfiles
sh -c "$(curl -fsSL https://ivabus.dev/dotfiles)"
