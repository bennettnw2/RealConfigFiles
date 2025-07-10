# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --exclude-dir=.git/'
    alias fgrep='fgrep --color=auto --exclude-dir=.git/'
    alias egrep='egrep --color=auto --exclude-dir=.git/'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

echo "Begin with the end in mind."

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

export PS1=$'\n___________________ \h | \u \w \n$ '

#-------------------------------------------------------------
# chatgpt
#-------------------------------------------------------------
export OPENAI_API_KEY=&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
alias cba='cd ~/Chatgpt && source chatgpt_cli/bin/activate'

#-------------------------------------------------------------
# configure go latest
#-------------------------------------------------------------
export GOROOT=/usr/bin/go
export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:/home/$USER/.local/bin:$GOPATH/bin"
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/Code/go/bin

#-------------------------------------------------------------
# GoLang Aliases
#-------------------------------------------------------------
alias run='go run'

#-------------------------------------------------------------
# Bash Aliases
#-------------------------------------------------------------
alias e='exit'
alias c='clear'
alias t='tmux'
alias ld='ls -lhd'
alias ll='ls -lht'
alias lla='ls -lhat'
alias rmh='rm -rf'
alias fz='vim $(fzf --exact)'
alias cl='clear && ll -th'
alias cls='clear && ll -th | head'
alias lsm='ls *.md'
alias pls='sudo $(history -p \!\!)'
trsh () { mv $1 /home/$USER/.trash; }
mkcd () { mkdir -p -- "$1" && cd -P -- "$1"; }
alias clp='xclip -selection clipboard'
alias clip='xclip -selection clipboard tmp.txt'

#-------------------------------------------------------------
# Git Aliases
#-------------------------------------------------------------
alias gs='git status --short -b'
alias gaa='git add -A'
alias gc='git commit'
alias gpu='git push -u origin master'

#-------------------------------------------------------------
# Git CLI Aliases
#-------------------------------------------------------------
alias gwr='gh workflow run'
alias grl='gh run view $1 --log'

#-------------------------------------------------------------
# Kubernetes Aliases
#-------------------------------------------------------------
alias kc='kubectl'

#-------------------------------------------------------------
# Helm Aliases
#-------------------------------------------------------------
alias hm='helm'

#-------------------------------------------------------------
# Linode CLI Aliases
#-------------------------------------------------------------
alias lin="linode-cli"
alias lini="linode-cli images list"
alias linl="linode-cli linodes list"
linlst () { linode-cli linodes list --text | awk '{print $1,$2,$7}' | column -t; }
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
# WSL2 aliases
#-------------------------------------------------------------
alias open='wslview'
alias ssh='ssh -qo "StrictHostKeyChecking=no"'
alias curl='curl.exe'
alias xclp='clip.exe'
alias win='cd /mnt/c/Users/U1254374'
alias winex='powershell.exe -File'
alias getkey='clip.exe < ~/.ssh/id_rsa.pub && echo OK.'

#-------------------------------------------------------------
# Other Aliases
#-------------------------------------------------------------
alias s3='s3cmd'
alias fd='fdfind'
alias py='python3'
alias md='mdless'
alias ist="TZ='Asia/Kolkata' date +%a\ %D\ %I:%M\ %p\ %Z"
alias bfg="java -jar $HOME/Installers/bfg.jar"
alias sc="sc-im"
alias vi="vim"
alias v="vim"
alias mcl="vim /mnt/c/Users/U1254374/Code/ManualColdLock/bin/ManualColdlock64.mcl"
alias gl="glow -pw 0"

#-------------------------------------------------------------
# Obsidian
#-------------------------------------------------------------
alias sb="cd ~/Workspace/Notes"
# alias nn='vim ~/Workspace/Notes/0_Inbox/"$(TZ='America/New_York' date +'%Y%m%d_%H%M')".md'
alias td='vim ~/Workspace/Notes/1_Projects/TODO-"$(TZ='America/New_York' date +'%Y%m%d_%H%M')".md'


# These were giving me trouble when they were being sourced.  I realized
# that this is a recursive alias in the sense that they reference another alias.
# To solve this, I can create a function or a script that the alias calls?

# alias linll="linode-cli linodes list $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
# alias linconn="ssh root@$(linl | tail -n 2 | head -n 1 | awk '{print $14}')"
# alias lindlast="linode-cli linodes delete $(linl | tail -n 2 | head -n 1 | awk '{print $2}')"
#=============================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
