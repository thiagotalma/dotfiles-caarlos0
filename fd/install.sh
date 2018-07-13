#!/bin/sh
set -e

get_download_url() {
  curl -s https://api.github.com/repos/sharkdp/fd/releases/latest |
    grep -v 'musl' |
    grep -o 'https://.*_amd64.deb'
}

last_version() {
  echo $1 |
    cut -f8 -d'/'
}

download() {
  local 
  version="$(last_version $1)" || true
  test -z "$version" && {
    echo "Unable to get fd version."
    exit 1
  }
  echo "Downloading fd $version..."
  rm -f /tmp/fd.deb
  curl -s -L -o /tmp/fd.deb "$1"
}

download_url="$(get_download_url)"
download $download_url
sudo dpkg -Ei /tmp/fd.deb
which fd
