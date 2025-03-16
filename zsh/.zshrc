# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"
echo -e '\e[2 q'

# Enable starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Enable colors and change prompt:cr
autoload -U colors && colors

# Set PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
# Make terminal default 258 colors
export TERM=xterm-256color

# Support gpt globally
#declare OPENAI_API_KEY
#OPENAI_API_KEY="$(head -1 "$HOME/.config/gpt/token")"
#export OPENAI_API_KEY

## repos
export REPOS="$HOME/repos"
export GHUSER="$REPOS/martin-tomes"
export ICLOUD="$HOME/Library/Mobile\ Documents/"
export ZET="$ICLOUD/iCloud~com~logseq~logseq/Documents"

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
alias cgh="cd $GHUSER"
alias cdt="cd $GHUSER/dotfiles"
alias cz="cd $ZET"
alias zf="cz && ff"

# Download videos
alias yd="yt-dlp"

# alias vi="nvim"
#alias vim="nvim"

# Emacs client
alias ec="/Applications/Emacs.app/Contents/MacOS/bin-arm64-11/emacsclient -nc"

alias src="source $HOME/.config/zsh/.zshrc"

alias raspi="ssh raspibolt"

alias ls="eza -ll --group-directories-first"
alias la="eza -la --group-directories-first"
#alias cat="bat -p"

alias '?'="duck"
alias '??'="gpt"

alias python="python3"

alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"

alias fd="fd --color=always"
alias la="ls -la"

alias vv="vim $HOME/.vimrc"
alias vz="vim $HOME/.config/zsh/.zshrc"
alias vn="cd $HOME/.config/nvim && nvim ."

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

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source <(fzf --zsh)
