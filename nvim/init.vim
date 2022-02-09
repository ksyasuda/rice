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
set timeoutlen=400
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
  " Plug 'chentau/marks.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'github/copilot.vim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'TimUntersberger/neogit'

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'

  Plug 'NTBBloodbath/doom-one.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'projekt0n/github-nvim-theme'
else
  Plug 'ap/vim-buftabline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  Plug 'joshdick/onedark.vim'
  Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
  Plug 'morhetz/gruvbox'
  Plug 'vv9k/vim-github-dark'
endif

call plug#end()

if has('nvim')
  source ~/.config/nvim/plugin-confs/bufferline.lua
  " source ~/.config/nvim/plugin-confs/marks.lua
  source ~/.config/nvim/plugin-confs/whichkey.lua
  source ~/.config/nvim/plugin-confs/dashboard-nvim.lua
  source ~/.config/nvim/plugin-confs/dashboard-art.vim
  source ~/.config/nvim/plugin-confs/nvimtree.lua
  source ~/.config/nvim/plugin-confs/treesitter.lua
  source ~/.config/nvim/plugin-confs/neogit.lua

  " source ~/.config/nvim/plugin-confs/lspconfig.lua
  source ~/.config/nvim/plugin-confs/lsp-signature.lua
  source ~/.config/nvim/symbols-outline.lua
  " source ~/.config/nvim/null-ls.lua

  source ~/.vim/plugin-confs/fzf.vim
  source ~/.vim/plugin-confs/vim-closetag.vim
  source ~/.vim/plugin-confs/wakatime.vim
  source ~/.vim/plugin-confs/lightline.vim
  source ~/.vim/plugin-confs/floaterm.vim

  source ~/.vim/plugin-confs/ale.vim
  source ~/.vim/plugin-confs/coc.vim

  source ~/.config/nvim/plugin-confs/doomone.lua
  source ~/.config/nvim/plugin-confs/dracula.lua
  source ~/.config/nvim/plugin-confs/github-theme.lua

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
  source ~/.vim/plugin-confs/nerdtree.vim
  source ~/.vim/plugin-confs/whichkey.vim
  source ~/.vim/plugin-confs/ale.vim
  source ~/.vim/plugin-confs/fzf.vim
  source ~/.vim/plugin-confs/vim-closetag.vim
  source ~/.vim/plugin-confs/wakatime.vim
  source ~/.vim/plugin-confs/prettier.vim
  source ~/.vim/plugin-confs/lightline.vim
  source ~/.vim/plugin-confs/coc.vim
  source ~/.vim/plugin-confs/floaterm.vim
  if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  endif
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
" custom commands
"------------------------------------------------------------------------------
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden'}), <bang>0))
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir AllFiles
  \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore'}), <bang>0))

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
source ~/.vim/keybindings.vim
