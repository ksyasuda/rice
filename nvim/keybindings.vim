nmap <F4> :set paste!<Bar>set paste?<CR>
nmap <F5> :!

" reselect visual selection after indent
vnoremap < <gv
vnoremap > >gv

" for toggling/hiding the split-term
tnoremap <C-T> <C-\><C-n>:FloatermToggle floatterm<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>tt <C-\><C-N>:FloatermToggle split-term<CR>
tnoremap <leader>tf <C-\><C-N>:FloatermToggle floatterm<CR>
tnoremap <leader>tp <C-\><C-N>:FloatermToggle ipython<CR>
tnoremap <leader>tP <C-\><C-N>:FloatermToggle ipython-full<CR>

nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
nmap <C-T> :wa<CR>:FloatermToggle floatterm<CR>

" open file under cursor, create if necessary
nnoremap // :Telescope current_buffer_fuzzy_find<CR>
nnoremap ?? :BLines<CR>

nmap gA :lua vim.lsp.buf.code_actions()<CR>
nmap gd :Telescope lsp_definitions<CR>
nmap gDc :Telescope lsp_implementations<CR>
nmap gDf :Telescope lsp_definitions<CR>
nmap gF :edit <cfile><cr>
nmap gT :Telescope lsp_type_definitions<CR>
nmap gb :Gitsigns blame_line<CR>
" nmap gd :lua vim.lsp.buf.definition()<CR>
nmap gi :Telescope lsp_implementations<CR>
nmap gj :Telescope jumplist<CR>
nmap gl :lua vim.lsp.buf.code_lens()<CR>
nmap gr :Telescope lsp_references<CR>
nmap gs :lua vim.lsp.buf.signature_help()<CR>

nmap Q !!$SHELL<CR>

nmap rn :lua vim.lsp.buf.rename()<CR>

nmap <leader>as :FloatermNew --title=aniwrapper aniwrapper -qtdoomone -D144<CR>
nmap <leader>ad :FloatermNew --title=aniwrapper ani-cli -q720p -cd/home/sudacode/Videos/sauce -D144<CR>

nmap <leader>bb :Telescope buffers<CR>
nmap <leader>bk :bdelete<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>

nmap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nmap <leader>cc :vert Copilot<CR>
nmap <leader>cd :Telescope diagnostics<CR>
" nmap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>
nmap <silent> <Leader>fa :DashboardFindWord<CR>
nmap <silent> <Leader>fb :DashboardJumpMark<CR>
nmap <silent> <Leader>fh :DashboardFindHistory<CR>

nmap <leader>gb :Gitsigns blame_line<CR>
nmap <leader>gc :Telescope git_commits<CR>
nmap <leader>gf :Telescope git_files<CR>
" nmap <leader>gg :Neogit<CR>
nmap <leader>gg :FloatermNew --title=lazygit --width=1.0 --height=1.0 --opener=vsplit lazygit<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gR <cmd>Telescope lsp_references<cr>
nnoremap gpc <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>

nmap <leader>hc :Telescope commands<CR>
nmap <leader>hh :Telescope tags<CR>
nmap <leader>hk :Telescope keymaps<CR>
nmap <leader>hs :Telescope spell_suggest<CR>

nmap <leader>isp :-1read $HOME/Templates/python.py<CR>4jw

nmap <leader>j :AnyJump<CR>

" nmap K :DocsViewToggle<CR>
nmap K :lua vim.lsp.buf.hover()<CR>

nmap <leader>ld :Telescope lsp_definitions<CR>
nmap <leader>la :lua vim.lsp.buf.code_action()<CR>
nmap <leader>lci :Telescope lsp_incoming_calls<CR>
nmap <leader>lco :Telescope lsp_outgoing_calls<CR>
nmap <leader>lh :lua vim.lsp.buf.signature_help()<CR>
nmap <leader>li :Telescope lsp_implementations<CR>
nmap <leader>lr :Telescope lsp_references<CR>
nmap <leader>lR :lua vim.lsp.buf.rename()<CR>
nmap <leader>ls :Telescope lsp_document_symbols<CR>
nmap <leader>lt :Telescope lsp_type_definitions<CR>
nmap <leader>lw :Telescope lsp_dynamic_workspace_symbols<CR>

nmap <leader>n :NvimTreeToggle<CR>

nmap <leader>ob :FloatermNew --title=bpytop --opener=vsplit bpytop<CR>
nmap <leader>od :FloatermNew --title=lazydocker --opener=vsplit lazydocker<CR>
nmap <leader>of :wa<CR>:FloatermToggle floatterm<CR>
nmap <leader>oh :FloatermNew --title=floaterm --name=split-term --opener=edit --wintype=split --position=botright --height=0.45<CR>
nmap <leader>on :FloatermNew --title=ncmpcpp --opener=vsplit ncmpcpp<CR>
nmap <leader>op :FloatermNew --title=ipython --name=ipython --opener=split --wintype=vsplit --position=botright --width=0.5 ipython<CR>
nmap <leader>oP :FloatermNew --title=ipython-full --name=ipython-full --opener=edit --width=1.0 --height=1.0 ipython<CR>
nmap <leader>or :FloatermNew --title=ranger --opener=vsplit ranger --cmd="cd $PWD"<CR>
nmap <leader>ot :FloatermNew --title=floaterm --name=split-term --opener=edit --wintype=vsplit --position=botright --width=0.5<CR>

nmap <leader>r :NvimTreeRefresh<CR>

nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <leader>sc :nohls<Cr>
nmap <leader>sC :Telescope commands<Cr>
nmap <leader>sf :Telescope find_files<Cr>
nmap <leader>sh :Telescope command_history<CR>
nmap <leader>sm :Telescope man_pages<CR>
nmap <leader>s/ :Telescope search_history<CR>

nnoremap <silent> <Leader>tc :Telescope colorscheme<CR>
nmap <leader>tf :wa<CR>:FloatermToggle floatterm<CR>
nmap <leader>to :SymbolsOutline<CR>
nmap <leader>tp :FloatermToggle ipython<CR>
nmap <leader>tP :FloatermToggle ipython-full<CR>
nmap <leader>tt :FloatermToggle split-term<CR>

nmap <leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nmap <leader>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nmap <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>

" nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
" nnoremap <leader>xx <cmd>TroubleToggle<cr>

nmap <leader>y "+
vmap <leader>y "+
