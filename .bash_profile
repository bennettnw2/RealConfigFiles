#-------------------------------------------------------------
#=============================================================
# PUBLIC ALIASES
#=============================================================
#-------------------------------------------------------------
# Bash Aliases
#-------------------------------------------------------------
alias e='exit'
alias c='clear'
alias ld='ls -d'
alias ll='ls -lh'
alias lla='ls -lha'
alias cl='clear && ls'
alias lsm='ls *.md'
alias pls='sudo $(history -p \!\!)'
alias grep='/usr/bin/egrep'
export PS1="_____________________ macOS | \w \n$ "

#-------------------------------------------------------------
# Git Aliases
#-------------------------------------------------------------
alias gs='git status'
alias gaa='git add -A'
alias gc='git commit'
alias gpu='git push -u origin master'

#-------------------------------------------------------------
# Linode CLI Aliases
#-------------------------------------------------------------
alias lin="linode-cli"
alias lini="linode-cli images list"
alias linl="linode-cli linodes list"
alias linc="linode-cli linodes create"
alias lind="linode-cli linodes delete"
alias linr="linode-cli linodes rebuild"
alias linsh="linode-cli linodes shutdown"

#=============================================================
