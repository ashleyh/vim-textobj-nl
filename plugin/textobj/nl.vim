" guard {{{
if exists('g:loaded_textobj_nl') || &cp
  finish
endif

let g:loaded_textobj_nl = 1
" }}}

function s:setup()
  let objs = {
  \ 'round': ['b', '(', ')'],
  \ 'square': ['r', '[', ']'],
  \ 'curly': ['B', '{', '}'],
  \ }
  let settings = {}
  for direction in ['next', 'last']
    let dir_key = direction[0]
    for [obj, keys] in items(objs)
      let name = direction . '_' . obj
      let settings[name] = {
      \ 'select-a-function': 'textobj#nl#' . name . '_a',
      \ 'select-a': map(copy(keys), '"a' . dir_key . '" . v:val'),
      \ 'select-i-function': 'textobj#nl#' . name . '_i',
      \ 'select-i': map(copy(keys), '"i' . dir_key . '" . v:val'),
      \ }
    endfor
  endfor
  call textobj#user#plugin('nl', settings)
endfunction

call s:setup()
