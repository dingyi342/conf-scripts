#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias new-mac='sudo macchanger -r wlan0'
alias start-wicd='sudo rc.d start wicd'
PS1='[\u@\h \W]\$ '
