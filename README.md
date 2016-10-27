# How to Install VIM-IDE #

1. Make sure Vim and dependencies (most importantly ctags) are installed
   ```sh
   sudo apt-get update && apt-get install vim-runtime vim-common vim-gui-common vim-tiny curl exuberant-ctags
   ```
2. Clone the GIT repo to your HOME directory (or /etc/skel to have it created for new system users too) and cd into it
   ```sh
    cd ~/
    git clone https://github.com/bkozora/vim-ide
    ```
3. Run the included install script
   ```sh
   cd vim-ide
   ./install.sh
   ```

That should handle it all for you, if not, here are the manual steps the install script performs:

- Get latest GIT Submodule dependencies
  - ```git submodule init```
  - ```git submodule update```
- Create Symbolic Link to vim-ide so vim can find it
  - ```ln -s ~/vim-ide ~/.vim```
  - ```ln -s ~/vim-ide/.vimrc ~/.vimrc```
  - ```touch ~/.vimrc.local```

The .vimrc.local file allows you to override configurations within the environment
that you absolutely hate. If for some strange reason you despise line numbers, simply
define: ```set nonumber``` in your ~/.vimrc.local file.

Check out the mappings files for details on mapped shortcuts. You can also run ```:map``` from inside of vim to find more custom keymaps I've exposed. All default Vim functionality should be left intact.

There are many color schemes included in the bundle. I've included a plugin to
make scrolling through them all easy. Simply press escape then type ```:SCROLL``` then use the arrow keys to cycle through all of the themes. Once you find one you like you can add it to your ```~/.vimrc.local``` file like so:

```colorscheme NameOfScheme```

Enjoy!
Bobby Kozora
