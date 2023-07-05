#!/bin/bash
set -e
HW_TARGET=$(uname)/$(uname -m)

case $HW_TARGET in
Darwin/arm64)
	echo Platform checked.;;
Darwin/x86_64)
	echo Platform checked.;;
Linux/arm64|Linux/aarch64)
	echo Platform checked.;;
Linux/x86_64)
	echo Platform checked.;;
*)
	echo Yo, dude. This script is for Linux/Darwin x64/arm64. Get this system and try one more time
	exit 255
esac

if command -v gum >/dev/null; then
	TEA_GUM=gum
else
	curl https://tea.xyz -o /tmp/tea
	TEA_GUM=$(sh /tmp/tea --silent +charm.sh/gum which gum | tail -n 1)
fi


$TEA_GUM format -- <<EoMD
# hi, let's setup env.

> dotfiles picked from github.com:ivabus/dotfiles

## What will be installed by default

* tea
* neovim
* htop
* git
* zsh

## What could be additionally installed

### Compilers/Interpretators

* LLVM
* Rust and Cargo
* Python

### Tools

* GitHub CLI
* make
* automake
* cmake
* meson
* ninja

EoMD


if ! $TEA_GUM confirm "Do you want to continue"; then
exit 1
fi

rm -rf $HOME/.env > /dev/null 2>&1

$TEA_GUM format "Installing env to \`$HOME/.env\`"
mkdir $HOME/.env $HOME/.env/bin > /dev/null 2>&1

TEA_PREFIX=$HOME/.env/tea
TEA=$HOME/.env/tea/tea.xyz/v0/bin/tea
PATH=$PATH

$TEA_GUM format "Installing \`tea\` to \`$TEA_PREFIX\`"

curl https://tea.xyz -o /tmp/tea > /dev/null 2>&1
sh /tmp/tea --yes --prefix $TEA_PREFIX

$TEA_GUM format "Installing \`zsh\`"
$TEA +zsh.sourceforge.io sh -c "exit"
PATH="$HOME/.env/bin:$PATH"


$TEA_GUM format "Installing \`neovim\`"
$TEA +neovim.io sh -c "exit"
$TEA_GUM format "Installing \`htop\`"
$TEA +htop.dev sh -c "exit"
$TEA_GUM format "Installing \`git\`"
$TEA +git-scm.org sh -c "exit"

if $TEA_GUM confirm "Would you like to install compilers/interpretators (LLVM, Rust, Python)?"; then
	$TEA_GUM format "Installing \`rust\` and \`cargo\`"
	$TEA +rust-lang.org sh -c "exit"
	$TEA +rust-lang.org/cargo sh -c "exit" 
	$TEA_GUM format "Installing \`llvm\`"
	$TEA +llvm.org sh -c "exit"
	$TEA_GUM format "Installing \`python\`"
	$TEA +python.org sh -c "exit"

fi


if $TEA_GUM confirm "Would you like to install development tools (GitHub CLI, make/cmake/meson/ninja)?"; then
	$TEA_GUM format "Installing \`gh\`"
	$TEA +cli.github.com sh -c "exit"
	$TEA_GUM format "Installing \`make\` & \`automake\` & \`cmake\` & \`meson\` & \`ninja\`"
	$TEA +gnu.org/make sh -c "exit"
	$TEA +gnu.org/automake sh -c "exit"
	$TEA +cmake.org sh -c "exit"
	$TEA +mesonbuild.com sh -c "exit"
	$TEA +ninja-build.org sh -c "exit"
fi

$TEA_GUM format "Configuring \$PATH with installed progs"
for i in "tea" "nvim" "clang" "clang++" "lldb" "rustc" "cargo" "htop" "make" "cmake" "automake" "meson" "ninja" "git" "gh"
do
	ln -s $TEA $HOME/.env/bin/$i
done

$TEA_GUM format "Configuring"
$TEA_GUM spin --title "Cloning ivabus/dotfiles" $TEA git clone https://github.com/ivabus/dotfiles $HOME/.env/dotfiles> /dev/null
mkdir -p $HOME/.env/dotfiles/zsh/plugins $HOME/.env/dotfiles/zsh/themes
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.env/dotfiles/zsh/themes/ivabus.zsh-theme > /dev/null 2>&1
$TEA_GUM spin $TEA git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.env/dotfiles/zsh/plugins/zsh-syntax-highlighting --title "Cloning zsh-syntax-highlighting"> /dev/null
sh $HOME/.env/dotfiles/tools/link_env.sh

$TEA_GUM format -- <<EoMD
Environment installed to \`$HOME/.env\`
To start environment just type:
\`PATH="\$HOME/.env/bin:\$PATH" zsh\`
EoMD
