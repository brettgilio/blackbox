# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -e /home/brettg/.nix-profile/etc/profile.d/nix.sh ]; then . /home/brettg/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
