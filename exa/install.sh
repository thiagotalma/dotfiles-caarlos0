#!/bin/sh
set -e
test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"

get_download_url() {
  curl -s https://api.github.com/repos/ogham/exa/releases/latest |
    grep -o 'https://.*linux-x86_64.*\.zip'
}

last_version() {
  echo $1 |
    grep -o "v.*/" |
    sed 's/\///'
}

download() {
  local 
  version="$(last_version $1)" || true
  test -z "$version" && {
    echo "Unable to get exa version."
    exit 1
  }
  echo "Downloading exa $version..."
  rm -f /tmp/exa.zip
  curl -s -L -o /tmp/exa.zip "$1"
}

extract() {
  unzip -qu /tmp/exa.zip -d "$TMPDIR"
}

download_url="$(get_download_url)"
download $download_url
extract || true
sudo mv -f "$TMPDIR"/exa-linux-x86_64 /usr/local/bin/exa
which exa