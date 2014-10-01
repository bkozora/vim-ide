#!/bin/bash

# Rename our ugly default unfuddle directory
if [ -d ~/lsfinteractive_vim-ide ]
    then
        echo "Moving ~/lsfinteractive_vim-ide to ~/vim-ide..."
        cd ~/
        mv ~/lsfinteractive_vim-ide ~/vim-ide
fi

if [ -d ~/vim-ide ]
    then
        cd ~/vim-ide

        # Set up our git submodule dependencies
        git submodule init
        git submodule update

        printf "\nInitialized submodule plugins...\n"

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
        echo "\nCreated symlinks to point Vim to our new kickass environment..."

        # Create file for local customizations
        touch ~/.vimrc.local
        printf "\nCreated ~/.vimrc.local Place any customizations in there to override the default configurations set
        up\n\n"

fi

