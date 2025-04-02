# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"
echo -e '\e[2 q'

# Enable starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Force FZF (including fzf.vim) use fd and its ignore
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"

# rg (Ripgrep) config
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/config"

# Enable colors and change prompt:cr
autoload -U colors && colors

# Go language
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPROXY="direct"

# Local scripts
export PATH="$HOME/.local/bin:$PATH"
# Make terminal default 258 colors
export TERM=xterm-256color

# Rancher desktop
export PATH="$HOME/.rd/bin:$PATH"

# Support gpt globally
#declare OPENAI_API_KEY
#OPENAI_API_KEY="$(head -1 "$HOME/.config/gpt/token")"
#export OPENAI_API_KEY

## repos
export REPOS="$HOME/repos"
export ICLOUD="$HOME/Library/Mobile\ Documents/"
export LOGSEQ="$ICLOUD/iCloud~com~logseq~logseq/Documents"
export ZET="$ICLOUD/iCloud~md~obsidian/Documents/zet"

export EDITOR="vim"

## BAT
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"

# Specify git global config
export GIT_CONFIG_GLOBAL=~/.config/git/config
# Disable less history file in my home folder
export LESSHISTFILE=-

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
alias cr="cd $REPOS"
# alias cgh="cd $GHUSER"
alias cdt="cd $REPOS/dotfiles"
alias clq="cd $LOGSEQ"
alias lqf="clq && ff"
alias cfg="cd $HOME/.config && ff"
alias cz="cd $ZET"
alias zf="cz && ff"
alias zfs="cz && fs"

alias mkdir="mkdir -p"
alias ls="eza -lla --group-directories-first"

# Download videos
alias yd="yt-dlp"

# alias vi="nvim"
#alias vim="nvim"

alias src="source $HOME/.config/zsh/.zshrc"

alias raspi="ssh raspi"

alias cat="bat -p"

alias '?'="duck"
alias '??'="gpt"

alias python="python3"

alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"

alias fd="fd --color=always"

alias vv="vim $HOME/.vimrc"
alias vz="vim $HOME/.config/zsh/.zshrc"

alias src="source $HOME/.config/zsh/.zshrc"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY         # Share history between sessions

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-chars

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source <(fzf --zsh)
source "$HOME/.cargo/env"
