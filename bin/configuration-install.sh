#!/run/current-system/profile/bin/bash

echo "Creating directory and file symlinks, and updating attributes..."

cd ..

# Symlink ./dotfiles to appropriate locations

### .screenrc

if [ -f "$HOME/.screenrc" ]; then
    echo "$HOME/.screenrc exists, skipping..."
else
    echo "Creating $HOME/.screenrc"
    ln -rs ./dotfiles/.screenrc "$HOME/.screenrc"
fi

### .bash_profile

if [ -f "$HOME/.bash_profile" ]; then
    echo "$HOME/.bash_profile exists, skipping..."
else
    echo "Creating $HOME/.bash_profile"
    ln -rs ./dotfiles/.bash_profile "$HOME/.bash_profile"
fi

### .bashrc

if [ -f "$HOME/.bashrc" ]; then
    echo "$HOME/.bashrc exists, skipping..."
else
    echo "Creating $HOME/.bashrc"
    ln -rs ./dotfiles/.bashrc "$HOME/.bashrc"
fi

### .gitconfig

if [ -f "$HOME/.gitconfig" ]; then
    echo "$HOME/.gitconfig exists, skipping..."
else
    echo "Creating $HOME/.gitconfig"
    ln -rs ./dotfiles/.gitconfig "$HOME/.gitconfig"
fi

### .guile

if [ -f "$HOME/.guile" ]; then
    echo "$HOME/.guile exists, skipping..."
else
    echo "Creating $HOME/.guile"
    ln -rs ./dotfiles/.guile "$HOME/.guile"
fi

### .nanorc

if [ -f "$HOME/.nanorc" ]; then
    echo "$HOME/.nanorc exists, skipping..."
else
    echo "Creating $HOME/.nanorc"
    ln -rs ./dotfiles/.nanorc "$HOME/.nanorc"
fi

### .nix-channels

if [ -f "$HOME/.nix-channels" ]; then
    echo "$HOME/.nix-channels exists, skipping..."
else
    echo "Creating $HOME/.nix-channels"
    ln -rs ./dotfiles/.nix-channels "$HOME/.nix-channels"
fi

### .offlineimaprc

if [ -f "$HOME/.offlineimaprc" ]; then
    echo "$HOME/.offlineimaprc exists, skipping..."
else
    echo "Creating $HOME/.offlineimaprc"
    ln -rs ./dotfiles/.offlineimaprc "$HOME/.offlineimaprc"
fi

### .Xdefaults

if [ -f "$HOME/.Xdefaults" ]; then
    echo "$HOME/.Xdefaults exists, skipping..."
else
    echo "Creating $HOME/.Xdefaults"
    ln -rs ./dotfiles/.Xdefaults "$HOME/.Xdefaults"
fi

### .Xresources

if [ -f "$HOME/.Xresources" ]; then
    echo "$HOME/.Xresources exists, skipping..."
else
    echo "Creating $HOME/.Xresources"
    ln -rs ./dotfiles/.Xresources "$HOME/.Xresources"
fi
