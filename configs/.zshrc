#!/bin/zsh

# Setup function, that resets terminal

autoload -Uz add-zsh-hook
function reset_broken_terminal () {
    printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}
add-zsh-hook -Uz precmd reset_broken_terminal

export ZSH="$HOME/.dotfiles/zsh"

# Setup history

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

REPORTTIME=3

autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select

# Source section

source $HOME/.profile
source $ZSH/themes/ivabus.zsh-theme
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Alias section

alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=always"
alias la="ls -la"
alias upgrade_dotfiles="sh $HOME/.dotfiles/tools/upgrade.sh"
alias timestamp='date -u +%FT%TZ'
alias yt-dlp-opus="yt-dlp -f 251 -x"
alias ffmpeg_hard="ffmpeg -hwaccel videotoolbox -c:v h264_videotoolbox"

# AsahiLinux useful aliases
alias reload_net="sudo systemctl restart NetworkManager wpa_supplicant" # iwd"

# Diskutil aliases
alias dadc="diskutil apfs deleteContainer"
alias devff="diskutil eraseVolume free free"
