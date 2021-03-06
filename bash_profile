# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/go/bin
export PATH

c_yell='\[\e[00;33m\]'
c_reset='\[\e[0m\]'
c_white='\[\e[00;37m\]'
c_cyan='\[\e[00;36m\]'
c_red='\[\e[00;31m\]'
c_green='\[\e[00;32m\]'
c_magenta='\[\e[00;95m\]'
c_purple='\[\e[00;35m\]'

# bash settings
export PROMPTDIRTRIM=2
export HISTSIZE=-1
export HISTTIMEFORMAT="[%Y/%m/%d %T]"
export PS1="${c_magenta}[\u@\h:\w]\$ ${c_reset}"
export HISTCONTROL=ignorespace


# make <C-s> works in bash. Can also be achieved in PuTTY as well: 
# Connection->SSH->TTY -> Mode -> IXION = 0
stty -ixon

case $TERM in
  xterm*|vte*)
    PROMPT_COMMAND='history -a; printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen*)
    PROMPT_COMMAND='history -a; printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

alias vi=vim

if [ -z "$TMUX" ]; then
  tmux
fi

# local config
if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi

