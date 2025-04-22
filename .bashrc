# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
# Enable starship prompt
# eval "$(starship init bash)"
# export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# ~~~~~~~~~~~~~~~ Local functions  ~~~~~~~~~~~~~~~~~~~~~~~~

_have() { type "$1" &>/dev/null; }

# ~~~~~~~~~~~~~~~ General settings  ~~~~~~~~~~~~~~~~~~~~~~~~
# Turn on brew
eval "$(/opt/homebrew/bin/brew shellenv)"

set LANG="en_US.UTF-8"

# Set to superior editing mode
set -o vi
# Turn on posix to get TAB completion
set +o posix

# keybinds
bind -x '"\C-l":clear'

# Support gpt globally
# declare OPENAI_API_KEY
# OPENAI_API_KEY="$(head -1 "$HOME/.config/gpt/token")"
# export OPENAI_API_KEY

# ~~~~~~~~~~~~~~~ Exports  ~~~~~~~~~~~~~~~~~~~~~~~~
# Make terminal default 258 colors
export TERM=xterm-256color

# Force nvim use my vimrc
# export VIMINIT="source $HOME/.vimrc"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export YARN_RC_FILENAME=~/.config/yarn/.yarnrc

# Local scripts
export PATH="$HOME/.local/bin:$PATH"

# Force FZF (including fzf.vim) use fd and its ignore
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"

# rg (Ripgrep) config
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/config"

## bash files
export HISTFILE=~/.config/bash/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

## Set vim as default editor
export EDITOR="vim"

## repos
export REPOS="$HOME/repos"
export ICLOUD="$HOME/Library/Mobile\ Documents/"
export LOGSEQ="$ICLOUD/iCloud~com~logseq~logseq/Documents"
export ZET="$ICLOUD/iCloud~md~obsidian/Documents/zet"

# Go language
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPROXY="direct"

# Rancher desktop
export PATH="$HOME/.rd/bin:$PATH"

## bat
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# Specify git global config
export GIT_CONFIG_GLOBAL=~/.config/git/config

# Disable less history file in my home folder
export LESSHISTFILE=-

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
# Change directories to most used fodlers & search in them
alias cr="cd $REPOS"
alias cdt="cd $REPOS/dotfiles"
alias cl="cd $LOGSEQ/Notes\ Engine"
alias lf="cl && ff"
alias lfs="cl && fs"
alias cfg="cd $HOME/.config && ff"
alias cz="cd $ZET"
alias zf="cz && ff"
alias zfs="cz && fs"

# Files handling
alias mkdir="mkdir -p"
# alias ls="eza -lla --group-directories-first"
# alias ls="ls -lah"
# alias cat="bat -p"

# if command -v eza &>/dev/null; then
# 	alias ls="eza -lla --group-directories-first"
# else
# 	alias ls="ls -lah"
# fi

# Use GNU ls instead of BSD so that we can group directiories
alias ls="gls -lah --group-directories-first"

# Check if 'bat' is installed
# if command -v bat &>/dev/null; then
# 	alias cat="bat -p"
# fi

# re-source the bash
alias src="source $HOME/.config/bash/.bashrc"

# Connect to my raspberry
alias raspi="ssh raspi"

# No need to add the number
alias python="python3"

# gdiff
# alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-light"
alias gdiff="git diff | view -"

# Find in directory
alias fd="fd --color=always"

# Edit rc files from everywhere
alias vv="vim $HOME/.vimrc"
alias vb="vim $HOME/.config/bash/.bashrc"
alias eb="ed $HOME/.config/bash/.bashrc"
# alias vn="nvim $HOME/.config/nvim/init.lua"

# Source this file from everywhere
alias src="source $HOME/.config/bash/.bashrc"

# Make grep to be colourfull
alias grep='grep -i -H -n --colour=auto'
alias egrep='egrep -i -H -n --colour=auto'
alias fgrep='fgrep -i -H -n --colour=auto'

# Do not save wget history files in home foler
alias wget="wget --hsts-file ~/dotfiles/config/wget/wget-hsts"

# Point vi to real vi not vim
alias vi="nvi"
# Point ex to real ex not vim
alias ex="nvi -e"

# ~~~~~~~~~~~~~~~ Others (utilities, language specifics etc) ~~~~~~~~~~~~~~~~~~~~~~~~
# fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

# Rust
source "$HOME/.cargo/env"

# Custom prompt
# from rwxrob. added newlines before all type of prompts (long, short, double)
# for better readability

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]' \
		g="\[\033[38;2;90;82;76m\]"

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="\n$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="\n${g}╔$u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n${g}╚$p$P$x "
	double="\n${g}╔$u\u$g$PROMPT_AT$h\h$g:$w$dir\n${g}║$B\n${g}╚$p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi

	if _have tmux && [[ -n "$TMUX" ]]; then
		tmux rename-window "$(wd)"
	fi
}

wd() {
	dir="${PWD##*/}"
	parent="${PWD%"/${dir}"}"
	parent="${parent##*/}"
	echo "$parent/$dir"
} && export wd

PROMPT_COMMAND="__ps1"
