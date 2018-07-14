#!/bin/sh
test -d /usr/local/opt/marker || return 0

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"
