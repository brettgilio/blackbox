# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -e /home/brettg/.nix-profile/etc/profile.d/nix.sh ]; then . /home/brettg/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opam configuration
test -r /home/brettg/.opam/opam-init/init.sh && . /home/brettg/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
