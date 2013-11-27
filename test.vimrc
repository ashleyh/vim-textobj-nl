set nocompatible

" I HAVE NO IDEA WHAT I'M DOING
let cwd = getcwd()
let &rtp = cwd . '/vader.vim,' . cwd . '/vim-textobj-user,' . cwd
