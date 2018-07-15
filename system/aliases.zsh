#!/bin/sh

# exa is a better ls tool
if which exa >/dev/null 2>&1; then
	alias ls='exa'
	alias l='exa -la --git'
	alias la='exa -laa --git'
	alias ll='exa -l --git'
	alias ldate='exa -laa --git --sort modified'    # sort by date
	alias lchange='exa -laa --git --sort accessed'  # sort by access time
else
	alias ls="ls -F --color"
	alias l="ls -lAh"
	alias la="ls -A"
	alias ll="ls -l"
	alias ldate="ls -ltr"                         # sort by date
	alias laccess="ls -ltur"                      # sort by access time
fi

alias lx="ls -d -1 $PWD/**"                     # show full path

# Alias chmod commands
alias mx="chmod +x"
alias 000="chmod 000"
alias 644="chmod 644"
alias 755="chmod 755"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"
alias cp="cp -iv"                 # Copia sempre com confirmação
alias mv="mv -iv"                 # Move sempre com confirmação

# quick hack to make watch work with aliases
alias watch='watch '

# Pastas
alias ..="cd ./.."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# Good 'ol Clear Screen command
alias cls='clear'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# find files in our current directory
alias fhere="find . -name "

# Update && Upgrade
alias update="sudo apt-get update && sudo apt-get upgrade"
