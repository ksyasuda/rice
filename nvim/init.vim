if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" open help and man pages in a vertical split
autocmd FileType help wincmd L
autocmd FileType man wincmd L
" make terminal not have line numbers
autocmd TermOpen * setlocal nonumber norelativenumber

" " " gray
" highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" " blue
" highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
" highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" " light blue
" highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
" highlight! link CmpItemKindInterface CmpItemKindVariable
" highlight! link CmpItemKindText CmpItemKindVariable
" " pink
" highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
" highlight! link CmpItemKindMethod CmpItemKindFunction
" " front
" highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
" highlight! link CmpItemKindProperty CmpItemKindKeyword
" highlight! link CmpItemKindUnit CmpItemKindKeyword
" highlight! PmenuSel guibg=#51afef guifg=NONE
" highlight! Pmenu guifg=#C5CDD9 guibg=#51afef

lua require('settings')
lua require('plugins')
source ~/.config/nvim/keybindings.vim

" nvim plugins
source ~/.config/nvim/plugin-confs/bufferline.lua
source ~/.config/nvim/plugin-confs/dashboard-art.vim
source ~/.config/nvim/plugin-confs/dashboard-nvim.lua
source ~/.config/nvim/plugin-confs/gitsigns.lua
source ~/.config/nvim/plugin-confs/lspfuzzy.lua
source ~/.config/nvim/plugin-confs/lualine.lua
source ~/.config/nvim/plugin-confs/nvimtree.lua
source ~/.config/nvim/plugin-confs/presence.lua
source ~/.config/nvim/plugin-confs/treesitter.lua
source ~/.config/nvim/plugin-confs/whichkey.lua
source ~/.config/nvim/plugin-confs/telescope.lua

source ~/.config/nvim/plugin-confs/code_actions.lua
source ~/.config/nvim/plugin-confs/goto-preview.lua
source ~/.config/nvim/plugin-confs/lsp-kind.lua
source ~/.config/nvim/plugin-confs/lspconfig.lua
source ~/.config/nvim/plugin-confs/lsplines.lua
source ~/.config/nvim/plugin-confs/null-ls.lua
source ~/.config/nvim/plugin-confs/nvim-cmp.lua
source ~/.config/nvim/plugin-confs/fidget.lua
source ~/.config/nvim/plugin-confs/symbols-outline.lua
" source ~/.config/nvim/plugin-confs/copilot.lua
" source ~/.config/nvim/plugin-confs/lsp-signature.lua
" source ~/.config/nvim/plugin-confs/nvim-docs-view.lua

" nvim and vim plugins
source ~/.vim/plugin-confs/floaterm.vim
source ~/.vim/plugin-confs/fzf.vim
source ~/.vim/plugin-confs/vim-closetag.vim
source ~/.vim/plugin-confs/wakatime.vim

source ~/.config/nvim/plugin-confs/doomone.lua
source ~/.config/nvim/plugin-confs/dracula.lua
source ~/.config/nvim/plugin-confs/github-theme.lua
source ~/.config/nvim/plugin-confs/onedarkpro.lua

source ~/.config/nvim/lua/toggle_lsp_diagnostics.lua

" CUSTOM COMMANDS
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh']}), <bang>0)

command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore', 'options': ['--layout=reverse', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh']}), <bang>0))

command! -bang -nargs=? -complete=dir Lines
    \ call fzf#vim#lines(<q-args>, ({'options': ['--layout=reverse']}), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh']}), <bang>0)

command! Reload execute "source ~/.config/nvim/init.vim"
command! Config execute ":e ~/.config/nvim/init.vim"
command! Plugins execute ":e ~/.config/nvim/lua/plugins.lua"
command! Settings execute ":e ~/.config/nvim/lua/settings.lua"
command! Env execute ":Dotenv .env"
command! MakeTags !ctags -R .
command! Ovewrite execute ":w !sudo tee %"
command! Aniwrapper execute ":FloatermNew aniwrapper -qtdoomone -D 144"

set termguicolors
" colorscheme doom-one
colorscheme onedarkpro
