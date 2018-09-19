#!/bin/sh
test -d /usr/local/opt/fzf/shell || return 0

export PATH="$PATH:/usr/local/opt/fzf/bin"

export FZF_DEFAULT_OPTS='
  --color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

# --select-1 automatically selects the item if there's only one
# --exit-0 automatically exits when the list is empty
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if which highlight >/dev/null 2>&1; then
  export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
else
  export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(cat {} || tree -C {}) 2> /dev/null | head -200'"
fi

export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"


# wfxr/formarks
export FZF_MARKS_JUMP='^b'


# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
