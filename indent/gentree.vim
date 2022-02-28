" Vim indent file
" Filetype tree

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetGentreeIndent()
setlocal indentkeys=!^F,o,O,0}

function! GetGentreeIndent()
  let l:offset = shiftwidth()
  let l:lnum = prevnonblank(v:lnum - 1)
  let l:last_line = getline(l:lnum)

  " Find previous non blank line
  while strlen(l:last_line) == 0
    if l:lnum == 0
      return 0
    endif
    let l:lnum = prevnonblank(l:lnum - 1)
    let l:last_line = getline(l:lnum)
  endwhile

  if l:lnum == 0
    return 0
  endif

  let l:curr_line = getline(v:lnum)
  let l:ind = indent(l:lnum)

  " Indent rules
  if l:last_line =~ '^\s*\/\/.*$' || l:last_line =~ '^\s*--.*$' ||
        \ l:last_line =~ '^\s*\<\(struct\|union\)\>[^{]*$'
    " Do not adapt indent for comment or attributes
  elseif l:last_line !~ '\(;\|]\)\s*$'
    " Unterminated line
    let l:ind = l:ind + l:offset
  endif

  " Dedent rules
  if l:curr_line =~ '^\s*\}'
    let l:ind = l:ind - l:offset
  endif

  return l:ind
endfunction

