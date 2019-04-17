#!/run/current-system/profile/bin/bash

# Prompt user for case

i=0

while [ $i -lt "1" ]; do
    read -p "Do you want to generate symlinks? ==> " yn
    case $yn in
	[Yy] ) ((i++));;
	[Nn] ) exit;;
	* ) echo "Please answer Y or N.";;
    esac
done


echo "Creating directory and file symlinks, and updating attributes..."

cd ..

# Symlink ./dotfiles to appropriate locations

for dotfile in screenrc bash_profile bashrc gitconfig guile \
			nanorc nix-channels offlineimaprc Xdefaults \
			Xresources zprofile gdbinit
	       
do
    if [ -f "$HOME/.${dotfile}" ]; then
	echo "$HOME/.${dotfile} | FILE exists, skipping..."
    else
	echo "Creating $HOME/.${dotfile}..."
	ln -rs "./dotfiles/.${dotfile}" "$HOME/.${dotfile}"
    fi
done

# Symlink configuration.d directories to appropriate locations

for configs in emacs.d stumpwm.d

do
    if [ -d "$HOME/.${configs}" ]; then
	echo "$HOME/.${configs} | DIRECTORY exists, skipping..."
    else
	echo "Creating $HOME/.${configs}..."
	ln -rs ".${configs}" "$HOME" 
    fi
done
