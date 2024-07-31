#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source $HOME/Programming/thirdparty/nodejs/node-env.sh 

alias tmux='tmux new -s "${PWD##*/}"'

