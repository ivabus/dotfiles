export ZSH="$HOME/.dotfiles/oh-my-zsh"

ZSH_THEME="ivabus"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

alias upgrade_dotfiles="sh $HOME/.dotfiles/tools/upgrade.sh"

source $ZSH/oh-my-zsh.sh
