nmap <F4> :set paste!<Bar>set paste?<CR>
nmap <F5> :!

" reselect visual selection after indent
vnoremap < <gv
vnoremap > >gv

" for toggling/hiding the vsplit-term
tnoremap <C-T> <C-\><C-n>:FloatermToggle floatingterm<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>tt <C-\><C-N>:FloatermToggle vsplit-term<CR>

nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
nmap <C-T> :wa<CR>:FloatermToggle floatingterm<CR>
nmap <C-n> :NvimTreeToggle<CR>

" open file under cursor, create if necessary
nnoremap // :Lines<CR>
nnoremap ?? :BLines<CR>

nmap gA :lua vim.lsp.buf.code_actions()<CR>
nmap gDc :lua vim.lsp.buf.declaration()<CR>
nmap gDf :lua vim.lsp.buf.definition()<CR>
nmap gF :edit <cfile><cr>
nmap gT :lua vim.lsp.buf.type_definition()<CR>
nmap gb :lua vim.lsp.buf.document_symbol()<CR>
" nmap gd :lua vim.lsp.buf.definition()<CR>
nmap gi :lua vim.lsp.buf.implementation()<CR>
nmap gl :lua vim.lsp.buf.code_lens()<CR>
nmap gr :lua vim.lsp.buf.references()<CR>
nmap gs :lua vim.lsp.buf.signature_help()<CR>

nmap Q !!$SHELL<CR>

nmap rn :lua vim.lsp.buf.rename()<CR>

nmap <leader>as :FloatermNew --title=aniwrapper aniwrapper -qtdoomone -D144<CR>
nmap <leader>ad :FloatermNew --title=aniwrapper ani-cli -q720p -cd/home/sudacode/Videos/sauce -D144<CR>

nmap <leader>bb :Buffers<CR>
nmap <leader>bk :bdelete<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>

nmap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nmap <leader>cd :LspDiagnostics <bufnr><CR>
nmap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

nmap <leader>ff :CocCommand fzf-preview.ProjectFiles<CR>
nmap <silent> <Leader>fa :DashboardFindWord<CR>
nmap <silent> <Leader>fb :DashboardJumpMark<CR>
nmap <silent> <Leader>fh :DashboardFindHistory<CR>

nmap <leader>gb :GitBlameToggle<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gf :GitFiles<CR>
" nmap <leader>gg :Neogit<CR>
nmap <leader>gg :FloatermNew --title=lazygit --width=1.0 --height=1.0 --opener=vsplit lazygit<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
nnoremap gpc <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>

nmap <leader>hc :Commands<CR>
nmap <leader>hh :Helptags<CR>
nmap <leader>hk :Maps<CR>

nmap <leader>isp :-1read $HOME/Templates/python.py<CR>4jw

nmap <leader>j  :AnyJump<CR>

nmap K :lua vim.lsp.buf.hover()<CR>

nmap <leader>lD :lua vim.lsp.buf.definition()<CR>
nmap <leader>la :lua vim.lsp.buf.code_action()<CR>
nmap <leader>lci :lua vim.lsp.buf.incoming_calls()<CR>
nmap <leader>lco :lua vim.lsp.buf.outgoing_calls()<CR>
nmap <leader>ld :lua vim.lsp.buf.declaration()<CR>
nmap <leader>lh :lua vim.lsp.buf.signature_help()<CR>
nmap <leader>li :lua vim.lsp.buf.implementation()<CR>
nmap <leader>lr :lua vim.lsp.buf.references()<CR>
nmap <leader>lR :lua vim.lsp.buf.rename()<CR>
nmap <leader>ls :lua vim.lsp.buf.document_symbol()<CR>
nmap <leader>lt :lua vim.lsp.buf.type_definition()<CR>
nmap <leader>lw :lua vim.lsp.buf.workspace_symbol()<CR>

nmap <leader>n :NvimTreeToggle<CR>

nmap <leader>ob :FloatermNew --title=bpytop --opener=vsplit bpytop<CR>
nmap <leader>od :FloatermNew --title=lazydocker --opener=vsplit lazydocker<CR>
nmap <leader>on :FloatermNew --title=ncmpcpp --opener=vsplit ncmpcpp<CR>
nmap <leader>or :FloatermNew --title=ranger --opener=vsplit ranger --cmd="cd $PWD"<CR>
nmap <leader>ot :FloatermNew --title=floaterm --name=vsplit-term --wintype=vsplit --position=botright --width=0.5<CR>

nmap <leader>r :NvimTreeRefresh<CR>

nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <leader>sF :AllFiles<Cr>
nmap <leader>sc :nohls<Cr>
nmap <leader>sf :Files<Cr>
nmap <leader>sh :History:<CR>
nmap <leader>s/ :History/<CR>

nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nmap <leader>to :SymbolsOutline<CR>
nmap <leader>tt :FloatermToggle vsplit-term<CR>

nmap <leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nmap <leader>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nmap <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>

nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xx <cmd>TroubleToggle<cr>
