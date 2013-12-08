#!/bin/bash
set -e

usage() {
  echo "$0" "[--headless]"
  exit 1
}

cd "$(dirname "$0")"

interactive=yes
while [[ $# -gt 0 ]] ; do
  case "$1" in
    --headless) unset interactive ;;
    *) usage ;;
  esac
  shift
done

if [[ ! -d deps ]] ; then
  urls=(
    https://github.com/kana/vim-textobj-user
    https://github.com/junegunn/vader.vim
  )
  echo "Test dependencies missing; I'll git clone the following urls for you:"
  for url in "${urls[@]}" ; do echo "   $url" ; done
  if [[ -n "$interactive" ]] ; then
    echo "Press enter to continue or ^C to cancel:"
    read
  fi
  mkdir deps
  pushd deps
  for url in "${urls[@]}" ; do git clone "$url" ; done
  popd
fi

if [[ -n "$interactive" ]] ; then
  cmd="Vader"
else
  cmd="Vader!"
fi

vim -u test.vimrc -c "$cmd" test.vader
