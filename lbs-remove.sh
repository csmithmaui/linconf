#!/bin/bash

rm -rf ~/.vim_runtime ~/solarized
rm ~/.vimrc

if [ -f ~/.vimrc.orig ]; then
    mv ~/.vimrc.orig ~/.vimrc
fi


#Commenting this because the new command I added into the installer is more complex but sed can't replace it 
#easily because it's multiline.
#sed -i ' s/export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)//g' ~/.bashrc

rm -rf ~/.dircolors


gconftool --recursive-unset /apps/gnome-terminal

echo "Successfully Removed Linux Bootstrap Script"
echo "Run \`source ~/.bashrc\` to complete."
 
