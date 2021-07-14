#! /bin/bash

# add security section here
# no root log-in
# remove unused ports

# Install Software - vim, tmux, lynx, git, cups
# ==================================================================================================== 
apt install vim
apt install tmux
apt install lynx
apt install git
apt install cups

# Configure Software
# ==================================================================================================== 
wget -O .vimrc https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.vimrc  &&  \
wget -O .tmux.conf https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.tmux.conf  &&  \
wget -O .bashrc https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.bashrc    && \
wget -O .bash_profile https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.bash_profile  && \
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&. vim +PlugInstall +qall && \
. .bash_profile && . .bashrc

# Upload Config files and send to /etc/skel
