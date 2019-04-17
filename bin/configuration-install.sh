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
