let g:vimspector_enable_mappings = 'HUMAN'

nnoremap <silent> <C-f> :NERDTreeToggle<CR>
nnoremap <silent> <C-b> :TagbarToggle<CR>
" switch buffer if focused on NERDTree and bring up FZF
nnoremap <silent> <expr> <C-t> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" clear search highlighting
nnoremap <silent> <esc> :noh<CR><esc>
