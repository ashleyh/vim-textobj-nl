set nocompatible
syntax on

" I HAVE NO IDEA WHAT I'M DOING
let cwd = getcwd()
let &rtp = cwd . '/deps/vader.vim,'
       \ . cwd . '/deps/vim-textobj-user,'
       \ . cwd . '/..'
