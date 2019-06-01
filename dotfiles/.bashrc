# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
source /etc/bashrc

# Start GNU Screen
if [[ -z "$STY" ]]; then
    screen -xRR session_name \
	#   -m guile
fi

# Exports
export GUILE_LOAD_PATH=/home/brettg/Repos/guix-system:$GUILE_LOAD_PATH
export PATH=/home/brettg/.local/bin:$PATH

# Adjust the prompt depending on whether we're in 'guix environment'.

if [ -n "$GUIX_ENVIRONMENT" ]
then
    if [ -f "$GUIX_ENVIRONMENT/bin/utop" ]
    then
	PS1='[\u@\h] [\w] [ocaml] λ '
	
    elif [ -f "$GUIX_ENVIRONMENT/bin/ccls" ]
    then	
	PS1='[\u@\h] [\w] [cobjc] λ '

    elif [ -f "$GUIX_ENVIRONMENT/bin/coqtop" ]
    then	
	PS1='[\u@\h] [\w] [coq] λ '

    elif [ -f "$GUIX_ENVIRONMENT/bin/python3" ]
    then	
	PS1='[\u@\h] [\w] [python] λ '
	 
    else
	PS1='[\u@\h] [\w] [env] λ '
    fi
else
    PS1='[\u@\h] [\w] λ '
fi

alias ls='ls -p --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias emacs='emacs --no-x-resources'
