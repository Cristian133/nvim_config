#!/usr/bin/env bash

cp .vimrc ~/.vimrc

mkdir -p ~/.vim/{backups,colors,swaps,undo}
cp hybrid.vim ~/.vim/colors/hybrid.vim
