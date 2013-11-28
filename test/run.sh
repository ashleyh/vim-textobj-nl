#!/bin/bash
set -e
cd "$(dirname "$0")"
if [[ ! -d deps ]] ; then
  urls=(
    https://github.com/kana/vim-textobj-user
    https://github.com/junegunn/vader.vim
  )
  echo "Test dependencies missing; I'll git clone the following urls for you:"
  for url in "${urls[@]}" ; do echo "   $url" ; done
  echo "Press enter to continue or ^C to cancel:"
  read
  mkdir deps
  pushd deps
  for url in "${urls[@]}" ; do git clone "$url" ; done
  popd
fi
vim -u test.vimrc -c Vader test.vader
