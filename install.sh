#!/bin/bash


# Set up our git submodule dependencies
git submodule init
git submodule update

# backup our existing configurations
if [ -f ~/.vimrc ]
then
    # Backup our .vimrc
    mv ~/.vimrc ~/.vimrc-old
fi

if [ -d ~/.vim ]
then
    # Backup our old .vim directory
    mv ~/.vim ~/.vim-old
fi

# Symlink to our new vim configuration
ln -s .vimrc ~/.vimrc
ln -s . ~/.vim

# Create file for local customizations
touch ~/.vimrc.local
