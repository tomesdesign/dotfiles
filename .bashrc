#
# ~/.bashrc
#

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

export ZET="$HOME/repos/zet"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

#alias vi="nvi"
alias vi="vim"
alias repos="cd $HOME/repos"
alias dotfiles="cd $HOME/repos/dotfiles"
alias src="source $HOME/.bashrc"
alias ideaverse="cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Ideaverse"
alias raspi="ssh raspibolt"
#alias ls="eza --group-directories-first"
alias cat="bat -p --color=never"
alias lynx="$HOME/.local/bin/lynx"
alias rss="newsboat -r"
alias '?'="duck"
alias '??'="gpt"
alias mutt="neomutt"
alias python="python3"
alias draspi="docker exec -it -u admin -w /home/admin raspios /bin/bash"
alias sles="docker exec -it -u admin -w /home/admin sles /bin/bash"
alias ffz="ff $ZET"
alias fsz="fs $ZET"
alias fsrwx="fs $HOME/repos/rwxrob/zet/docs/"
alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=gruvbox-dark"
alias pb="$HOME/repos/pb071"
alias sb="cd $ZET"
alias vimb="vim $HOME/.bashrc"
alias vimv="vim $HOME/.vimrc"
alias fd="fd --color=never"
alias ls="ls -ll"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
