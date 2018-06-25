#!/bin/sh
test -d ~/.fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'

# shellcheck disable=SC1091
. ~/.fzf/shell/completion.zsh
