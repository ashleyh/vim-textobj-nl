#!/bin/bash
set -ex
git submodule update --init
vim -u test.vimrc -c Vader test.vader
