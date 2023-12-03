#!/bin/bash

#for debian ubuntu

#sudo apt-get update
sudo apt-get install -y git zsh curl vim wget powerline
#zsh-antigen installed below

git config --global user.email "cmpoon@users.noreply.github.com"
git config --global user.name "cmpoon"

curl -L git.io/antigen > ~/antigen.zsh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ./zsh/* ~/
cp ./vim/.vimrc ~/
mkdir ~/.vim/colors/
cp ./vim/molokai.vim ~/.vim/colors/

vim +PluginInstall +qall
#command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)" "${USER}"
#chsh -s zsh
echo "Done!"
zsh
