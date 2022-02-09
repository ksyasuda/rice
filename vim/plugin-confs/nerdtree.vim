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
