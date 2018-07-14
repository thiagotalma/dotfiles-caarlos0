#!/bin/sh
set -e

if [ ! -d /usr/local/opt/fzf ]; then
  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git /usr/local/opt/fzf
else
  git --work-tree /usr/local/opt/fzf fetch
  git --work-tree /usr/local/opt/fzf reset --quiet --hard @{u}
fi

/usr/local/opt/fzf/install --bin
