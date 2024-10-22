#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
    mkdir -p $HOME/.config
fi

if [ -d "$HOME/.config/vim.d" ]; then
    rm -rf $HOME/.config/vim.d
fi

git clone -q https://github.com/cyrnicolase/vimrc.git $HOME/.config/vim.d
if [ $? != 0 ]; then
    echo "git clone fail!"
    exit 1
fi

if [ -f "$HOME/.vimrc" ]; then
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ -L "$HOME/.vimrc" ]; then
    rm $HOME/.vimrc
fi
ln -s $HOME/.config/vim.d/.vimrc $HOME/.vimrc

if [ -d "$HOME/.vim" ]; then
    mv $HOME/.vim $HOME/.vim.bak
fi
if [ -L "$HOME/.vim" ]; then
    rm $HOME/.vim
fi
ln -s $HOME/.config/vim.d/.vim $HOME/.vim

curl -sSfLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "OK!!"
