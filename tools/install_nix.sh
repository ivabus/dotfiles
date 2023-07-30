#/bin/sh
set -e

mkdir $HOME/.config
./relink.sh
mkdir -p $HOME/.dotfiles/zsh/{plugins,themes}
ZSH="$HOME/.dotfiles/zsh"
echo "Installing zsh theme and plugins"
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.dotfiles/zsh/themes/ivabus.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c :PlugInstall -c :q -c :q
