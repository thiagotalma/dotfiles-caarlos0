#!/bin/sh
test -d "$HOME/.local/share/marker" || return 0

export FZF_MARKER_CONF_DIR=/usr/local/opt/marker/tldr
export FZF_MARKER_COMMAND_COLOR='\x1b[38;5;255m'
export FZF_MARKER_COMMENT_COLOR='\x1b[38;5;8m'
export FZF_MARKER_MAIN_KEY='\C-@'
export FZF_MARKER_PLACEHOLDER_KEY='\C-v'

source "$HOME/.local/share/marker/marker.sh"
