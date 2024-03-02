#/bin/sh
set -e

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi
chmod +x $HOME/.dotfiles/tools/*
$HOME/.dotfiles/tools/relink.sh
mkdir -p $HOME/.config/zsh/{plugins,themes}
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.config/zsh/themes/ivabus.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/plugins/zsh-syntax-highlighting
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c :PlugInstall -c :q -c :q
