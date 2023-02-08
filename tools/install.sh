#!/bin/sh
set -e
CURRENTDIR="$(pwd)"

echo "Welcome to ivabus .dotfiles installer"
echo "Dotfiles will be installed to $HOME/.dotfiles"
echo "Press enter to proceed"
read A

# check for zsh

if ! command -v zsh > /dev/null
then
    echo "zsh is not installed"
    echo "Aborting."
    exit 255
fi
mkdir -p $HOME/.dotfiles/zsh/{plugins,themes}
ZSH="$HOME/.dotfiles/zsh"
echo "Installing zsh theme and plugins"
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.dotfiles/zsh/themes/ivabus.zsh-theme > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting > /dev/null 2>&1

# installing vimplug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim# installing jetbrains mono
if [[ $(uname) = "Linux" ]]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fi

# linking dotfiles to their original locations

echo "Linking dotfiles."
sh $HOME/.dotfiles/tools/relink.sh

cd $CURRENTDIR

if [[ $(uname) = "Darwin" ]]
then
    sh $HOME/.dotfiles/tools/mac.sh
fi

echo "Dotfiles installed and linked."
read -p "Would you like to configure git? (y/N): " answer
if [[ $answer = [Yy] ]]; then
	sh $HOME/.dotfiles/tools/git.sh
fi

chmod +x $HOME/.dotfiles/tools/*

exec zsh
