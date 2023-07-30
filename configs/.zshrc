#!/bin/zsh

# Setup function, that resets terminal

autoload -Uz add-zsh-hook
function reset_broken_terminal () {
    printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

export ZSH="$HOME/.dotfiles/zsh"

# Setup history

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_NO_STORE

REPORTTIME=3

autoload -Uz compinit bracketed-paste-magic url-quote-magic
compinit
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic
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
alias rh="rehash"
alias upgrade_dotfiles="sh $HOME/.dotfiles/tools/upgrade.sh"
alias timestamp='date -u +%FT%TZ'
alias yt-dlp-opus="yt-dlp -f 251 -x"
alias ltcp="cp ~/.dotfiles/latex_template/{macros,preamble,template,letterfonts}.tex ."
alias jekyll_export="jekyll b -d ./_archive && cd _archive && tar cf ../site.tar ./ && cd .. && gzip -9 -f site.tar && rm -rf _archive"
alias rebuild="sudo nixos-rebuild switch --flake path:/etc/nixos --impure"

# ffmpeg section

# Usage: ffmpeg_convert <output codec (hevc or h264)> <video_in> <video_out> [<quality (1 to 100)>] 

ffmpeg_convert() {
    ffmpeg -i $2 -c:v ${1}_videotoolbox $(if [ ! -z $4 ]; then echo "-q:v $4"; fi ) $3
}

# Usage: ffmpeg_telegram_video_sticker: <video_in> <time <= 3> [<chromakey color in hex>] [<chromakey similarity>]
ffmpeg_telegram_video_sticker() {
    PWD_START=$(pwd)
    TMPDIR=/tmp/sticker-$(date +%Y-%m-%d-%H:%M:%S)
    mkdir $TMPDIR
    cp $1 $TMPDIR/
    cd $TMPDIR
    ffmpeg -i $1 $(if [[ ! -z $3 && ! -z $4 ]]; then echo -vf "chromakey=\#$3:$4:0"; fi) -c copy -c:v png -t $2 tmp.mov
    ffmpeg -y -i tmp.mov -r 30 -t $2 -an -c:v libvpx-vp9 -pix_fmt yuva420p -vf 'scale=512:512:force_original_aspect_ratio=decrease' -b:v 400K ${1}_sticker.webm
    cp ${1}_sticker.webm $PWD_START/
    cd $PWD_START
    #rm -rf $TMP_DIR
}
# AsahiLinux useful aliases
alias reload_net="sudo systemctl restart NetworkManager wpa_supplicant" # iwd"

# Diskutil aliases
alias dadc="diskutil apfs deleteContainer"
alias devff="diskutil eraseVolume free free"
