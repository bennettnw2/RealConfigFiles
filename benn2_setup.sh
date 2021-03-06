#! /bin/bash

# add security section here
# ==================================================================================================== 
# no root log-in
# remove unused ports

# Install Software - vim, tmux, lynx, git, cups
# ==================================================================================================== 
sudo apt install vim
sudo apt install tmux
sudo apt install lynx
sudo apt install git
sudo apt install cups

# backup .bashrc and .bash_profile
# ==================================================================================================== 

# Configure Software
# ==================================================================================================== 
wget -O .vimrc https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.vimrc
wget -O .tmux.conf https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.tmux.conf
wget -O .bashrc https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.bashrc
wget -O .bash_profile https://raw.githubusercontent.com/bennettnw2/RealConfigFiles/master/.bash_profile
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
. .bash_profile && . .bashrc

# Upload Config files and send to /etc/skel
# ==================================================================================================== 
