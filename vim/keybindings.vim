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
if has('nvim')
  nmap <leader>gg :Neogit<CR>
else
  nmap <leader>gg :FloatermNew --title=lazygit --opener=vsplit --width=1.0 --height=1.0 lazygit<CR>
endif
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
