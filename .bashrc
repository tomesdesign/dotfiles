#
# ~/.bashrc
#
# for some reason my backspace suddenly work

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make terminal default 258 colors
export TERM=xterm-256color

set LANG="en_US.UTF-8"

# Set to superior editing mode
set -o vi
# Turn on posix to get TAB completion
set +o posix

# keybinds
bind -x '"\C-l":clear'

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Support gpt globally
declare OPENAI_API_KEY
OPENAI_API_KEY="$(head -1 "$HOME/.config/gpt/token")"
export OPENAI_API_KEY

# ~~~~~~~~~~~~~~~ Exports  ~~~~~~~~~~~~~~~~~~~~~~~~

## bash
export HISTFILE=~/.config/bash/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

## repos
export REPOS="$HOME/repos"
export GHUSER="$REPOS/martin-tomes"
export ICLOUD="$HOME/Library/Mobile\ Documents/"
export LOGSEQ="$ICLOUD/iCloud~com~logseq~logseq/Documents"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
alias cr="cd $REPOS"
alias cgh="cd $GHUSER"
alias cdf="cd $GHUSER/dotfiles"
alias crt="cd $GHUSER/js/react-tutorials"
alias clg="cd $LOGSEQ"

#alias vi="vim"
#alias vim="nvim"

alias src="source $HOME/.bashrc"

alias raspi="ssh raspibolt"

alias ls="eza -ll --group-directories-first"
alias cat="bat -p"

alias '?'="duck"
alias '??'="gpt"

alias python="python3"

alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"

alias fd="fd --color=always"
alias la="ls -la"

# fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="/Users/martin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# if [ -z "$TMUX" ]; then
#   tmux attach -t default || tmux new -s default
# fi