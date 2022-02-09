"------------------------------------------------------------------------------
" Lightline
"------------------------------------------------------------------------------

let g:lightline = {}
" 'one', 'material', 'darcula', 'deus'
let g:lightline.colorscheme = "deus"
" let g:lightline.colorscheme = "one"
" let g:lightline.colorscheme = "darcula"
let g:lightline.component_function = {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'Readonly',
      \   'modified': 'Modified',
      \   'filename': 'Filename',
      \   'cocstatus': 'coc#status',
      \}

let g:lightline.component = { 'charhexvalue': '0x%B' }
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2"  }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3"  }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'fugitive', 'filename' ] ],
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	        \            [ 'percent' ],
	        \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
function! Modified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! Readonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! MyFugitive()
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
endfunction

function! Filename()
  return ('' != Readonly() ? Readonly() . ' ' : '') .
    \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != Modified() ? ' ' . Modified() : '')
endfunction

