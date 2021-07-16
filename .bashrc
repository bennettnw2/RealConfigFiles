echo "Begin with the end in mind."

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

export PS1=$'___________________ \h | \u \w \n$ '
export PATH="$PATH:/home/$USER/.local/bin"

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
alias rm='mv $1 ~/.trash'
alias clp='xclip -selection clipboard'
alias clip='xclip -selection clipboard tmp.txt'

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
alias linl="linode-cli linodes list --text | awk '{print $2,$1,$7}' | cloumn -t -s' '"
alias linc="linode-cli linodes create"
alias lind="linode-cli linodes delete"
alias linr="linode-cli linodes reboot"
alias linrbld="linode-cli linodes rebuild"
alias linsh="linode-cli linodes shutdown"

#-------------------------------------------------------------
# systemctl Aliases
#-------------------------------------------------------------
alias ctlstt="systemctl start"
alias ctlstp="systemctl stop"
alias ctlrst="systemctl restart"
alias ctlsts="systemctl status"
alias ctlrld="systemctl reload"
alias ctldis="systemctl disable"
alias ctlena="systemctl enable"

#-------------------------------------------------------------
# Other Aliases
#-------------------------------------------------------------
alias s3='s3cmd'
alias fd='fdfind'

# These were giving me trouble when they were being sourced.  I realized
# that this is a recursive alias in the sense that they reference another alias.
# To solve this, I can create a function or a script that the alias calls?

# alias linll="linode-cli linodes list $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
# alias linconn="ssh root@$(linl | tail -n 2 | head -n 1 | awk '{print $14}')"
# alias lindlast="linode-cli linodes delete $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
#=============================================================
