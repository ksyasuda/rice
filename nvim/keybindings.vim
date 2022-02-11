" KEYBINDINGS
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
nnoremap // :Lines<CR>
nnoremap ?? :BLines<CR>

" aniwrapper/ani-cli (until i find better use for a keys)
nmap <leader>as :FloatermNew --title=aniwrapper aniwrapper -qtdoomone -D144<CR>
nmap <leader>ad :FloatermNew --title=aniwrapper ani-cli -q720p -cd/home/sudacode/Videos/sauce -D144<CR>
" buffers
" nmap <leader>bB :CocCommand fzf-preview.AllBuffers<CR>
nmap <leader>bb :Buffers<CR>
nmap <leader>bk :bdelete<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>
nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
nmap <leader>cd :LspDiagnostics <bufnr><CR>
" git
nmap <leader>gc :CocCommand fzf-preview.GitLogs<CR>
nmap <leader>gf :GitFiles<CR>
if has('nvim')
  nmap <leader>gg :Neogit<CR>
else
  nmap <leader>gg :FloatermNew --title=lazygit --opener=vsplit --width=1.0 --height=1.0 lazygit<CR>
endif
" nmap <leader>gs :CocCommand fzf-preview.GitStatus<CR>
" nmap gr  :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap gpc <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" Only set if you have telescope installed
" nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
" help/history
nmap <leader>hc :Commands<CR>
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
nmap <leader>to :SymbolsOutline<CR>
" terminal
nmap <leader>tt :FloatermToggle vsplit-term<CR>
nmap <C-T> :wa<CR>:FloatermToggle floatingterm<CR>
" for toggling/hiding the vsplit-term
tnoremap <leader>tt <C-\><C-N>:FloatermToggle vsplit-term<CR>
tnoremap <C-T> <C-\><C-n>:FloatermToggle floatingterm<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>

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
