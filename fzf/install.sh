#!/bin/sh
set -e
test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"

get_download_url() {
  curl -s https://api.github.com/repos/junegunn/fzf-bin/releases/latest |
    grep -o 'https://.*linux_amd64.tgz'
}

last_version() {
  echo $1 |
    cut -f8 -d'/'
}

download() {
  local 
  version="$(last_version $1)" || true
  test -z "$version" && {
    echo "Unable to get fzf version."
    exit 1
  }
  echo "Downloading fzf $version..."
  rm -f /tmp/fzf.tgz
  curl -s -L -o /tmp/fzf.tgz "$1"
}

extract() {
  tar -xf /tmp/fzf.tgz -C "$TMPDIR"
}

download_url="$(get_download_url)"
download $download_url
extract || true
sudo mv -f "$TMPDIR"/fzf /usr/local/bin/fzf
which fzf