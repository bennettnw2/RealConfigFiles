echo "Begin with the end in mind."

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#-------------------------------------------------------------
# Bash Aliases
#-------------------------------------------------------------
alias e='exit'
alias c='clear'
alias ld='ls -lhd'
alias ll='ls -lh'
alias lla='ls -lha'
alias cl='clear && ls'
alias lsm='ls *.md'
alias pls='sudo $(history -p \!\!)'
alias grep='/usr/bin/egrep'
export PS1=$'___________________ \h | \u \w \n$ '

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
alias linr="linode-cli linodes reboot"
alias linrbld="linode-cli linodes rebuild"
alias linsh="linode-cli linodes shutdown"

#-------------------------------------------------------------
# React Aliases
#-------------------------------------------------------------
alias cra="create-react-app ."

# These were giving me trouble when they were being sourced.  I realized
# that this is a recursive alias in the sense that they reference another alias.
# To solve this, I can create a function or a script that the alias calls?

# alias linll="linode-cli linodes list $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
# alias linconn="ssh root@$(linl | tail -n 2 | head -n 1 | awk '{print $14}')"
# alias lindlast="linode-cli linodes delete $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
#=============================================================
