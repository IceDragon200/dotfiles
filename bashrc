#
# ~/.bashrc
#
if ! [ "$0" = "/bin/bash" ] ; then return; fi
[[ $- != *i* ]] && return
##
# Find any global bashrc config files
if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc   # --> Read /etc/bashrc, if present.
fi

alias ls='ls --color=auto'

export EDITOR="vim"
export PATH=$PATH":/home/icy/bin/"

# [time] server|username [working directory] $
PS1='[\t] \[\e[1m\]\[\e[34m\]\h\[\e[0m\]|\[\e[1m\]\u\[\e[0m\] \[\e[94m\][\W]\[\e[0m\] \$ '
PS2='> '
PS3='> '
PS4='+ '

# added by travis gem
[ -f /home/icy/.travis/travis.sh ] && source /home/icy/.travis/travis.sh
source /usr/share/nvm/init-nvm.sh
