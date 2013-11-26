" guard {{{
if exists('g:loaded_textobj_nl') || &cp
  finish
endif

let g:loaded_textobj_nl = 1
" }}}

call textobj#user#plugin('nl', {
\ 'round': {
\   'select-a-function': 'textobj#nl#next_round_a',
\   'select-a': ['anb', 'an(', 'an)'],
\ },
\ 'square': {
\   'select-a-function': 'textobj#nl#next_square_a',
\   'select-a': ['anr', 'an[', 'an]'],
\ },
\ 'curly': {
\   'select-a-function': 'textobj#nl#next_curly_a',
\   'select-a': ['anB', 'an{', 'an}'],
\ },
\})
