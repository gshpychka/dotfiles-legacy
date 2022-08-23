nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h10
if exists('g:neovide')
    let g:neovide_cursor_trail_length = 0
    let g:neovide_cursor_animation_length = 0
    let g:neovide_refresh_rate_idle=5
    let g:neovide_scroll_animation_length = 0.5
endif

