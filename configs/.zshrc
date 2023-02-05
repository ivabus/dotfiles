
export ZSH="$HOME/.dotfiles/zsh"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
REPORTTIME=3

source $HOME/.profile
source $ZSH/themes/ivabus.zsh-theme
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
