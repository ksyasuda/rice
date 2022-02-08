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
set cursorline
set scrolloff=8
set sidescrolloff=8
set wildmenu " show candidates for vim commands with tab
set wildignore=*.o,*.obj,*.bak,*.exe
set background=dark
set showmatch
set nocompatible " no more vi
set list
set listchars=tab:\ ,trail:
" set path from current directory and all directories under
set path=$PWD/**
set encoding=UTF-8
set guifont=FiraCode\ Nerd\ Font\ 18
set expandtab
" coc settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'voldikss/vim-floaterm'
Plug 'pechorin/any-jump.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'maximbaz/lightline-ale'
Plug 'osyo-manga/vim-over'

if has('nvim')
  Plug 'akinsho/bufferline.nvim'
  Plug 'chentau/marks.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'github/copilot.vim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'NTBBloodbath/doom-one.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'projekt0n/github-nvim-theme'
else
  Plug 'ap/vim-buftabline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " vim colorschemes
  Plug 'joshdick/onedark.vim'
  Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
  Plug 'morhetz/gruvbox'
  Plug 'vv9k/vim-github-dark'
endif

call plug#end()

if has('nvim')
  source ~/.config/nvim/plugins/bufferline.lua
  source ~/.config/nvim/plugins/marks.lua
  source ~/.config/nvim/plugins/whichkey.lua
  source ~/.config/nvim/plugins/dashboard-nvim.lua
  source ~/.config/nvim/plugins/nvimtree.lua
  source ~/.config/nvim/plugins/doomone.lua
  " source ~/.config/nvim/plugins/dracula.lua
  " source ~/.config/nvim/plugins/github-theme.lua

  " makes fzf match colorscheme (I think)
  augroup fzf_preview
	autocmd!
	autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
  augroup END

  function! s:fzf_preview_settings() abort
	let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
	let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
  endfunction
  " make terminal not have line numbers
  autocmd TermOpen * setlocal nonumber norelativenumber
else
  source ~/.vim/plugins/nerdtree.vim
  source ~/.vim/plugins/whichkey.vim
endif

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
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-n': 'next',
  \}

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

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden'}), <bang>0))

command! -bang -nargs=? -complete=dir AllFiles
  \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore'}), <bang>0))


"------------------------------------------------------------------------------
"ale
"------------------------------------------------------------------------------

let g:ale_sh_shellcheck_executable = '/usr/bin/shellcheck'
let g:ale_sh_shellcheck_options = '-s bash -o all -e 2250'
let g:ale_sh_shfmt_options = '-i=4 -ci -sr'
let g:ale_fix_on_save = 1
" let g:ale_set_quickfix = 1
let g:ale_virtualenv_dir_names = ['env']

let g:ale_linter_aliases = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript']}
let g:ale_linters = {'javascriptreact': ['css', 'javascript'], 'typescriptreact': ['css', 'javascript'], 'python': ['pylint','pycodestyle', 'pydocstyle'], 'sh': ['shellcheck']}
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'sh': ['shfmt'], 'typescript': ['eslint'], 'python': ['black']}

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
" WAKATIME
"------------------------------------------------------------------------------

let g:wakatime_PythonBinary = '/usr/bin/python'  " (Default: 'python')
let g:wakatime_OverrideCommandPrefix = '/usr/bin/wakatime'  " (Default: '')

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
if has('nvim')
    set termguicolors
    " colorscheme doom-one
    " colorscheme dracula
    colorscheme github_dark
else
    " let g:onedark_termcolors=256 "enable 256 colors
    " colorscheme onedark  "set colorsheme as onedark

    "material theme
    " let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
    " let g:material_terminal_italics = 1
    " let g:material_theme_style = 'darker'
    " colorscheme material
    let g:gruvbox_contrast_dark = "medium" "default
    " let g:gruvbox_contrast_dark = "soft"
    let g:gruvbox_improved_strings = 0
    let g:gruvbox_improved_warnings = 1
    colorscheme gruvbox
endif


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
" show locationlist with fzf_preview
nnoremap <silent><nowait> <space>cl  :<C-u>CocCommand fzf-preview.LocationList<CR>

"------------------------------------------------------------------------------
"which key
"------------------------------------------------------------------------------

set timeoutlen=400

"------------------------------------------------------------------------------
" Floaterm
"------------------------------------------------------------------------------

let g:floaterm_width = 0.80
let g:floaterm_height = 0.88
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'
let g:floaterm_opener = 'edit'

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
" nmap <C-n> :NERDTreeToggle<CR>
nmap <C-n> :NvimTreeToggle<CR>
" nnoremap <C-T> :wa<CR>:vertical botright term ++kill=term<CR>
nmap Q !!$SHELL<CR>

" reselect visual selection after indent
vnoremap < <gv
vnoremap > >gv

" open file under cursor, create if necessary
nnoremap gF :edit <cfile><cr>

" fzf
nnoremap // :CocCommand fzf-preview.Lines<CR>
nnoremap ?? :CocCommand fzf-preview.BufferLines<CR>

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
nmap gr  :<C-u>CocCommand fzf-preview.CocReferences<CR>
" help/history
nmap <leader>hc :CocCommand fzf-preview.CommandPalette<CR>
nmap <leader>hk :Maps<CR>
" insert snippets
nmap <leader>isp :-1read $HOME/Templates/python.py<CR>4jw
" any jump plugin
nmap <leader>j  :AnyJump<CR>
nmap <leader>n :NvimTreeToggle<CR>
" toggle/open
nmap <leader>ob :FloatermNew --title=bpytop --opener=vsplit bpytop<CR>
nmap <leader>od :FloatermNew --title=lazydocker --opener=vsplit lazydocker<CR>
nmap <leader>on :FloatermNew --title=ncmpcpp --opener=vsplit ncmpcpp<CR>
nmap <leader>oo :OverCommandLine<CR>
nmap <leader>or :FloatermNew --title=ranger --opener=vsplit ranger --cmd="cd $PWD"<CR>
" nmap <leader>ot :vertical botright ter ++kill=terminal ++close<CR>
nmap <leader>ot :FloatermNew --title=floaterm --name=vsplit-term --wintype=vsplit --position=botright --width=0.5<CR>
" refresh nvimtree for now
nmap <leader>r :NvimTreeRefresh<CR>
" search
nmap <leader>sc :nohls<Cr>
nmap <leader>sf :Files<Cr>
nmap <leader>sF :AllFiles<Cr>
" toggle coc outline
nmap <leader>to :CocOutline<CR>
" terminal
nmap <leader>tt :FloatermToggle vsplit-term<CR>
nmap <C-T> :wa<CR>:FloatermToggle floatingterm<CR>
" for toggling/hiding the vsplit-term
tnoremap <leader>tt <C-\><C-N>:FloatermToggle vsplit-term<CR>
tnoremap <C-T> <C-\><C-n>:FloatermToggle floatingterm<CR>
tnoremap <Esc> <C-\><C-n>


nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" search fzf, refs, impls, defs
nmap <leader>ff :CocCommand fzf-preview.ProjectFiles<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
