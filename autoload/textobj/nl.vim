function! s:shrink(range)
  let [v, head_pos, tail_pos] = a:range
  let head_pos[2] += 1
  if tail_pos[2] > 1
    let tail_pos[2] -= 1
  else
    let tail_pos[1] -= 1
    let tail_pos[2] = 99999  " XXX NOPE
  endif
  return [v, head_pos, tail_pos]
endfunction

" building blocks {{{
function! s:next_obj_a(open)
  call search(a:open, 'ce')
  let head_pos = getpos('.')
  normal! %
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! s:next_obj_i(open)
  return s:shrink(s:next_obj_a(a:open))
endfunction

function! s:last_obj_a(open)
  call search(a:open, 'bce')
  let tail_pos = getpos('.')
  normal! %
  let head_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! s:last_obj_i(open)
  return s:shrink(s:last_obj_a(a:open))
endfunction

function! s:next_quote_a(quote)
  call search(a:quote, 'ce')
  let head_pos = getpos('.')
  call search('\\\@<!' . a:quote)  " bleurgh
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! s:next_quote_i(quote)
  return s:shrink(s:next_quote_a(a:quote))
endfunction

function! s:last_quote_a(quote)
endfunction

function! s:last_quote_i(quote)
endfunction
" }}}

" copy pasta {{{
" next_obj_a {{{
function! textobj#nl#next_round_a()
  return s:next_obj_a('(')
endfunction

function! textobj#nl#next_square_a()
  return s:next_obj_a('[')
endfunction

function! textobj#nl#next_curly_a()
  return s:next_obj_a('{')
endfunction
" }}}

" next_obj_i {{{
function! textobj#nl#next_round_i()
  return s:next_obj_i('(')
endfunction

function! textobj#nl#next_square_i()
  return s:next_obj_i('[')
endfunction

function! textobj#nl#next_curly_i()
  return s:next_obj_i('{')
endfunction
" }}}

" last_obj_a {{{
function! textobj#nl#last_round_a()
  return s:last_obj_a(')')
endfunction

function! textobj#nl#last_square_a()
  return s:last_obj_a(']')
endfunction

function! textobj#nl#last_curly_a()
  return s:last_obj_a('}')
endfunction
" }}}

" last_obj_i {{{
function! textobj#nl#last_round_i()
  return s:last_obj_i(')')
endfunction

function! textobj#nl#last_square_i()
  return s:last_obj_i(']')
endfunction

function! textobj#nl#last_curly_i()
  return s:last_obj_i('}')
endfunction
" }}}

" quotes {{{
function! textobj#nl#last_double_i()
  return s:last_quote_i('"')
endfunction

function! textobj#nl#next_double_i()
  return s:next_quote_i('"')
endfunction

function! textobj#nl#last_double_a()
  return s:last_quote_a('"')
endfunction

function! textobj#nl#next_double_a()
  return s:next_quote_a('"')
endfunction
" }}}
" }}}
