#
# ~/.bashrc
#
[[ $- != *i* ]] && return
##
# Find any global bashrc config files
if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc   # --> Read /etc/bashrc, if present.
fi

alias ls='ls --color=always'

export EDITOR="nano"
export PATH=$PATH":/home/icy/bin/"

# [time] server|username [working directory] $
PS1='[\t] \[\e[1m\]\[\e[34m\]\h\[\e[0m\]|\[\e[1m\]\u\[\e[0m\] \[\e[94m\][\W]\[\e[0m\] \$ '
PS2='> '
PS3='> '
PS4='+ '
