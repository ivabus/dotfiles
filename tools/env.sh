#!/bin/sh

NC='\033[0m'
Green='\033[1;32m'
ARROW="${Green}=>${NC}"
INPUT="${Green}::${NC}"

echo "${ARROW} This script will create small environment"
echo "   with dotfiles from ivabus/ivabus-dotfiles"
echo "${INPUT} Press enter to continue"
read

echo "${ARROW} Installing env to ~/.env"
mkdir -p ~/.env/bin > /dev/null 2>&1

TEA_PREFIX=~/.env/tea
TEA=~/.env/tea/tea.xyz/v0/bin/tea
PATH=$PATH

echo "${ARROW} Installing static zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)" -q -d ~/.env -e no 
PATH="$HOME/.env/bin:$PATH"

echo "${ARROW} Installing tea"
zsh -c "sh <(curl https://tea.xyz) --prefix $TEA_PREFIX"

echo "${ARROW} Installing neovim"
$TEA +neovim.io zsh -c "exit"
echo "${ARROW} Installing htop"
$TEA +htop.dev zsh -c "exit"
echo "${ARROW} Installing git"
$TEA +git-scm.org zsh -c "exit"
printf "${INPUT}"
read -p " Would you like to install compilers/interpretators (LLVM, Rust, Python)? (y/N): " INSTALL_COMPILERS
if [[ $INSTALL_COMPILERS == "y" || $INSTALL_COMPILERS == "Y" ]]; then
	echo "${ARROW} Installing rust"
	$TEA +rust-lang.org zsh -c "exit"
	echo "${ARROW} Installing llvm"
	$TEA +llvm.org zsh -c "exit"
	echo "${ARROW} Installing python"
	$TEA +python.org zsh -c "exit"
fi

printf "${INPUT}"
read -p " Would you like to install development tools (GitHub CLI, make/cmake/meson/ninja)? (y/N): " INSTALL_TOOLS
if [[ $INSTALL_TOOLS == "y" || $INSTALL_TOOLS == "Y" ]]; then
	echo "${ARROW} Installing GitHub CLI"
	$TEA +cli.github.com zsh -c "exit"
	echo "${ARROW} Installing make & automake & cmake & meson & ninja"
	$TEA +gnu.org/make zsh -c "exit"
	$TEA +gnu.org/automake zsh -c "exit"
	$TEA +cmake.org zsh -c "exit"
	$TEA +mesonbuild.com zsh -c "exit"
	$TEA +ninja-build.org zsh -c "exit"
fi

echo "${ARROW} Configuring \$PATH"
for i in "tea" "nvim" "clang" "clang++" "lldb" "rustc" "cargo" "htop" "make" "cmake" "automake" "meson" "ninja" "git" "gh"
do
	ln -s $TEA ~/.env/bin/$i
done

echo "${ARROW} Installing dotfiles"
git clone https://github.com/ivabus/ivabus-dotfiles ~/.env/dotfiles
ZSH="$HOME/.env/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.env/oh-my-zsh/custom/themes/ivabus.zsh-theme > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.env/oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1
sh ~/.env/dotfiles/tools/link_env.sh

echo "${ARROW} Environment installed to ~/.env"
echo "   To start environment just type:"
echo "   PATH=\"\$HOME/.env/bin:\$PATH\" zsh"