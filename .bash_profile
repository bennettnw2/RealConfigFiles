# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# User specific environment and startup programs
HISTCONTROL=ignorespace:erasedups
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export TERM=screen-256color

# Color LS output to differentiate between directories and files
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""

# Fuzzy Finder Configs
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

# Have bash use vim key bindings on the command line
set -o vi
