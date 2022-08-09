#!/bin/sh

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

# install oh-my-zsh and plugins
echo "Installing oh-my-zsh and plugins"
ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.dotfiles/oh-my-zsh/custom/themes/ivabus.zsh-theme > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1

# installing jetbrains mono

if [[ $(uname) = "Linux" ]]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fi

# installing sway-launcher

curl https://raw.githubusercontent.com/Biont/sway-launcher-desktop/master/sway-launcher-desktop.sh > $HOME/.dotfiles/utils/sway-launcher-desktop
chmod +x $HOME/.dotfiles/utils/sway-launcher-desktop

# linking dotfiles to their original locations

echo "Linking dotfiles"

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
