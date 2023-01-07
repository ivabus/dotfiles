
export ZSH="$HOME/.dotfiles/oh-my-zsh"

ZSH_THEME="ivabus"
ENABLE_CORRECTION="true"
plugins=(git zsh-syntax-highlighting)

# Function to quickly show stats on systemload, usage of filesystems, usage of ram/swap and uptime
stats () {
	AVLD=$(cut -d " " -f1-3 /proc/loadavg)
	USEDMEM=$(free -h | grep Mem | awk '{print $3 " / " $2}')
	USEDSWAP=$(free -h | grep Swap | awk '{ print $3 " / " $2}')
	USEDSTRG=$(df / -h | tail -n 1 | awk '{print $3}')
	USEDSTRGPERC=$(df / -h | tail -n 1 | awk '{print $5}')
	STRG=$(df / -h | tail -n 1 | awk '{print $2}')
	USEDSTRGHOME=$(df /home -h | tail -n 1 | awk '{print $3}')
	USEDSTRGPERCHOME=$(df /home -h | tail -n 1 | awk '{print $5}')
	STRGHOME=$(df /home -h | tail -n 1 | awk '{print $2}')
	UPTIME=$(uptime -p)
	printf "\e[0;34msystem load:\e[m\t${AVLD}\n"
	printf "\e[0;34musage of /:\e[m\t${USEDSTRGPERC}% (${USEDSTRG}/${STRG})\n"
	printf "\e[0;34musage of /home:\e[m\t${USEDSTRGPERCHOME}% (${USEDSTRGHOME}/${STRGHOME})\n"
	printf "\e[0;34mmemory usage:\e[m\t${USEDMEM}\n"
	printf "\e[0;34mswap usage:\e[m\t${USEDSWAP}\n"
	printf "\e[0;34muptime:\e[m\t\t${UPTIME}\n"
}

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
export REPORTTIME=10
alias vi="nvim"
alias vim="nvim"
alias upgrade_dotfiles="sh $HOME/.dotfiles/tools/upgrade.sh"
alias timestamp='date -u +%FT%TZ'
alias yt-dlp-opus="yt-dlp -f 251 -x"

# AsahiLinux useful aliases
alias reload_net="sudo systemctl restart NetworkManager wpa_supplicant" # iwd"



add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  #tea
