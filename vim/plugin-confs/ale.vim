"------------------------------------------------------------------------------
"ale
"------------------------------------------------------------------------------

" lsp handled by coc
let g:ale_disable_lsp = 1

let g:ale_sh_shellcheck_executable = '/usr/bin/shellcheck'
let g:ale_sh_shellcheck_options = '-S info -s bash -o all -e 2250'
let g:ale_sh_shfmt_options = '-i=4 -ci -sr'
let g:ale_fix_on_save = 1
let g:ale_set_loclist=1
let g:ale_set_quickfix=0
let g:ale_virtualenv_dir_names = ['env']

let g:ale_linter_aliases = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript']}
let g:ale_linters = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript'], 'python': ['pylint','pycodestyle', 'pydocstyle'], 'sh': ['shellcheck']}
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'sh': ['shfmt'], 'typescript': ['eslint'], 'python': ['black']}

