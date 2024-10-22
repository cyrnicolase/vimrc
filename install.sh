#!/bin/bash

if [ ! -d ~/.config/vimd ]; then
    mkdir -p ~/.config/vimd
fi

git clone https://github.com/cyrnicolase/vimrc.git ~/.config/vimd
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/.config/vimd/vimrc/.vimrc ~/.vimrc

if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s ~/.config/vimd/vimrc/.vim ~/.vim
