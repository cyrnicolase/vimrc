#!/bin/bash

if [ ! -d ~/.config/ ]; then
    mkdir -p ~/.config
fi


git clone -q https://github.com/cyrnicolase/vimrc.git ~/.config/vim.d
if [ $? != 0 ]; then
    echo "git clone fail!"
    exit 1
fi

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/.config/vim.d/vimrc/.vimrc ~/.vimrc

if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s ~/.config/vim.d/vimrc/.vim ~/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
