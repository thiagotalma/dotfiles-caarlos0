#!/bin/sh
set -e

if [ ! -d /usr/local/opt/marker ]; then
  git clone --quiet --depth 1 https://github.com/pindexis/marker /usr/local/opt/marker
else
  git --work-tree /usr/local/opt/marker fetch
  git --work-tree /usr/local/opt/marker reset --quiet --hard @{u}
fi

/usr/local/opt/marker/install.py 2>/dev/null
