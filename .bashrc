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

# export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

export REPOS="$HOME/repos"
export GHUSER="$REPOS/tomesink"
export ZET="$GHUSER/zet"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"
# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

#alias vi="nvi"
#alias vi="vim"
# TODO: make homebrew vim as default
#alias v="/opt/homebrew/bin/vim"
alias cr="cd $REPOS"
alias cdt="cd $GHUSER/dotfiles"
alias cz="cd $GHUSER/zet"
alias cpb="cd $GHUSER/pb071"
alias cs="cd $GHUSER/dotfiles/scripts"

alias src="source $HOME/.bashrc"
alias raspi="ssh raspibolt"
alias ls="eza --group-directories-first"
alias cat="bat -p --color=never"
alias lynx="$HOME/.local/bin/lynx"
alias rss="newsboat -r"
alias '?'="duck"
alias '??'="gpt"
alias mutt="neomutt"
alias python="python3"
alias ffz="ff $ZET"
alias fsz="fs $ZET"
alias fsrw="fs $REPOS/rwxrob/zet/docs/"
alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"

alias fd="fd --color=never"
alias ls="ls -ll"
alias ls="ls -la"

alias vv="vim $HOME/.vimrc"
alias vb="vim $HOME/.bashrc"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
