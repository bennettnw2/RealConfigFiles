# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# User specific environment and startup programs
HISTCONTROL=ignorespace:erasedups
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export VISUAL="vim"
# export TERM=screen-256color

# Color LS output to differentiate between directories and files
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""

# Fuzzy Finder Configs
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND="fdfind --hidden ."

# Have bash use vim key bindings on the command line
set -o vi

export MONGO_URI='mongodb+srv://*********************************************.mongodb.net/?retryWrites=true&w=majority'
