function! textobj#nl#next_obj_a(open, close)
  call search(a:open, 'ce')
  let head_pos = getpos('.')
  call search(a:close, 'ce')
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#nl#next_round_a()
  return textobj#nl#next_obj_a('(', ')')
endfunction

function! textobj#nl#next_square_a()
  return textobj#nl#next_obj_a('[', ']')
endfunction

function! textobj#nl#next_curly_a()
  return textobj#nl#next_obj_a('{', '}')
endfunction
