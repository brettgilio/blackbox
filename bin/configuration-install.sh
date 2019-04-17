#!/run/current-system/profile/bin/bash

echo "Creating directory and file symlinks, and updating attributes..."

cd ..

# Symlink ./dotfiles to appropriate locations

for dotfile in screenrc bash_profile bashrc gitconfig guile nanorc nix-channels offlineimaprc Xdefaults Xresources
	       
do
    if [ -f "$HOME/.${dotfile}" ]; then
	echo "$HOME/.${dotfile} exists, skipping..."
    else
	echo "Creating $HOME/.${dotfile}..."
	ln -rs "./dotfiles/.${dotfile}" "$HOME/.${dotfile}"
    fi
done

# Symlink configuration.d directories to appropriate locations

for configs in emacs.d stumpwm.d

do # This is failing to recognize that the directory exists. Fix.
    if [ -f "$HOME/.${configs}" ]; then
	echo "$HOME/.{configs} exists, skipping..."
    else
	echo "Creating $HOME/.${configs}..."
	ln -rs ".${configs}" "$HOME" 
    fi
done
