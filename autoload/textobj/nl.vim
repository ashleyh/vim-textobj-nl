" next a {{{
function! textobj#nl#next_obj_a(open)
  call search(a:open, 'ce')
  let head_pos = getpos('.')
  normal! %
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#next_round_a()
  return textobj#nl#next_obj_a('(')
endfunction

function! textobj#nl#next_square_a()
  return textobj#nl#next_obj_a('[')
endfunction

function! textobj#nl#next_curly_a()
  return textobj#nl#next_obj_a('{')
endfunction
" }}}

" next i {{{
function! textobj#nl#next_obj_i(open)
  " XXX erk, not sure if this is the best way
  let old_ww = &ww
  set ww+=h,l
  call search(a:open, 'ce')
  normal! l
  let head_pos = getpos('.')
  normal! h%h
  let tail_pos = getpos('.')
  let &ww = old_ww
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#next_round_i()
  return textobj#nl#next_obj_i('(')
endfunction

function! textobj#nl#next_square_i()
  return textobj#nl#next_obj_i('[')
endfunction

function! textobj#nl#next_curly_i()
  return textobj#nl#next_obj_i('{')
endfunction
" }}}

" last a {{{
function! textobj#nl#last_obj_a(open)
  call search(a:open, 'bce')
  let tail_pos = getpos('.')
  normal! %
  let head_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#last_round_a()
  return textobj#nl#last_obj_a(')')
endfunction

function! textobj#nl#last_square_a()
  return textobj#nl#last_obj_a(']')
endfunction

function! textobj#nl#last_curly_a()
  return textobj#nl#last_obj_a('}')
endfunction
" }}}

" last i {{{
function! textobj#nl#last_obj_i(open)
  " XXX erk, not sure if this is the best way
  let old_ww = &ww
  set ww+=h,l
  call search(a:open, 'bce')
  normal! h
  let tail_pos = getpos('.')
  normal! l%l
  let head_pos = getpos('.')
  let &ww = old_ww
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#last_round_i()
  return textobj#nl#last_obj_i(')')
endfunction

function! textobj#nl#last_square_i()
  return textobj#nl#last_obj_i(']')
endfunction

function! textobj#nl#last_curly_i()
  return textobj#nl#last_obj_i('}')
endfunction
" }}}

" quotes {{{
function! textobj#nl#last_quote_i(quote)
endfunction

function! textobj#nl#next_quote_i(quote)
  let old_ww = &ww
  set ww+=h,l
  call search(a:quote, 'ce')
  normal! l
  let head_pos = getpos('.')
  call search('\\\@<!' . a:quote)  " bleurgh
  normal! h
  let tail_pos = getpos('.')
  let &ww = old_ww
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#last_quote_a(quote)
endfunction

function! textobj#nl#next_quote_a(quote)
  call search(a:quote, 'ce')
  let head_pos = getpos('.')
  call search('\\\@<!' . a:quote)  " bleurgh
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#last_double_i()
  return textobj#nl#last_quote_i('"')
endfunction

function! textobj#nl#next_double_i()
  return textobj#nl#next_quote_i('"')
endfunction

function! textobj#nl#last_double_a()
  return textobj#nl#last_quote_a('"')
endfunction

function! textobj#nl#next_double_a()
  return textobj#nl#next_quote_a('"')
endfunction
" }}}
