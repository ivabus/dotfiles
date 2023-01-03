#!/bin/sh

install_compilers() {
	echo "=> Installing rust"
	$TEA +rust-lang.org zsh -c "exit"
	echo "=> Installing llvm"
	$TEA +llvm.org zsh -c "exit"
	echo "=> Installing python"
	$TEA +python.org zsh -c "exit"
}

install_tools() {
	echo "=> Installing git"
	$TEA +git-scm.org zsh -c "exit"
	echo "=> Installing GitHub CLI"
	$TEA +cli.github.com zsh -c "exit"
	echo "=> Installing make & automake & cmake & meson & ninja"
	$TEA +gnu.org/make zsh -c "exit"
	$TEA +gnu.org/automake zsh -c "exit"
	$TEA +cmake.org zsh -c "exit"
	$TEA +mesonbuild.com zsh -c "exit"
	$TEA +ninja-build.org zsh -c "exit"
}

echo "=> This script will create small environment"
echo "   with dotfiles from ivabus/ivabus-dotfiles"
echo ":: Press enter for continue"
read

echo "=> Installing env to ~/.env"
mkdir -p ~/.env/bin > /dev/null 2>&1

TEA_PREFIX=~/.env/tea
TEA=~/.env/tea/tea.xyz/v0/bin/tea
PATH=$PATH

echo "=> Installing static zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)" -q -d ~/.env -e no 
PATH="$HOME/.env/bin:$PATH"

echo "=> Installing tea"
sh <(curl https://tea.xyz) -s
echo "=> Installing neovim"
$TEA +neovim.io zsh -c "exit"
echo "=> Installing htop"
$TEA +htop.dev zsh -c "exit"


echo -n ":: Would you like to install compilers/interpretators (LLVM, Rust, Python)? (Y/n): "
read $INSTALL_COMPILERS
if [ "${INSTALL_COMPILERS^^}" = "Y" ]; then
	install_compilers
fi

echo -n ":: Would you like to install development tools (git, github cli, make/cmake/meson/ninja)? (Y/n): "
read $INSTALL_TOOLS
if [ "${INSTALL_TOOLS^^}" = "Y" ]; then
	install_tools
fi

echo "=> Configuring \$PATH"
for i in "tea" "nvim" "clang" "clang++" "lldb" "rustc" "cargo" "htop" "make" "cmake" "automake" "meson" "ninja" "git" "gh"
do
	ln -s $TEA ~/.env/bin/$i
done

echo "=> Installing dotfiles"
git clone https://github.com/ivabus/ivabus-dotfiles ~/.env/dotfiles
sh ~/.env/dotfiles/tools/link_env.sh
ZSH="$HOME/.env/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.env/oh-my-zsh/custom/themes/ivabus.zsh-theme > /dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.env/oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1

echo "=> Environment installed to ~/.env"
echo "   To start environment just type:"
echo "   PATH=\"\$HOME/.env/bin:\$PATH\" zsh"
