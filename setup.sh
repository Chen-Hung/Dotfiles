#!/bin/bash

##############################################################################
# setup.sh 
# Setup all dotfiles from github and move old files to dotfiles_old
##############################################################################
 

dir=~/dotfiles
olddir=~/dotfiles_old
rcfiles="vimrc tmux.conf"

# Creating dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "..done"

for file in $rcfiles; do
	echo "Moving old dotfile to $olddir"
  mv ~/.$file $olddir	
	echo "Creating symlink to $file in home dir"
	ln -s $dir/$file ~/.$file
done

# Vim setup
echo "Moving old .vim to $olddir"
mv ~/.vim $olddir
cp $dir/vim ~/.vim

# echo "Add some useful"
chsh -s /bin/zsh
