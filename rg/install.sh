#!/bin/sh
set -e
set -x
test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"

get_download_url() {
  curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest |
    grep -o 'https://.*x86_64-unknown-linux-musl.tar.gz'
}

last_version() {
  echo $1 |
    cut -f8 -d'/'
}

download() {
  local 
  version="$(last_version $1)" || true
  test -z "$version" && {
    echo "Unable to get ripgrep version."
    exit 1
  }
  echo "Downloading ripgrep $version..."
  rm -f /tmp/rg.tar.gz
  curl -s -L -o /tmp/rg.tar.gz "$1"
}

extract() {
  tar -xf /tmp/rg.tar.gz -C "$TMPDIR"
}

download_url="$(get_download_url)"
download $download_url
extract || true
sudo mv -f "$TMPDIR"/**/rg /usr/local/bin/rg
sudo mv -f "$TMPDIR"/**/complete/rg /usr/share/zsh/vendor-completions/_rg
which rg