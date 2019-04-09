# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
