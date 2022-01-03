syntax on
set laststatus=2		"enable status bar
set number				"turn on line numbers
set colorcolumn=80		"set color column on col 80
set tw=80
set shiftwidth=4
set tabstop=4
set autoindent			"auto indents code
set smartindent			"smart indents code
set hlsearch			"highlight search
set smartcase			"set search case based on search query
set noerrorbells		"no error bells
set title				"set title of vim based on file open
set mouse=a             " enable mouse in vim
set nospell

set encoding=UTF-8
set guifont=FiraCode\ Nerd\ Font\ 18

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'valloric/youcompleteme'

Plug 'tabnine/YouCompleteMe'

Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/SQLUtilities'

Plug 'itchyny/vim-gitbranch'

Plug 'ap/vim-css-color'

Plug 'wakatime/vim-wakatime'

Plug 'itchyny/lightline.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'jiangmiao/auto-pairs'

Plug 'mhinz/vim-startify'

Plug 'alvan/vim-closetag'

Plug 'MathSquared/vim-python-sql'

Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'tpope/vim-commentary'

Plug 'dense-analysis/ale'

Plug 'shime/vim-livedown'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug '~/.fzf'

Plug 'tpope/vim-fugitive'

Plug 'kristijanhusak/vim-carbon-now-sh'

Plug 'prabirshrestha/vim-lsp'

Plug 'ryanoasis/vim-devicons'


Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'romgrk/doom-one.vim'

call plug#end()

let g:doom_one_terminal_colors = v:true

" carbon now
" let g:carbon_now_sh_base_url = 'http://localhost:8888'
let g:carbon_now_sh_browser = 'firefox'


"jump to remembered position in file if available
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"fzf
"
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"Center of screen and popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"livedown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 3001
" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"

function! FormatShell(buffer) abort
  return {
  \   'command': 'shfmt -i=0 -ci -sr'
  \}
endfunction

execute ale#fix#registry#Add('shfmt', 'FormatShell', ['sh'], 'shfmt for shell')

"ale
let g:ale_linter_aliases = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript']}
let g:ale_linters = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript'], 'python': ['pylint','pycodestyle', 'pydocstyle'], 'sh': ['shellcheck']}
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'sh': ['FormatShell'], 'typescript': ['eslint'], 'python': ['autopep8'], 'sql': ['pgformatter']}

let g:ale_fix_on_save = 1
let g:ale_virtualenv_dir_names = ['env']

"vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts,*.jsx,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js,*.ts'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }


let g:ycm_autoclose_preview_window_after_insertion = 1 "close ycm help window after accepting option
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'python',
  \     'filetypes': [ 'py' ],
  \     'cmdline': [ '/usr/bin/jedi-language-server' ]
  \    },
  \   {
  \     'name': 'bash',
  \     'filetypes': [ 'sh' ],
  \     'cmdline': [ '/usr/bin/bash-language-server' ]
  \    }
  \ ]
let g:ycm_autoclose_preview_window_after_completion = 1

let g:wakatime_PythonBinary = '/usr/bin/python'  " (Default: 'python')
let g:wakatime_OverrideCommandPrefix = '/usr/bin/wakatime'  " (Default: '')

"Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_temp_file=0

"NERDTREE
"autocmd vimenter * NERDTree "launch nerdtree on vim start
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right" "open nerdtree on the right
let NERDTreeShowHidden=0 "show hidden files use capital 'I' to toggle
"autocmd VimEnter * wincmd p "put the cursor back into the editing pane on start

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
"avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


"NERDTree hilight files by extension
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#282c34')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#282c34')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('html', 'red', 'none', 'yellow', '#282c34')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#282c34')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#282c34')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#282c34')
call NERDTreeHighlightFile('js', 'yellow', 'none', '#ffa500', '#282c34')
call NERDTreeHighlightFile('jsx', 'yellow', 'none', '#ffa500', '#282c34')
call NERDTreeHighlightFile('tsx', 'yellow', 'none', '#ffa500', '#282c34')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#282c34')
call NERDTreeHighlightFile('cpp', 'blue', 'none', 'blue', '#282c34')
call NERDTreeHighlightFile('h', 'cyan', 'none', 'cyan', '#282c34')
call NERDTreeHighlightFile('txt', 'blue', 'none', 'red', '#282c34')

let g:NERDTreeColorMapCustom = {
    \ "Modified"  : ["#528AB3", "NONE", "NONE", "NONE"],
    \ "Staged"    : ["#538B54", "NONE", "NONE", "NONE"],
    \ "Untracked" : ["#BE5849", "NONE", "NONE", "NONE"],
    \ "Dirty"     : ["#299999", "NONE", "NONE", "NONE"],
    \ "Clean"     : ["#87939A", "NONE", "NONE", "NONE"]
    \ }

"PRETTIER
packloadall "enable prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_path = "/usr/bin/prettier"

"LIGHTLINE
" 'onedark', 'material', 'darcula'
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'Readonly',
      \   'modified': 'Modified',
      \   'filename': 'Filename'
      \
      \ },
	  \ 'component': {
	  \   'charhexvalue': '0x%B'
	  \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  }
      \ }

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

"COLORSCHEME
if !has('gui_running')
  set t_Co=256
endif


set noshowmode "disable default vim insert text at bottom
let g:onedark_termcolors=256 "enable 256 colors
" packadd! onedark.vim "add onedark colorcheme may not work
" colorscheme onedark  "set colorsheme as onedark

"material theme
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
" let g:material_theme_style = 'default'
colorscheme material


"Tokyo night conifg
let g:tokyonight_style='night'
let g:tokyonight_transparent_background=1
let g:tokyonight_enable_italic=1

"let g:molokai_original = 1
let g:rehash256 = 1


"bash language server
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif


"KEYBINDINGS
map <C-c> :nohls<Cr>
map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> <Plug>(Prettier)
map<C-c> :nohls<CR>
map <F5> :!
map <C-T> :ter++close<CR>
map <C-D> :YcmShowDetailedDiagnostic<CR>
map <C-l> :LivedownToggle<CR>
map <C-o> :FZF ~<CR>
