export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ "$OSTYPE" == "darwin"* ]]; then
	# needed for brew
	eval "$(/opt/homebrew/bin/brew shellenv)"
	eval "$(starship init bash)"
	export STARSHIP_CONFIG=~/.config/starship/starship.toml
fi

if [[ "$OSTYPE" == "linux"* ]]; then
	# Prevent annoying error messaging when installing APT packages
	export LC_ALL=C
fi

export HISTFILE=~/.config/bash/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi
stty -ixon
