#!/bin/bash

cd ~

sudo apt-get install -y aptitude vim screen curl git exuberant-ctags 

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bk
fi

git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sed -i 's/peaksea/solarized/g; s/desert/solarized/g' ~/.vim_runtime/vimrcs/basic.vim
sed -i 's/peaksea/solarized/g; s/desert/solarized/g' ~/.vim_runtime/vimrcs/extended.vim
echo "call togglebg#map(\"<F5>\")" > ~/.vim_runtime/my_configs.vim
sh ~/.vim_runtime/install_awesome_vimrc.sh

mkdir -p solarized
git clone https://github.com/seebi/dircolors-solarized.git solarized/dircolors-solarized/

ln -sf ~/solarized/dircolors-solarized/dircolors.256dark ~/.dircolors
eval `dircolors ~/.dircolors`

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git solarized/gnome-terminal-colors-solarized/
~/solarized/gnome-terminal-colors-solarized/set_dark.sh

touch ~/.bashrc

echo "
case \"\$TERM\" in screen*)
    export TERM=screen-256color
    ;;
*)
    export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
    ;;
esac
" >> ~/.bashrc

#echo "export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)" >> ~/.bashrc
#echo "export TERM=screen-256color" >> ~/.screenrc

echo "Successfully Installed Linux Bootstrap Script!"
echo "Execute \`source .bashrc\` to complete."
