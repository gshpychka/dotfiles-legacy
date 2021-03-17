nnoremap <Leader>ss :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>e :IPythonCellRun<CR>
nnoremap <Leader>p :IPythonCellExecuteCellJump<CR>
nnoremap <Leader>P :IPythonCellExecuteCell<CR>
nnoremap <Leader>c :IPythonCellClear<CR>
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend
" map <Leader>p to run the previous command
" nnoremap <Leader>p :IPythonCellPrevCommand<CR>
" map <Leader>q to restart ipython
nnoremap <Leader>q :IPythonCellRestart<CR>
" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>
" map <Leader>Q to exit debug mode or IPython
nnoremap <Leader>Q :SlimeSend1 exit<CR>

" Key mapping
nnoremap <silent> <C-f> :NERDTreeToggle<CR>
" nnoremap <silent> <C-b> :TagbarToggle<CR>
nnoremap <silent> <C-b> :Vista!!<CR>
" switch buffer if focused on NERDTree and bring up FZF
nnoremap <silent> <expr> <C-t> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <expr> <C-r> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
" clear search highlighting
nnoremap <silent> <esc> :noh<CR><esc>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
