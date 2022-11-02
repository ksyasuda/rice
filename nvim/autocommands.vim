" open at last location if possible
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" open help and man pages in a vertical split
autocmd FileType help wincmd L
autocmd FileType man wincmd L
" make terminal not have line numbers
autocmd TermOpen * setlocal nonumber norelativenumber
