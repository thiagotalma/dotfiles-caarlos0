#!/bin/sh
test -d "$HOME/.local/share/marker" || return 0

source "$HOME/.local/share/marker/marker.sh"
