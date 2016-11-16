#!/bin/bash -x
echo start
hash vim 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
cp .vimrc ~/.vimrc
cp .vim ~/.vim -r
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo | vim +PluginInstall +qall
echo end
