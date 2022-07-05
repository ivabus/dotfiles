#!/bin/sh

CURRENTDIR="$(pwd)"
GREEN="\033[32m"
RED="\033[31m"
CLEAR_COLOR="\033[0m"

echo "${GREEN}Welcome to ivabus .dotfiles installer$CLEAR_COLOR"
echo "Dotfiles will be installed to $HOME/.dotfiles"
echo "Press enter to continue"
read A

# check for zsh

if ! command -v zsh > /dev/null
then
    echo "zsh is not installed"
    echo "${RED}Aborting.$CLEAR_COLOR"
    exit 255
fi

# install oh-my-zsh and plugins
echo "${GREEN}Installing oh-my-zsh and plugins$CLEAR_COLOR"
ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.dotfiles/oh-my-zsh/custom/themes/ivabus.zsh-theme > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null 2>&1

# linking dotfiles to their original locations

echo "${GREEN}Linking binaries$CLEAR_COLOR"

sh $HOME/.dotfiles/tools/relink.sh

cd $CURRENTDIR

if [[ $(uname) = "Darwin" ]]
then
    sh tools/mac.sh
fi

echo "${GREEN}Dotfiles installed and linked.$CLEAR_COLOR"
read -p "Would you like to configure git? (y/N): " answer
if [[ $answer = [Yy] ]]; then
	sh tools/git.sh
fi

chmod +x $HOME/.dotfiles/tools/*

exec zsh