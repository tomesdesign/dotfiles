#
# ~/.bashrc
#
# for some reason my backspace suddenly work

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make terminal default 258 colors
export TERM=xterm-256color

# Set to superior editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

# PATH
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"

# Support gpt globally
declare OPENAI_API_KEY
OPENAI_API_KEY="$(head -1 "$HOME/.config/gpt/token")"
export OPENAI_API_KEY

# ~~~~~~~~~~~~~~~ Exports  ~~~~~~~~~~~~~~~~~~~~~~~~

## bash
# export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

## repos
export REPOS="$HOME/repos"
export GHUSER="$REPOS/tomesink"
export ZET='$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/zet'

## deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

#alias vi="nvi"
#alias vi="vim"
# TODO: make homebrew vim as default
#alias v="/opt/homebrew/bin/vim"
alias cr="cd $REPOS"
alias cdd="cd $GHUSER/dotfiles"
alias cz="cd '$ZET'"

alias src="source $HOME/.bashrc"
alias raspi="ssh raspibolt"
alias ls="eza -ll --group-directories-first"
#alias cat="bat -p --color=never"
alias lynx="$HOME/.local/bin/lynx"
alias rss="newsboat -r"
alias '?'="duck"
alias '??'="gpt"
alias mutt="neomutt"
alias python="python3"

alias z="ff $ZET/Cards"
alias zs="fs $ZET/Cards"

alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"

alias fd="fd --color=always"
alias la="ls -la"

alias vv="vim $HOME/.vimrc"
alias vb="vim $HOME/.bashrc"

# cmake
alias cm="cmake -S . -B build"
alias mb="make -C build"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
