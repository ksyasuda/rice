syntax enable
filetype plugin on
set noshowmode "disable default vim insert text at bottom
set laststatus=2
set number
set colorcolumn=80
set tw=80
set shiftwidth=4
set tabstop=4
set autoindent
set ignorecase
set smartcase
set incsearch
set smartindent
set hlsearch
set ignorecase
set noerrorbells
set title
set mouse=a
set relativenumber
set splitright
set expandtab
set cursorline
set scrolloff=8
set sidescrolloff=8
set wildmenu " show candidates for vim commands with tab
set wildignore=*.o,*.obj,*.bak,*.exe
set background=dark
set showmatch
set nocompatible " no more vi
" set list
" set path from current directory and all directories under
set path=$PWD/**

set encoding=UTF-8
set guifont=FiraCode\ Nerd\ Font\ 18


" lsp handled by coc
let g:ale_disable_lsp = 1

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
Plug 'pechorin/any-jump.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'ap/vim-buftabline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'maximbaz/lightline-ale'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'osyo-manga/vim-over'
Plug 'mhinz/vim-startify'

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'romgrk/doom-one.vim'
Plug 'morhetz/gruvbox'
Plug 'vv9k/vim-github-dark'

call plug#end()

"------------------------------------------------------------------------------
" Enable :Man <man_page>
"------------------------------------------------------------------------------
runtime ftplugin/man.vim
"------------------------------------------------------------------------------
" Force help/man buffers into vertical split
"------------------------------------------------------------------------------
autocmd FileType help wincmd L
autocmd FileType man wincmd L

"------------------------------------------------------------------------------
"jump to remembered position in file if available
"------------------------------------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
"------------------------------------------------------------------------------
" Carbon Now
"------------------------------------------------------------------------------
" carbon now
" let g:carbon_now_sh_base_url = 'http://localhost:8888'
let g:carbon_now_sh_browser = 'firefox'
"------------------------------------------------------------------------------
"fzf
"------------------------------------------------------------------------------
" This is the default extra key bindings
let g:fzf_commands_expect = 'ctrl-enter'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.75 } }

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

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"------------------------------------------------------------------------------
"ale
"------------------------------------------------------------------------------
function! FormatShell(buffer) abort
  return {
  \   'command': 'shfmt -i=0 -ci -sr'
  \}
endfunction

execute ale#fix#registry#Add('shfmt', 'FormatShell', ['sh'], 'shfmt for shell')

let g:ale_linter_aliases = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript']}
let g:ale_linters = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript'], 'python': ['pylint','pycodestyle', 'pydocstyle'], 'sh': ['shellcheck']}
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'sh': ['FormatShell'], 'typescript': ['eslint'], 'python': ['autopep8'], 'sql': ['pgformatter']}

let g:ale_fix_on_save = 1
let g:ale_virtualenv_dir_names = ['env']

"------------------------------------------------------------------------------
"vim-closetag
"------------------------------------------------------------------------------
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

"------------------------------------------------------------------------------
" YOUCOMPLETEME (replaced with coc)
"------------------------------------------------------------------------------
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

"------------------------------------------------------------------------------
" WAKATIME
"------------------------------------------------------------------------------
let g:wakatime_PythonBinary = '/usr/bin/python'  " (Default: 'python')
let g:wakatime_OverrideCommandPrefix = '/usr/bin/wakatime'  " (Default: '')
"------------------------------------------------------------------------------
"NERDTREE
"------------------------------------------------------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right" "open nerdtree on the right
let NERDTreeShowHidden=0 "show hidden files use capital 'I' to toggle
let g:NERDTreeWinSize=45
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

"------------------------------------------------------------------------------
"PRETTIER
"------------------------------------------------------------------------------
packloadall "enable prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_path = "/usr/bin/prettier"

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

"------------------------------------------------------------------------------
"COLORSCHEME
"------------------------------------------------------------------------------
set t_Co=256
" set termguicolors
" let g:onedark_termcolors=256 "enable 256 colors
" colorscheme onedark  "set colorsheme as onedark

"material theme
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
" let g:material_theme_style = 'darker-community'
" colorscheme material

" let g:doom_one_terminal_colors = v:true
" colorscheme doom-one

let g:gruvbox_contrast_dark = "medium" "default
" let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_improved_strings = 0
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

" let g:gh_color = "soft"
" colorscheme ghdark

"------------------------------------------------------------------------------
"""bash language server
"------------------------------------------------------------------------------
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif

"------------------------------------------------------------------------------
" NICE COC
"------------------------------------------------------------------------------

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,python,py,sh,bash setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>cd  :<C-u>CocCommand fzf-preview.CocDiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cc  :<C-u>CocCommand fzf-preview.CommandPalette<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>co  :<C-u>CocOutline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>cs  :<C-u>CocCommand fzf-preview.BufferLines<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>
" show references with fzf
nnoremap <silent><nowait> <space>cr  :<C-u>CocCommand fzf-preview.CocReferences<CR>
" show implementations with fzf
nnoremap <leader><nowait> <space>ci  :<C-U>CocCommand fzf-preview.CocImplementations<Cr>

"------------------------------------------------------------------------------
"which key
"------------------------------------------------------------------------------
set timeoutlen=400
"------------------------------------------------------------------------------
" dadbod ui
"------------------------------------------------------------------------------
let g:db_ui_save_location = '~/.sql'
"------------------------------------------------------------------------------
" Floaterm
"------------------------------------------------------------------------------
let g:floaterm_width = 0.80
let g:floaterm_height = 0.88
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'

let g:floaterm_autoclose = 1
" let g:floaterm_autohide = 2

"------------------------------------------------------------------------------
" custom commands
"------------------------------------------------------------------------------
command! Reload execute "source ~/.vimrc"
command! Config execute ":e ~/.vimrc"
command! Env execute ":Dotenv .env"
command! MakeTags !ctags -R .
command! Ovewrite execute ":w !sudo tee %"
command! Aniwrapper execute ":FloatermNew aniwrapper -qtdoomone -D 144"
"------------------------------------------------------------------------------
"KEYBINDINGS
"------------------------------------------------------------------------------
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" imap <TAB> <C-N>
nmap <F4> :set paste!<Bar>set paste?<CR>
nmap <F5> :!
nmap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nmap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nmap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-T> :wa<CR>:vertical botright term ++kill=term<CR>
nmap <C-T> :wa<CR>:FloatermToggle floatingterm<CR>
tnoremap <C-T> <C-\><C-n>:FloatermToggle floatingterm<CR>
nmap Q !!$SHELL<CR>

" reselect visual selection after indent
vnoremap < <gv
vnoremap > >gv

" open file under cursor, create if necessary
nnoremap gF :view <cfile><cr>

" fzf
nnoremap // :CocCommand fzf-preview.Lines<CR>
nnoremap ?? :CocCommand fzf-preview.BufferLines<CR>

" search fzf, refs, impls, defs
nmap <leader>ff :CocCommand fzf-preview.ProjectFiles<CR>
" aniwrapper/ani-cli (until i find better use for a keys)
nmap <leader>as :FloatermNew --title=aniwrapper aniwrapper -qtdoomone -D144<CR>
nmap <leader>ad :FloatermNew --title=aniwrapper ani-cli -q720p -cd/home/sudacode/Videos/sauce -D144<CR>
" buffers
nmap <leader>bB :CocCommand fzf-preview.AllBuffers<CR>
nmap <leader>bb :CocCommand fzf-preview.Buffers<CR>
nmap <leader>bk :bdelete<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>
nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
" git
nmap <leader>gc :CocCommand fzf-preview.GitLogs<CR>
nmap <leader>gf :CocCommand fzf-preview.GitFiles<CR>
nmap <leader>gg :FloatermNew --title=lazygit --opener=vsplit --width=1.0 --height=1.0 lazygit<CR>
nmap <leader>gs :CocCommand fzf-preview.GitStatus<CR>
" help/history
nmap <leader>hc :CocCommand fzf-preview.CommandPalette<CR>
nmap <leader>hk :Maps<CR>
" insert snippets
nmap <leader>isp :-1read $HOME/Templates/python.py<CR>4jw
" any jump plugin
nmap <leader>j  :AnyJump<CR>
" toggle/open
nmap <leader>ob :FloatermNew --title=bpytop --opener=vsplit bpytop<CR>
nmap <leader>od :FloatermNew --title=lazydocker --opener=vsplit lazydocker<CR>
nmap <leader>on :FloatermNew --title=ncmpcpp --opener=vsplit ncmpcpp<CR>
nmap <leader>oo :OverCommandLine<CR>
nmap <leader>or :FloatermNew --title=ranger --opener=vsplit ranger --cmd="cd $PWD"<CR>
" nmap <leader>ot :vertical botright ter ++kill=terminal ++close<CR>
nmap <leader>ot :FloatermNew --title=floaterm --name=vsplit-term --wintype=vsplit --position=botright --width=0.5<CR>

" search
nmap <leader>sc :nohls<Cr>
" toggle coc outline
nmap <leader>to :CocOutline<CR>
nmap <leader>tt :FloatermToggle vsplit-term<CR>
tnoremap <leader>tt <C-\><C-N>:FloatermToggle vsplit-term<CR>
