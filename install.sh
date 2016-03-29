#!/bin/bash

##
#  Let's create a kickass vim environment
#
#  @author Robert Kozora <bobby@kozora.me>
##

# Make sure we use bash or else our plugins start whining... Fish is better though!
set shell=/bin/bash

# start fresh
cd ~/

# see if we have already cloned vim-ide
if [ ! -d ~/vim-ide ]
    then
    # Clone my repo
    git clone https://github.com/bkozora/vim-ide.git ~/vim-ide
    printf "Cloned Bobby\'s kickass Vim configuration\n"
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
            echo "Backed up your existing ~/.vimrc to ~/.vimrc-old \n"
            mv ~/.vimrc ~/.vimrc-old
        fi

        if [ -d ~/.vim ]
        then
            # Backup our old .vim directory
            echo "Backed up your existing ~/.vim directory to ~/.vim-old \n"
            mv ~/.vim ~/.vim-old
        fi

        # Symlink to our new vim configuration
        ln -s ~/vim-ide/.vimrc ~/.vimrc
        ln -s ~/vim-ide ~/.vim
        printf "\nCreated symlinks to point Vim to our new kickass environment..."

        # Create file for local customizations
        touch ~/.vimrc.local
        printf "\nCreated ~/.vimrc.local Place any customizations there to override the default configuration\n"
fi

printf "You should be all set! \n  - If you wanna tweak it, use ~/.vimrc.local   - If you ABSOLUTELY hate it, break the
symlinks to ~/.vim and ~/.vimrc"


