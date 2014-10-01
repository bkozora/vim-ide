#!/bin/bash

# Rename our ugly default unfuddle directory
if [ -d ~/lsfinteractive_vim-ide ]
    then
        echo "Moving ~/lsfinteractive_vim-ide to ~/vim-ide..."
        mv ~/lsfinteractive_vim-ide ~/vim-ide
fi

if [ -d ~/vim-ide ]
    then
        # Set up our git submodule dependencies
        git submodule init
        git submodule update

        printf "\n\n\nInitialized submodule plugins...\n\n\n"

        # backup our existing configurations
        if [ -f ~/.vimrc ]
        then
            # Backup our .vimrc
            echo "Backed up your existing ~/.vimrc to ~/.vimrc-old"
            mv ~/.vimrc ~/.vimrc-old
        fi

        if [ -d ~/.vim ]
        then
            # Backup our old .vim directory
            echo "Backed up your existing ~/.vim directory to ~/.vim-old"
            mv ~/.vim ~/.vim-old
        fi

        # Symlink to our new vim configuration
        ln -s ~/vim-ide/.vimrc ~/.vimrc
        ln -s ~/vim-ide ~/.vim
        echo "Created symlinks to point Vim to our new kickass environment..."

        # Create file for local customizations
        touch ~/.vimrc.local
        printf "\n\nCreated ~/.vimrc.local Place any customizations in there to override the default configurations set up"

fi

