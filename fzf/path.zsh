#!/bin/sh
test -d /usr/local/opt/fzf/shell || return 0

export PATH="$PATH:/usr/local/opt/fzf/bin"

export FZF_COMPLETION_TRIGGER='~~'

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_OPTS='--exit-0'

# wfxr/formarks
export FZF_MARKS_JUMP='^b'
