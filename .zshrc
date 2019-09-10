# custom aliases

alias li="ls -a"
alias resource="source ~/.zshrc"
alias zshrc="subl ~/.zshrc"
alias cdd="cd $HOME/Desktop"

# School 42 specific aliases

alias run="gcc -Wall -Wextra -Werror -o output *.c && ./output"
# Libfttest https://github.com/jtoty/Libftest
alias libfttest="bash /Users/user/Desktop/Libftest/grademe.sh"

# zsh plugins

ZSHP="$HOME/.zsh-plugins"

# login directory

cd $HOME/Desktop

# Anaconda plugins are sourced from a separate rc file as sourcing is slow

alias aconda="source $HOME/.zshrc-conda"
alias jpn="jupyter notebook"
#aconda # toggle to automatically load conda at start-up

# SublimeText

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH

# OH-MY-ZSH

export ZSH=$ZSHP/oh-my-zsh

ZSH_THEME="almayor"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/spectrum.zsh

# 42-utilities

alias mf-gen="/bin/sh $ZSHP/42-utilities/update.sh; python3 $ZSHP/42-utilities/mf-gen.py"
alias proto-list="/bin/sh $ZSHP/42-utilities/update.sh; sh $ZSHP/42-utilities/proto-list.sh"

# colored-man-pages

source $ZSHP/colored-man-pages/colored-man-pages.plugin.zsh

# zsh-autoswitch-conda –- https://github.com/bckim92/zsh-autoswitch-conda.git

# invoked by aconda alias
# source $ZSHP/zsh-autoswitch-conda/autoswitch_conda.plugin.zsh

# ansiweather https://github.com/fcambus/ansiweather

alias weather="ansiweather"

# bashmarks https://github.com/ebgraham/bashmarks

source $ZSHP/bashmarks/bashmarks.sh

# prevent brew to automatically update when installing packages

export HOMEBREW_NO_AUTO_UPDATE=1

# yadm https://yadm.io

yadm() {
	if [[ $@ == "send" ]]; then
		command yadm add -u
		command yadm commit -m "update"
		command yadm push origin master
	else
		command yadm "$@"
	fi
}

# enter directory: cd and list files

function ed() {
	if (test -d $1); then
		cd $1
		ls -a
	else
		echo "ed: $1 not found"
	fi
}

# update Brewfile with brew bundle

brew() {
	if [[ $1 == "bundle" && $2 == "redump" ]]; then
		`cd $HOME && command brew bundle --force dump`
	else
		command brew $@
	fi
}

# calibre tools for ebook creation and editing

export PATH=/Applications/calibre.app/Contents/console.app/Contents/MacOS/:$PATH

# searching man pages

function manswitch()
{
	man $1 | less -p "^ +$2 "
}

# faster download with youtube-dl

alias yd="youtube-dl -f mp4"

# get location where a picture was taken with ExifTool

function exiftool-gps() {
	open "https://www.google.com/maps/place/$(exiftool -ee -p '$gpslatitude, $gpslongitude' -c "%d?%d'%.2f"\" $1 2> /dev/null | tr -d ' ')" 
}

# lgrep (by analogy with pgrep)

function lgrep() {
	ls -a | grep $@
}

# Spotify CLI

function spotify() {
	if [[ $1 == "play" ]]; then
		osascript -e 'tell application "Spotify" to play'
	elif [[ $1 == "pause" ]]; then
		osascript -e 'tell application "Spotify" to pause'
	fi
}

# added bin directory in $HOME

export PATH=$HOME/bin:$PATH

# lorem-ipsum

alias lorem-ipsum="/Users/user/.zsh-plugins/lorem_ipsum/lorem_ipsum.sh"
