# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX="true" # multiuser brew
export HOMEBREW_NO_AUTO_UPDATE=1
export TERM="xterm-256color"

export PATH=$HOME/Library/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/Library/bin/42-utils:$PATH
export PATH="$HOME/Library/bin/sherlock":$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH" # gnu-sed instead of OSX sed
# export PATH="/Users/almayor/Library/Python/3.8/bin:$PATH"
export PATH="/Users/almayor/Library/Python/3.7/bin:$PATH"

hash -d 42school=~/Documents/programming/42

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

if [ $TERM_PROGRAM = "iTerm.app" ]; then
	ZSH_THEME="powerlevel10k/powerlevel10k"
else
	ZSH_THEME="almayor"
fi

plugins=(
	git git-auto-fetch colored-man-pages
	docker docker-compose history lorem-ipsum npm osx sublime zshmarks
)

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/spectrum.zsh

alias resource="source ~/.zshrc"
alias zshrc="subl ~/.zshrc"

# login сommands
cd $HOME/Desktop
fortune -n 10 | cowsay

alias jpn="jupyter notebook"
alias yd="youtube-dl -f mp4 --external-downloader aria2c"
alias norminette="~/.norminette/norminette.rb"
alias norm="norminette -R CheckForbiddenSourceHeader"
alias full-leaks="MallocStackLogging=1 leaks --atExit --"

# searching man pages
function manswitch() {
	man $1 | less -p "^ +$2 "
}

# lgrep (by analogy with pgrep)
function lgrep() {
	ls -a | grep $@
}

# yadm https://yadm.io
function yadm() {
	if [[ $@ == "send" ]]; then
		command yadm add -u
		command yadm commit -m "update"
		command yadm push origin master
	else
		command yadm "$@"
	fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
