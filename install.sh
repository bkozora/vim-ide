#!/bin/bash

# Rename our ugly default unfuddle directory
if [ -d ~/lsfinteractive_vim-ide ]
    mv ~/lsfinteractive_vim-ide ~/vim-ide
fi

if [ -d ~/vim-ide ]

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
    ln -s ~/vim-ide/.vimrc ~/.vimrc
    ln -s ~/vim-ide ~/.vim

    # Create file for local customizations
    touch ~/.vimrc.local

fi
